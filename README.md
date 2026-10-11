Custom curtain automation controller powered by an ESP32, a TMC2209 stepper driver, and 12V USB-C Power Delivery negotiation, developed in KiCad for Hack Club's Half Life initiative.

The project overcomes the limitations of proprietary commercial smart curtain units by delivering an open, silent, cost-effective board powered by standard USB-C PD supplies and assembled using hand-solderable 0805 SMD passives and through-hole terminal blocks.

The power subsystem utilizes a CH224K PD sink controller configured to negotiate 12V from the USB-C source. The 12V rail supplies the stepper motor driver stage directly, while an integrated Mini360 step-down buck module drops the 12V rail down to 3.3V for the ESP32-C3 and connected peripheral logic.

Motor motion is managed by a TMC2209 StepStick module seated on standard 16-pin female headers, with dual-phase coil outputs routed to a 4-pin screw terminal. The user interface includes an EC11 rotary encoder with a push button for local physical adjustment. Environmental telemetry (mmWave radar presence sensing and ambient light/climate sensing) connects through dedicated 4-pin screw terminals with I2C and UART buses accompanied by external pull-up resistors. The board also incorporates an NPN-driven 940nm infrared emitter and a PC817 optocoupled input for isolated external triggers.


The production-ready Bill of Materials is provided in SmartCurtain_BOM.csv.

The PCB routing phase initially incorporated an automated pass via Freerouting, which introduced excessive vias and insufficiently thin motor traces. Approximately 80% of the board was subsequently routed manually:

12V power buses and stepper motor coil tracks routed at 0.8 mm width, compliant with IPC-2221 standards to support up to 1.5A with a temperature rise below 10 degrees Celsius.

3.3V logic supply lines routed at 0.4 mm width and digital signal traces at 0.25 mm width.

Mechanical clearances and drill constraints adjusted to eliminate collisions, achieving 0 DRC errors and 0 unrouted nets.


<img width="1666" height="896" alt="image" src="https://github.com/user-attachments/assets/ee2d2672-825f-4753-9477-3d6ed6f3a02f" />

