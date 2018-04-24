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
Sheet 4 5
Title "Creality Ender 2 reverse engineering schematic"
Date "2018-04-24"
Rev "0.1"
Comp "Boneproductions.de"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L ATMEGA1284P-AU U4
U 1 1 5AD606A8
P 2600 2900
F 0 "U4" H 1750 4780 50  0000 L BNN
F 1 "ATMEGA1284P-AU" H 3000 950 50  0000 L BNN
F 2 "TQFP44" H 2600 2900 50  0001 C CIN
F 3 "" H 2600 2900 50  0001 C CNN
	1    2600 2900
	1    0    0    -1  
$EndComp
Text HLabel 4175 4500 2    60   Output ~ 0
Stepper_EN
Wire Wire Line
	4175 4500 3600 4500
Text HLabel 4175 3500 2    60   Output ~ 0
X_DIR
Text HLabel 4175 4600 2    60   Output ~ 0
X_STEP
Wire Wire Line
	4175 3500 3600 3500
Wire Wire Line
	4175 4600 3600 4600
Text HLabel 4175 3700 2    60   Output ~ 0
Y_DIR
Wire Wire Line
	4175 3700 3600 3700
Text HLabel 4175 3600 2    60   Output ~ 0
Y_STEP
Wire Wire Line
	4175 3600 3600 3600
Text HLabel 4175 2300 2    60   Output ~ 0
Z_DIR
Text HLabel 4175 2400 2    60   Output ~ 0
Z_STEP
Wire Wire Line
	4175 2300 3600 2300
Wire Wire Line
	4175 2400 3600 2400
Text HLabel 4175 2100 2    60   Output ~ 0
E_DIR
Text HLabel 4175 2200 2    60   Output ~ 0
E_STEP
Wire Wire Line
	4175 2100 3600 2100
Wire Wire Line
	4175 2200 3600 2200
$Comp
L CONN_01X02 J10
U 1 1 5ADF09AA
P 7575 3150
F 0 "J10" H 7575 3300 50  0000 C CNN
F 1 "OFF" V 7675 3150 50  0000 C CNN
F 2 "Connector_JST:JST_XH_B02B-XH-A_1x02_P2.50mm_Horizontal" H 7575 3150 50  0001 C CNN
F 3 "" H 7575 3150 50  0001 C CNN
	1    7575 3150
	1    0    0    1   
$EndComp
$Comp
L CONN_01X02 J9
U 1 1 5ADF0A01
P 6825 3250
F 0 "J9" H 6825 3400 50  0000 C CNN
F 1 "X_STOP" V 6925 3250 50  0000 C CNN
F 2 "" H 6825 3250 50  0001 C CNN
F 3 "" H 6825 3250 50  0001 C CNN
	1    6825 3250
	1    0    0    1   
$EndComp
$Comp
L CONN_01X02 J8
U 1 1 5ADF0A30
P 6175 3350
F 0 "J8" H 6175 3500 50  0000 C CNN
F 1 "Y-STOP" V 6275 3350 50  0000 C CNN
F 2 "" H 6175 3350 50  0001 C CNN
F 3 "" H 6175 3350 50  0001 C CNN
	1    6175 3350
	1    0    0    1   
$EndComp
$Comp
L CONN_01X02 J5
U 1 1 5ADF0A5A
P 5625 3450
F 0 "J5" H 5625 3600 50  0000 C CNN
F 1 "Z-STOP" V 5725 3450 50  0000 C CNN
F 2 "" H 5625 3450 50  0001 C CNN
F 3 "" H 5625 3450 50  0001 C CNN
	1    5625 3450
	1    0    0    1   
$EndComp
$Comp
L GND #PWR23
U 1 1 5ADF0BFB
P 7275 3275
F 0 "#PWR23" H 7275 3025 50  0001 C CNN
F 1 "GND" H 7275 3125 50  0000 C CNN
F 2 "" H 7275 3275 50  0001 C CNN
F 3 "" H 7275 3275 50  0001 C CNN
	1    7275 3275
	1    0    0    -1  
$EndComp
Wire Wire Line
	7275 3275 7275 3200
Wire Wire Line
	7275 3200 7375 3200
Wire Wire Line
	7375 3100 3600 3100
Wire Wire Line
	6625 3200 3600 3200
$Comp
L GND #PWR22
U 1 1 5ADF0E0B
P 6550 3350
F 0 "#PWR22" H 6550 3100 50  0001 C CNN
F 1 "GND" H 6550 3200 50  0000 C CNN
F 2 "" H 6550 3350 50  0001 C CNN
F 3 "" H 6550 3350 50  0001 C CNN
	1    6550 3350
	1    0    0    -1  
$EndComp
Wire Wire Line
	6625 3300 6550 3300
Wire Wire Line
	6550 3300 6550 3350
$Comp
L GND #PWR21
U 1 1 5ADF0EDA
P 5875 3450
F 0 "#PWR21" H 5875 3200 50  0001 C CNN
F 1 "GND" H 5875 3300 50  0000 C CNN
F 2 "" H 5875 3450 50  0001 C CNN
F 3 "" H 5875 3450 50  0001 C CNN
	1    5875 3450
	1    0    0    -1  
$EndComp
Wire Wire Line
	5975 3400 5875 3400
Wire Wire Line
	5875 3400 5875 3450
Wire Wire Line
	5975 3300 3600 3300
Wire Wire Line
	5425 3400 3600 3400
$Comp
L GND #PWR18
U 1 1 5ADF1007
P 5300 3575
F 0 "#PWR18" H 5300 3325 50  0001 C CNN
F 1 "GND" H 5300 3425 50  0000 C CNN
F 2 "" H 5300 3575 50  0001 C CNN
F 3 "" H 5300 3575 50  0001 C CNN
	1    5300 3575
	1    0    0    -1  
$EndComp
Wire Wire Line
	5425 3500 5300 3500
Wire Wire Line
	5300 3500 5300 3575
$Comp
L CONN_02X05 J12
U 1 1 5ADF108D
P 9550 2100
F 0 "J12" H 9550 2400 50  0000 C CNN
F 1 "PANEL" H 9550 1800 50  0000 C CNN
F 2 "Connector_IDC:IDC-Header_2x05_P2.54mm_Vertical" H 9550 900 50  0001 C CNN
F 3 "" H 9550 900 50  0001 C CNN
	1    9550 2100
	1    0    0    -1  
$EndComp
Text GLabel 4450 3000 2    60   BiDi ~ 0
PC0
Wire Wire Line
	4450 3000 3600 3000
Text GLabel 1250 1200 0    60   Input ~ 0
~RESET
Wire Wire Line
	1250 1200 1600 1200
$Comp
L CONN_02X03 J11
U 1 1 5ADF1207
P 9550 1350
F 0 "J11" H 9550 1550 50  0000 C CNN
F 1 "ISP" H 9550 1150 50  0000 C CNN
F 2 "" H 9550 150 50  0001 C CNN
F 3 "" H 9550 150 50  0001 C CNN
	1    9550 1350
	1    0    0    -1  
$EndComp
Text GLabel 8975 1450 0    60   Output ~ 0
~RESET
Text GLabel 10025 2000 2    60   Output ~ 0
~RESET
Wire Wire Line
	9300 1450 8975 1450
Wire Wire Line
	9800 2000 10025 2000
$Comp
L +5V #PWR25
U 1 1 5ADF1363
P 9975 1100
F 0 "#PWR25" H 9975 950 50  0001 C CNN
F 1 "+5V" H 9975 1240 50  0000 C CNN
F 2 "" H 9975 1100 50  0001 C CNN
F 3 "" H 9975 1100 50  0001 C CNN
	1    9975 1100
	1    0    0    -1  
$EndComp
Wire Wire Line
	9975 1100 9975 1250
Wire Wire Line
	9975 1250 9800 1250
$Comp
L +5V #PWR26
U 1 1 5ADF1410
P 9975 1775
F 0 "#PWR26" H 9975 1625 50  0001 C CNN
F 1 "+5V" H 9975 1915 50  0000 C CNN
F 2 "" H 9975 1775 50  0001 C CNN
F 3 "" H 9975 1775 50  0001 C CNN
	1    9975 1775
	1    0    0    -1  
$EndComp
Wire Wire Line
	9800 2300 9975 2300
Wire Wire Line
	9975 2300 9975 1775
$Comp
L GND #PWR24
U 1 1 5ADF1465
P 9175 2475
F 0 "#PWR24" H 9175 2225 50  0001 C CNN
F 1 "GND" H 9175 2325 50  0000 C CNN
F 2 "" H 9175 2475 50  0001 C CNN
F 3 "" H 9175 2475 50  0001 C CNN
	1    9175 2475
	1    0    0    -1  
$EndComp
Wire Wire Line
	9175 2475 9175 2300
Wire Wire Line
	9175 2300 9300 2300
Text GLabel 8975 1250 0    60   Output ~ 0
MISO
Wire Wire Line
	9300 1250 8975 1250
Text GLabel 4175 2700 2    60   Input ~ 0
MISO
Wire Wire Line
	4175 2700 3600 2700
Text GLabel 3925 2600 2    60   Output ~ 0
MOSI
Wire Wire Line
	3925 2600 3600 2600
Text GLabel 3925 2800 2    60   Output ~ 0
SCK
Wire Wire Line
	3925 2800 3600 2800
Text GLabel 8575 1350 0    60   Input ~ 0
SCK
Wire Wire Line
	8575 1350 9300 1350
$Comp
L GND #PWR27
U 1 1 5ADF173E
P 10150 1500
F 0 "#PWR27" H 10150 1250 50  0001 C CNN
F 1 "GND" H 10150 1350 50  0000 C CNN
F 2 "" H 10150 1500 50  0001 C CNN
F 3 "" H 10150 1500 50  0001 C CNN
	1    10150 1500
	1    0    0    -1  
$EndComp
Wire Wire Line
	10150 1500 10150 1450
Wire Wire Line
	10150 1450 9800 1450
Text GLabel 10175 1350 2    60   Input ~ 0
MOSI
Wire Wire Line
	10175 1350 9800 1350
Text GLabel 8575 1900 0    60   Input ~ 0
SCK
Wire Wire Line
	8575 1900 9300 1900
Text GLabel 10025 2200 2    60   Input ~ 0
MOSI
Wire Wire Line
	10025 2200 9800 2200
Text GLabel 10400 2100 2    60   BiDi ~ 0
PA1
Wire Wire Line
	10400 2100 9800 2100
Text GLabel 10400 1900 2    60   BiDi ~ 0
PC0
Wire Wire Line
	10400 1900 9800 1900
Text GLabel 8850 2000 0    60   BiDi ~ 0
PD3
Text GLabel 9125 2100 0    60   BiDi ~ 0
PD2
Text GLabel 8850 2200 0    60   BiDi ~ 0
PA3
Wire Wire Line
	8850 2000 9300 2000
Wire Wire Line
	9125 2100 9300 2100
Wire Wire Line
	8850 2200 9300 2200
$Comp
L CONN_01X02 J7
U 1 1 5ADF1F6A
P 5950 1850
F 0 "J7" H 5950 2000 50  0000 C CNN
F 1 "B-MOT" V 6050 1850 50  0000 C CNN
F 2 "" H 5950 1850 50  0001 C CNN
F 3 "" H 5950 1850 50  0001 C CNN
	1    5950 1850
	1    0    0    1   
$EndComp
$Comp
L CONN_01X02 J4
U 1 1 5ADF200A
P 5400 1950
F 0 "J4" H 5400 2100 50  0000 C CNN
F 1 "E-TEMP" V 5500 1950 50  0000 C CNN
F 2 "" H 5400 1950 50  0001 C CNN
F 3 "" H 5400 1950 50  0001 C CNN
	1    5400 1950
	1    0    0    1   
$EndComp
Wire Wire Line
	5200 1900 3600 1900
Wire Wire Line
	5750 1800 3600 1800
$Comp
L GND #PWR17
U 1 1 5ADF2124
P 5100 2075
F 0 "#PWR17" H 5100 1825 50  0001 C CNN
F 1 "GND" H 5100 1925 50  0000 C CNN
F 2 "" H 5100 2075 50  0001 C CNN
F 3 "" H 5100 2075 50  0001 C CNN
	1    5100 2075
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR20
U 1 1 5ADF2153
P 5675 1975
F 0 "#PWR20" H 5675 1725 50  0001 C CNN
F 1 "GND" H 5675 1825 50  0000 C CNN
F 2 "" H 5675 1975 50  0001 C CNN
F 3 "" H 5675 1975 50  0001 C CNN
	1    5675 1975
	1    0    0    -1  
$EndComp
Wire Wire Line
	5750 1900 5675 1900
Wire Wire Line
	5675 1900 5675 1975
Wire Wire Line
	5200 2000 5100 2000
Wire Wire Line
	5100 2000 5100 2075
$Comp
L CONN_01X02 J6
U 1 1 5ADF21F1
P 5925 1450
F 0 "J6" H 5925 1600 50  0000 C CNN
F 1 "CHECK" V 6025 1450 50  0000 C CNN
F 2 "" H 5925 1450 50  0001 C CNN
F 3 "" H 5925 1450 50  0001 C CNN
	1    5925 1450
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR19
U 1 1 5ADF2254
P 5650 1575
F 0 "#PWR19" H 5650 1325 50  0001 C CNN
F 1 "GND" H 5650 1425 50  0000 C CNN
F 2 "" H 5650 1575 50  0001 C CNN
F 3 "" H 5650 1575 50  0001 C CNN
	1    5650 1575
	1    0    0    -1  
$EndComp
Wire Wire Line
	5650 1575 5650 1500
Wire Wire Line
	5650 1500 5725 1500
Wire Wire Line
	3600 1400 5725 1400
$Comp
L GND #PWR16
U 1 1 5ADF25E5
P 2300 5150
F 0 "#PWR16" H 2300 4900 50  0001 C CNN
F 1 "GND" H 2300 5000 50  0000 C CNN
F 2 "" H 2300 5150 50  0001 C CNN
F 3 "" H 2300 5150 50  0001 C CNN
	1    2300 5150
	1    0    0    -1  
$EndComp
Wire Wire Line
	2300 4900 2300 5050
Wire Wire Line
	2300 5050 2300 5150
Wire Wire Line
	2400 4900 2400 5050
Wire Wire Line
	2300 5050 2400 5050
Wire Wire Line
	2400 5050 2500 5050
Wire Wire Line
	2500 5050 2600 5050
Connection ~ 2300 5050
Wire Wire Line
	2500 5050 2500 4900
Connection ~ 2400 5050
Wire Wire Line
	2600 5050 2600 4900
Connection ~ 2500 5050
Text HLabel 4175 4300 2    60   Output ~ 0
HotBed_PWM
Text HLabel 4175 4400 2    60   Output ~ 0
Nozzle_PWM
Text HLabel 4175 2500 2    60   Output ~ 0
KFAN_LSR_PWM
Wire Wire Line
	3600 2500 4175 2500
Wire Wire Line
	3600 4300 4175 4300
Wire Wire Line
	3600 4400 4175 4400
Text GLabel 3925 4200 2    60   BiDi ~ 0
PD3
Text GLabel 4175 4100 2    60   BiDi ~ 0
PD2
Text GLabel 4125 1500 2    60   BiDi ~ 0
PA3
Text GLabel 4125 1300 2    60   BiDi ~ 0
PA1
Wire Wire Line
	4125 1300 3600 1300
Wire Wire Line
	4125 1500 3600 1500
Wire Wire Line
	3925 4200 3600 4200
Wire Wire Line
	4175 4100 3600 4100
$EndSCHEMATC
