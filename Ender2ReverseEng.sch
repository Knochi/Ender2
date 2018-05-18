EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:TexasInstruments
LIBS:Symbols
LIBS:Ender2ReverseEng-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 5
Title "Creality Ender 2 reverse engineering schematic"
Date "2018-04-24"
Rev "0.1"
Comp "Boneproductions.de"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Sheet
S 2000 1700 1025 975 
U 5AD5DB90
F0 "Ender 2 Power" 60
F1 "Ender2_Power.sch" 60
$EndSheet
$Sheet
S 6750 1750 1400 1025
U 5ADEEF95
F0 "Ender 2 Stepper Motor Driver" 60
F1 "Ender2_Driver.sch" 60
F2 "X_DIR" I L 6750 1850 60 
F3 "X_STEP" I L 6750 1950 60 
$EndSheet
$Sheet
S 4675 1750 1075 1025
U 5AD6069D
F0 "Ender 2 Microcontroller" 60
F1 "Ender2_MCU.sch" 60
F2 "Stepper_EN" O R 5750 2525 60 
F3 "X_DIR" O R 5750 1850 60 
F4 "X_STEP" O R 5750 1950 60 
$EndSheet
$Sheet
S 6400 4000 1875 1300
U 5ADF7207
F0 "uSD and USB" 60
F1 "Ender2_Data.sch" 60
$EndSheet
$EndSCHEMATC
