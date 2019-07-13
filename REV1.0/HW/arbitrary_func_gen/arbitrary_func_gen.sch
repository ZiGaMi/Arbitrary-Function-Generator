EESchema Schematic File Version 4
LIBS:arbitrary_func_gen-cache
EELAYER 29 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 5
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Sheet
S 2550 3175 1350 725 
U 5D27693E
F0 "Power" 50
F1 "Power.sch" 50
$EndSheet
Text Notes 7025 6950 0    157  ~ 31
TOP 
Text Notes 8100 7650 0    59   ~ 12
11.07.2019
Text Notes 10550 7650 0    59   ~ 12
1.0
Text Notes 7350 7500 0    59   ~ 12
Arbitrary function generator
$Sheet
S 4175 3175 1350 725 
U 5D277127
F0 "FPGA" 50
F1 "FPGA.sch" 50
$EndSheet
$Sheet
S 5800 3175 1350 725 
U 5D277181
F0 "MCU" 50
F1 "MCU.sch" 50
$EndSheet
$Sheet
S 7400 3175 1350 725 
U 5D2771CA
F0 "DAC" 50
F1 "DAC.sch" 50
$EndSheet
Text GLabel 1675 1375 2    50   BiDi ~ 0
VBUS
Text GLabel 1675 1575 2    50   BiDi ~ 0
D+
Text GLabel 1675 1675 2    50   BiDi ~ 0
D-
Wire Wire Line
	1500 1375 1675 1375
Wire Wire Line
	1500 1575 1675 1575
Wire Wire Line
	1500 1675 1675 1675
$Comp
L Connector:USB_B_Micro J1
U 1 1 5D29D4BB
P 1200 1575
F 0 "J1" H 1257 2042 50  0000 C CNN
F 1 "629105150521_WE" H 1257 1951 50  0000 C CNN
F 2 "footprints:USBMicro_629105150521_WE" H 1350 1525 50  0001 C CNN
F 3 "~" H 1350 1525 50  0001 C CNN
	1    1200 1575
	1    0    0    -1  
$EndComp
Wire Wire Line
	1100 2100 1275 2100
Wire Wire Line
	1100 2425 1275 2425
Wire Wire Line
	1100 2350 1100 2425
Wire Wire Line
	1100 2100 1100 2150
Wire Wire Line
	1275 2150 1275 2100
$Comp
L Device:C_Small C1
U 1 1 5D2A0B89
P 1100 2250
F 0 "C1" H 1300 2200 50  0000 R CNN
F 1 "1n" H 1300 2325 50  0000 R CNN
F 2 "" H 1100 2250 50  0001 C CNN
F 3 "~" H 1100 2250 50  0001 C CNN
	1    1100 2250
	-1   0    0    1   
$EndComp
$Comp
L Device:R_Small R1
U 1 1 5D29FEA1
P 1275 2250
F 0 "R1" H 1334 2296 50  0000 L CNN
F 1 "1M" H 1334 2205 50  0000 L CNN
F 2 "" H 1275 2250 50  0001 C CNN
F 3 "~" H 1275 2250 50  0001 C CNN
	1    1275 2250
	1    0    0    -1  
$EndComp
Text GLabel 1700 2525 2    50   BiDi ~ 0
BUSGND
Wire Wire Line
	1275 2350 1275 2425
Wire Wire Line
	1500 1975 1500 1775
Wire Wire Line
	1500 1975 1500 2525
Connection ~ 1500 1975
Connection ~ 1500 2525
Wire Wire Line
	1500 2525 1700 2525
Wire Wire Line
	1200 1975 1500 1975
Wire Wire Line
	1100 2525 1500 2525
Wire Wire Line
	1100 2525 1100 2425
Connection ~ 1100 2425
Wire Wire Line
	1100 2100 1100 1975
Connection ~ 1100 2100
$EndSCHEMATC
