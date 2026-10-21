## SmartCurtain

SmartCurtain is an open-source, automated curtain controller designed for smooth, quiet, and reliable operation. Built around the ESP32 microcontroller, it integrates stepper motor drive with stall detection, physical controls, Home Assistant integration via ESPHome/MQTT, and a modular 3D-printed transmission system.

---

## Features

- **Microcontroller:** ESP32-based core with Wi-Fi and Bluetooth connectivity.
- **Motor Control:** TMC2209 silent stepper motor driver for ultra-quiet movement, customizable microstepping, and stall detection.
- **Local Control:** Rotary encoder (EC11) with integrated push-button for local open/close and fine-tuning.
- **Smart Integration:** Fully compatible with Home Assistant (ESPHome / MQTT) for scheduled routines, presence detection, and sunrise/sunset automation.
- **Hardware & Enclosure:** Fully parametric 3D-printable parts designed in OpenSCAD with integrated cable routing, belt tensioning, and secure wall/track mounting.

---

## Repository Structure

├── BOM.csv                       # Project Bill of Materials
├── JOURNAL.md                   # Build log and design development notes
├── PCB/                         # KiCad design files, ERC/DRC reports
│   ├── SmartCurtain.kicad_sch   # Schematic file
│   ├── SmartCurtain.kicad_pcb   # PCB layout file
│   └── Fabrication/             # Gerbers, drill files, Pick & Place, BOM
├── Print Files/                 # 3D modeling source files and printable STLs
│   ├── smartcurtain.scad        # Parametric OpenSCAD master file
│   └── STL/                     # Ready-to-slice STL meshes
└── SmartCurtain_firmware/       # Source code and Home Assistant integration
    ├── SmartCurtain_firmware.ino
    └── SmartCurtain_configuration.yaml

---

## Hardware and Schematic
### Schematic Overview
The board integrates power regulation, the ESP32 module, the TMC2209 driver stage, and connectors for peripherals (encoder, endstops/sensors, mmWave presence sensor).

<img width="3508" height="2480" alt="schema pcb" src="https://github.com/user-attachments/assets/b309114a-4267-47a3-95e9-9a7cda9c91fa" />

### PCB Layout and 3D Render
- Layers: 2-layer FR4 design
- Clearance & Trace Widths: Verified via KiCad DRC/ERC reports (see PCB/DRC.rpt and PCB/ERC.rpt)

<img width="1159" height="789" alt="Immagine 2026-10-19 223616" src="https://github.com/user-attachments/assets/8c7a9fa5-0c40-4a7e-bea6-8091e4627ed9" />

## 3D Printing and Mechanical Assembly
All 3D parts are modeled in OpenSCAD and exported to Print Files/STL/:
- smartcurtain_base.stl and smartcurtain_lid.stl: Main electronics and motor enclosure.
- smartcurtain_drive_pulley.stl and smartcurtain_idler_pulley.stl: Timing belt drive system.
- smartcurtain_idler_bracket.stl and smartcurtain_idler_carriage.stl: Belt tensioner assembly.
- smartcurtain_trolley.stl and smartcurtain_track_adapter.stl: Curtain track mounting and trolley interface.
- smartcurtain_fit_test_coupon.stl and smartcurtain_pulley_coupon.stl: Quick test prints for verifying tolerances before full printing.

<img width="1445" height="730" alt="image" src="https://github.com/user-attachments/assets/266416e7-b67a-48c6-95f8-e59bef4bc465" />


### Recommended Print Settings
- Material: PETG (recommended for heat and mechanical resistance)
- Layer Height: 0.20 mm
- Infill: 15% (Gyroid) (for the mechanical 100%)
- Perimeters/Walls: 4 walls for mechanical rigidity

## Firmware
1. Open SmartCurtain_firmware/SmartCurtain_firmware.ino in Arduino IDE or PlatformIO.
2. Install required dependencies (ESP32 board package, AccelStepper / TMCStepper).
3. Configure your pin definitions matching SmartCurtain.kicad_sch.

## Home Assistant Integration:
Import SmartCurtain_firmware/SmartCurtain_configuration.yaml into your ESPHome or Home Assistant configuration.
Follow on-screen discovery to calibrate travel limits and assign entities.

<img width="706" height="535" alt="image" src="https://github.com/user-attachments/assets/77c06fbd-b106-4d0e-88d3-c6455cdaf571" />


## Bill of Materials (BOM)
A complete breakdown of components, ratings, and part numbers can be found in 'BOM.csv' and 'PCB/Fabrication/SmartCurtain_BOM.csv'
