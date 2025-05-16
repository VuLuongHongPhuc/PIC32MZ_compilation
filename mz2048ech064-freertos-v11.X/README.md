# PIC32MZ2048ECH064
This MCU model is no longer supported by MCC generator. 

Configuration:
- external EC 24MHz
- FreeRTOS v10.5.1

System configuration:
- SYSCLK = 100MHz
- PBCLK1 = 50MHz
- PBCLK2 = 50MHz
- PBCLK3 = 50MHz
- PBCLK4 = 50MHz
- PBCLK5 = 50MHz
- PBCLK7 = 100MHz
- PBCLK8 = 50MHz
- USB Clock = 48MHz

LED configuration:
- RF3 pin.38 LED1
- RF4 pin.41 LED2
- RF5 pin.42 LED3

SPI configuration for TFT 2.2" ILI9341:
- RD9----CS
- RD10---RESET
- RD11---DC
- RD0----SDI/MOSI
- RD1----SCK
- RD2----LED
- RD3----SDO/MISO