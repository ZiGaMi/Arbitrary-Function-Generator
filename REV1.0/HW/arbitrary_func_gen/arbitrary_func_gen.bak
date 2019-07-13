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
Text GLabel 1850 1150 2    50   BiDi ~ 0
VBUS
Text GLabel 1850 1350 2    50   BiDi ~ 0
D+
Text GLabel 1850 1450 2    50   BiDi ~ 0
D-
Wire Wire Line
	1675 1150 1850 1150
Wire Wire Line
	1675 1350 1850 1350
Wire Wire Line
	1675 1450 1850 1450
$Comp
L Connector:USB_B_Micro J1
U 1 1 5D29D4BB
P 1375 1350
F 0 "J1" H 1432 1817 50  0000 C CNN
F 1 "629105150521_WE" H 1432 1726 50  0000 C CNN
F 2 "footprints:USBMicro_629105150521_WE" H 1525 1300 50  0001 C CNN
F 3 "~" H 1525 1300 50  0001 C CNN
	1    1375 1350
	1    0    0    -1  
$EndComp
Wire Wire Line
	1275 1875 1450 1875
Wire Wire Line
	1275 2200 1450 2200
Wire Wire Line
	1275 2125 1275 2200
Wire Wire Line
	1275 1875 1275 1925
Wire Wire Line
	1450 1925 1450 1875
$Comp
L Device:C_Small C1
U 1 1 5D2A0B89
P 1275 2025
F 0 "C1" H 1475 1975 50  0000 R CNN
F 1 "1n" H 1475 2100 50  0000 R CNN
F 2 "" H 1275 2025 50  0001 C CNN
F 3 "~" H 1275 2025 50  0001 C CNN
	1    1275 2025
	-1   0    0    1   
$EndComp
$Comp
L Device:R_Small R1
U 1 1 5D29FEA1
P 1450 2025
F 0 "R1" H 1509 2071 50  0000 L CNN
F 1 "1M" H 1509 1980 50  0000 L CNN
F 2 "" H 1450 2025 50  0001 C CNN
F 3 "~" H 1450 2025 50  0001 C CNN
	1    1450 2025
	1    0    0    -1  
$EndComp
Text GLabel 1875 2300 2    50   BiDi ~ 0
BUSGND
Wire Wire Line
	1450 2125 1450 2200
Wire Wire Line
	1675 1750 1675 1550
Wire Wire Line
	1675 1750 1675 2300
Connection ~ 1675 1750
Connection ~ 1675 2300
Wire Wire Line
	1675 2300 1875 2300
Wire Wire Line
	1375 1750 1675 1750
Wire Wire Line
	1275 2300 1675 2300
Wire Wire Line
	1275 2300 1275 2200
Connection ~ 1275 2200
Wire Wire Line
	1275 1875 1275 1750
Connection ~ 1275 1875
$EndSCHEMATC
