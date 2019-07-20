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
S 7550 3975 1350 725 
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
S 7575 5150 1350 725 
U 5D277127
F0 "FPGA" 50
F1 "FPGA.sch" 50
$EndSheet
$Sheet
S 9200 5150 1350 725 
U 5D277181
F0 "MCU" 50
F1 "MCU.sch" 50
$EndSheet
$Sheet
S 9175 3975 1350 725 
U 5D2771CA
F0 "DAC" 50
F1 "DAC.sch" 50
$EndSheet
Text GLabel 1675 1675 2    50   BiDi ~ 0
VBUS
Text GLabel 1675 1875 2    50   BiDi ~ 0
D+
Text GLabel 1675 1975 2    50   BiDi ~ 0
D-
Wire Wire Line
	1500 1675 1675 1675
Wire Wire Line
	1500 1875 1675 1875
Wire Wire Line
	1500 1975 1675 1975
$Comp
L Connector:USB_B_Micro J1
U 1 1 5D29D4BB
P 1200 1875
F 0 "J1" H 1257 2342 50  0000 C CNN
F 1 "629105150521_WE" H 1257 2251 50  0000 C CNN
F 2 "footprints:USBMicro_629105150521_WE" H 1350 1825 50  0001 C CNN
F 3 "~" H 1350 1825 50  0001 C CNN
	1    1200 1875
	1    0    0    -1  
$EndComp
Wire Wire Line
	1100 2400 1275 2400
Wire Wire Line
	1100 2725 1275 2725
Wire Wire Line
	1100 2650 1100 2725
Wire Wire Line
	1100 2400 1100 2450
Wire Wire Line
	1275 2450 1275 2400
$Comp
L Device:C_Small C1
U 1 1 5D2A0B89
P 1100 2550
F 0 "C1" H 1300 2500 50  0000 R CNN
F 1 "1n" H 1300 2625 50  0000 R CNN
F 2 "" H 1100 2550 50  0001 C CNN
F 3 "~" H 1100 2550 50  0001 C CNN
	1    1100 2550
	-1   0    0    1   
$EndComp
$Comp
L Device:R_Small R1
U 1 1 5D29FEA1
P 1275 2550
F 0 "R1" H 1334 2596 50  0000 L CNN
F 1 "1M" H 1334 2505 50  0000 L CNN
F 2 "" H 1275 2550 50  0001 C CNN
F 3 "~" H 1275 2550 50  0001 C CNN
	1    1275 2550
	1    0    0    -1  
$EndComp
Text GLabel 1700 2825 2    50   BiDi ~ 0
BUSGND
Wire Wire Line
	1275 2650 1275 2725
Wire Wire Line
	1500 2275 1500 2075
Wire Wire Line
	1500 2275 1500 2825
Connection ~ 1500 2275
Connection ~ 1500 2825
Wire Wire Line
	1500 2825 1700 2825
Wire Wire Line
	1200 2275 1500 2275
Wire Wire Line
	1100 2825 1500 2825
Wire Wire Line
	1100 2825 1100 2725
Connection ~ 1100 2725
Wire Wire Line
	1100 2400 1100 2275
Connection ~ 1100 2400
$Comp
L Power_Protection:SRV05-4 U6
U 1 1 5D47A862
P 3350 2100
F 0 "U6" H 3350 2781 50  0000 C CNN
F 1 "SRV05-4" H 3350 2690 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23-6" H 4050 1650 50  0001 C CNN
F 3 "http://www.onsemi.com/pub/Collateral/SRV05-4-D.PDF" H 3350 2100 50  0001 C CNN
	1    3350 2100
	1    0    0    -1  
$EndComp
Wire Wire Line
	3350 2600 3350 2725
Wire Wire Line
	3350 2725 3675 2725
Wire Wire Line
	2850 2200 2700 2200
Wire Wire Line
	2850 2000 2700 2000
Wire Wire Line
	3850 2000 4125 2000
NoConn ~ 3850 2200
NoConn ~ 3350 1600
Text Label 2700 2200 0    50   ~ 0
D-
Text Label 2700 2000 0    50   ~ 0
D+
Text Label 4125 2000 2    50   ~ 0
VBUS
Text Notes 1400 1100 0    79   ~ 16
USB connector & ESD protection
Text Label 3675 2725 2    50   ~ 0
BUSGND
$Comp
L Mechanical:MountingHole_Pad H1
U 1 1 5D48AE96
P 1350 4150
F 0 "H1" H 1450 4199 50  0000 L CNN
F 1 " " H 1450 4108 50  0000 L CNN
F 2 "" H 1350 4150 50  0001 C CNN
F 3 "~" H 1350 4150 50  0001 C CNN
	1    1350 4150
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole_Pad H2
U 1 1 5D48B460
P 1750 4150
F 0 "H2" H 1850 4199 50  0000 L CNN
F 1 " " H 1850 4108 50  0000 L CNN
F 2 "" H 1750 4150 50  0001 C CNN
F 3 "~" H 1750 4150 50  0001 C CNN
	1    1750 4150
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole_Pad H3
U 1 1 5D48B691
P 2150 4150
F 0 "H3" H 2250 4199 50  0000 L CNN
F 1 " " H 2250 4108 50  0000 L CNN
F 2 "" H 2150 4150 50  0001 C CNN
F 3 "~" H 2150 4150 50  0001 C CNN
	1    2150 4150
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole_Pad H4
U 1 1 5D48B88F
P 2525 4150
F 0 "H4" H 2625 4199 50  0000 L CNN
F 1 " " H 2625 4108 50  0000 L CNN
F 2 "" H 2525 4150 50  0001 C CNN
F 3 "~" H 2525 4150 50  0001 C CNN
	1    2525 4150
	1    0    0    -1  
$EndComp
NoConn ~ 2525 4250
NoConn ~ 2150 4250
NoConn ~ 1750 4250
NoConn ~ 1350 4250
Text Notes 1450 3725 0    79   ~ 16
Mounting holes
$EndSCHEMATC
