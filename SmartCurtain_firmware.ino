#include <WiFi.h>
#include <PubSubClient.h>

//home wifi and server setup
const char* ssid = "WIFI_NAME";
const char* password = "WIFI_PASSWORD";
const char* mqtt_server = "192.168.1.100"; //ip of the server running home assistant

WiFiClient espClient;
PubSubClient client(espClient);

//pin declaration
int STEP_PIN = 0;
int DIR_PIN = 1;
int EN_PIN = 2;

int ENC_A = 4;
int ENC_B = 5;
int ENC_BTN = 6;

int IR_PIN = 7;
int OPTO_PIN = 8;

int RADAR_PIN = 20;
int J3_PIN = 19;

//curtain movement
long currentPosition = 0;
long targetPosition = 0;
long MAX_STEPS = 6000; //total steps to fully open (you need to set up yours)

int lastStateA = LOW;
int lastBtnState = HIGH;
unsigned long lastMqttSend = 0;

void setup() {
  Serial.begin(115200);
  delay(1000);
  Serial.println("Starting SmartCurtain...");

  //motor pins
  pinMode(STEP_PIN, OUTPUT);
  pinMode(DIR_PIN, OUTPUT);
  pinMode(EN_PIN, OUTPUT);
  digitalWrite(EN_PIN, HIGH);

  //rotary encoder pins
  pinMode(ENC_A, INPUT_PULLUP);
  pinMode(ENC_B, INPUT_PULLUP);
  pinMode(ENC_BTN, INPUT_PULLUP);

  //add ons
  pinMode(RADAR_PIN, INPUT); 
  pinMode(OPTO_PIN, INPUT_PULLUP);
  pinMode(IR_PIN, OUTPUT);
  digitalWrite(IR_PIN, LOW);

  lastStateA = digitalRead(ENC_A);

  //wifi connection
  Serial.print("Connecting to ");
  Serial.println(ssid);
  WiFi.begin(ssid, password);

  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.print(".");
  }
  Serial.println("");
  Serial.println("WiFi connected!");
  Serial.println(WiFi.localIP());

  client.setServer(mqtt_server, 1883);
  client.setCallback(callback);
}

//messages from home assistant
void callback(char* topic, byte* payload, unsigned int length) {
  String message = "";
  for (int i = 0; i < length; i++) {
    message += (char)payload[i];
  }
  
  Serial.print("Received MQTT topic: ");
  Serial.print(topic);
  Serial.print(" -> ");
  Serial.println(message);

  if (String(topic) == "homeassistant/cover/smartcurtain/set") {
    if (message == "OPEN") {
      targetPosition = 0;
      Serial.println("Command: OPEN ALL");
    }
    else if (message == "CLOSE") {
      targetPosition = MAX_STEPS;
      Serial.println("Command: CLOSE ALL");
    }
    else if (message == "STOP") {
      targetPosition = currentPosition;
      Serial.println("Command: STOP");
    }
  }

   if (String(topic) == "homeassistant/cover/smartcurtain/set_position") {
    int percentage = message.toInt();
    if (percentage >= 0 && percentage <= 100) {
      targetPosition = (MAX_STEPS * percentage) / 100;
      Serial.print("Moving to percentage: ");
      Serial.println(percentage);
    }
  }
}

void reconnect() {
  while (!client.connected()) {
    Serial.print("Connecting to MQTT broker...");
    if (client.connect("ESP32_SmartCurtain")) {
      Serial.println("connected!");
      
	  client.subscribe("homeassistant/cover/smartcurtain/set");
      client.subscribe("homeassistant/cover/smartcurtain/set_position");
      
	  client.publish("homeassistant/cover/smartcurtain/available", "online");
    } else {
      Serial.print("failed, rc=");
      
	  Serial.print(client.state());
      Serial.println(" retrying in 3 seconds");
      
	  delay(3000);
	  }}}

void moveMotor() {
  if (currentPosition != targetPosition) {
    digitalWrite(EN_PIN, LOW);

    if (targetPosition > currentPosition) {
      digitalWrite(DIR_PIN, HIGH); //close
      digitalWrite(STEP_PIN, HIGH);
      delayMicroseconds(800);
      digitalWrite(STEP_PIN, LOW);
      delayMicroseconds(800);
      currentPosition++;
    } 
    else if (targetPosition < currentPosition) {
      digitalWrite(DIR_PIN, LOW); //open
      digitalWrite(STEP_PIN, HIGH);
      delayMicroseconds(800);
      digitalWrite(STEP_PIN, LOW);
      delayMicroseconds(800);
      currentPosition--;
    }

  } else {
    digitalWrite(EN_PIN, HIGH);
  }
}

void loop() {
  if (!client.connected()) {
    reconnect();
  }
  client.loop();

  //manual encoder
  int stateA = digitalRead(ENC_A);
  if (stateA != lastStateA && stateA == LOW) {
    if (digitalRead(ENC_B) != stateA) {
      targetPosition = targetPosition + 150;
    } else {
      targetPosition = targetPosition - 150;
    }
    if (targetPosition > MAX_STEPS) targetPosition = MAX_STEPS;
    if (targetPosition < 0) targetPosition = 0;
  }
  lastStateA = stateA;
  int btnState = digitalRead(ENC_BTN);
  if (btnState == LOW && lastBtnState == HIGH) {
    delay(50);
    if (currentPosition > (MAX_STEPS / 2)) {
      targetPosition = 0;
    } else {
      targetPosition = MAX_STEPS;
    }
  }
  lastBtnState = btnState;
    
  int radar = digitalRead(RADAR_PIN);
  if (radar == HIGH) {
    /*presence detected near the window
    Serial.println("mmWave radar: motion detected!");*/
  }

  moveMotor();

  if (millis() - lastMqttSend > 2000) {
    lastMqttSend = millis();
    
    int pct = (currentPosition * 100) / MAX_STEPS;
    char bufferPct[10];
    sprintf(bufferPct, "%d", pct);
    client.publish("homeassistant/cover/smartcurtain/position", bufferPct);

    if (currentPosition == 0) {
      client.publish("homeassistant/cover/smartcurtain/state", "open");
    } else if (currentPosition == MAX_STEPS) {
      client.publish("homeassistant/cover/smartcurtain/state", "closed");
    } else {
      client.publish("homeassistant/cover/smartcurtain/state", "open");
    }

    if (radar == HIGH) {
      client.publish("homeassistant/sensor/smartcurtain_radar/state", "ON");
    } else {
      client.publish("homeassistant/sensor/smartcurtain_radar/state", "OFF");
    }
  }
}