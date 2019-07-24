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
S 4625 3175 1350 725 
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
S 4650 4350 1350 725 
U 5D277127
F0 "FPGA" 50
F1 "FPGA.sch" 50
$EndSheet
$Sheet
S 6275 4350 1350 725 
U 5D277181
F0 "MCU" 50
F1 "MCU.sch" 50
$EndSheet
$Sheet
S 6250 3175 1350 725 
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
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 1100 2550 50  0001 C CNN
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
F 2 "Resistors_SMD:R_0603_HandSoldering" H 1275 2550 50  0001 C CNN
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
P 3550 2150
F 0 "U6" H 3550 2831 50  0000 C CNN
F 1 "SRV05-4" H 3550 2740 50  0000 C CNN
F 2 "TO_SOT_Packages_SMD:SOT-23-6_Handsoldering" H 4250 1700 50  0001 C CNN
F 3 "http://www.onsemi.com/pub/Collateral/SRV05-4-D.PDF" H 3550 2150 50  0001 C CNN
	1    3550 2150
	1    0    0    -1  
$EndComp
Wire Wire Line
	3550 2650 3550 2775
Wire Wire Line
	3550 2775 3875 2775
Wire Wire Line
	3050 2250 2900 2250
Wire Wire Line
	3050 2050 2900 2050
Wire Wire Line
	4050 2050 4325 2050
NoConn ~ 4050 2250
NoConn ~ 3550 1650
Text Label 2900 2250 0    50   ~ 0
D-
Text Label 2900 2050 0    50   ~ 0
D+
Text Label 4325 2050 2    50   ~ 0
VBUS
Text Notes 1400 1100 0    79   ~ 16
USB connector & ESD protection
Text Label 3875 2775 2    50   ~ 0
BUSGND
$Comp
L Mechanical:MountingHole_Pad H1
U 1 1 5D48AE96
P 1350 4425
F 0 "H1" H 1450 4474 50  0000 L CNN
F 1 " " H 1450 4383 50  0000 L CNN
F 2 "Mounting_Holes:MountingHole_3.2mm_M3_Pad" H 1350 4425 50  0001 C CNN
F 3 "~" H 1350 4425 50  0001 C CNN
	1    1350 4425
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole_Pad H2
U 1 1 5D48B460
P 1750 4425
F 0 "H2" H 1850 4474 50  0000 L CNN
F 1 " " H 1850 4383 50  0000 L CNN
F 2 "Mounting_Holes:MountingHole_3.2mm_M3_Pad" H 1750 4425 50  0001 C CNN
F 3 "~" H 1750 4425 50  0001 C CNN
	1    1750 4425
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole_Pad H3
U 1 1 5D48B691
P 2150 4425
F 0 "H3" H 2250 4474 50  0000 L CNN
F 1 " " H 2250 4383 50  0000 L CNN
F 2 "Mounting_Holes:MountingHole_3.2mm_M3_Pad" H 2150 4425 50  0001 C CNN
F 3 "~" H 2150 4425 50  0001 C CNN
	1    2150 4425
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole_Pad H4
U 1 1 5D48B88F
P 2525 4425
F 0 "H4" H 2625 4474 50  0000 L CNN
F 1 " " H 2625 4383 50  0000 L CNN
F 2 "Mounting_Holes:MountingHole_3.2mm_M3_Pad" H 2525 4425 50  0001 C CNN
F 3 "~" H 2525 4425 50  0001 C CNN
	1    2525 4425
	1    0    0    -1  
$EndComp
NoConn ~ 2525 4525
NoConn ~ 2150 4525
NoConn ~ 1750 4525
NoConn ~ 1350 4525
Text Notes 1450 4000 0    79   ~ 16
Mounting holes
Text GLabel 8825 1700 0    50   BiDi ~ 0
CH1_OUT
Wire Wire Line
	8825 1700 9325 1700
Text GLabel 8800 2825 0    50   BiDi ~ 0
CH2_OUT
Text Notes 9075 1400 0    79   ~ 16
Channels output\nconnector (SMA)
$Comp
L Connector:Conn_Coaxial J6
U 1 1 5D389724
P 10125 1700
F 0 "J6" H 10225 1675 50  0000 L CNN
F 1 "SMA-J-P-H-ST-EM1" H 10225 1584 50  0000 L CNN
F 2 "footprints:SMA_Coaxsial_EdgeBoard_Connector" H 10125 1700 50  0001 C CNN
F 3 "http://www.farnell.com/datasheets/2607241.pdf" H 10125 1700 50  0001 C CNN
F 4 "Farnell" H 10125 1700 50  0001 C CNN "Vendor"
F 5 "2856818" H 10125 1700 50  0001 C CNN "Vendor Number"
	1    10125 1700
	1    0    0    -1  
$EndComp
$Comp
L LOGICchain:GNDA #PWR091
U 1 1 5D38CBF1
P 10125 1900
F 0 "#PWR091" H 10125 1650 50  0001 C CNN
F 1 "GNDA" H 10130 1727 50  0000 C CNN
F 2 "" H 10125 1900 50  0001 C CNN
F 3 "" H 10125 1900 50  0001 C CNN
	1    10125 1900
	1    0    0    -1  
$EndComp
Wire Wire Line
	8800 2825 9325 2825
$Comp
L Connector:Conn_Coaxial J5
U 1 1 5D38E3FF
P 10125 2825
F 0 "J5" H 10225 2800 50  0000 L CNN
F 1 "SMA-J-P-H-ST-EM1" H 10225 2709 50  0000 L CNN
F 2 "footprints:SMA_Coaxsial_EdgeBoard_Connector" H 10125 2825 50  0001 C CNN
F 3 "http://www.farnell.com/datasheets/2607241.pdf" H 10125 2825 50  0001 C CNN
F 4 "Farnell" H 10125 2825 50  0001 C CNN "Vendor"
F 5 "2856818" H 10125 2825 50  0001 C CNN "Vendor Number"
	1    10125 2825
	1    0    0    -1  
$EndComp
$Comp
L LOGICchain:GNDA #PWR090
U 1 1 5D38E405
P 10125 3025
F 0 "#PWR090" H 10125 2775 50  0001 C CNN
F 1 "GNDA" H 10130 2852 50  0000 C CNN
F 2 "" H 10125 3025 50  0001 C CNN
F 3 "" H 10125 3025 50  0001 C CNN
	1    10125 3025
	1    0    0    -1  
$EndComp
$Comp
L Device:D_Zener_Small D2
U 1 1 5D38B7DC
P 9325 1900
F 0 "D2" V 9279 1968 50  0000 L CNN
F 1 "PESD3V3U1UA" V 9370 1968 50  0000 L CNN
F 2 "Diodes_SMD:D_SOD-323_HandSoldering" V 9325 1900 50  0001 C CNN
F 3 "http://www.farnell.com/datasheets/2341422.pdf" V 9325 1900 50  0001 C CNN
F 4 "Farnell" V 9325 1900 50  0001 C CNN "Vendor"
F 5 "2777561" V 9325 1900 50  0001 C CNN "Vendor Number"
	1    9325 1900
	0    1    1    0   
$EndComp
Wire Wire Line
	9325 1800 9325 1700
Connection ~ 9325 1700
Wire Wire Line
	9325 1700 9925 1700
Wire Wire Line
	9325 2000 9325 2075
$Comp
L LOGICchain:GNDA #PWR092
U 1 1 5D38EA45
P 9325 2075
F 0 "#PWR092" H 9325 1825 50  0001 C CNN
F 1 "GNDA" H 9330 1902 50  0000 C CNN
F 2 "" H 9325 2075 50  0001 C CNN
F 3 "" H 9325 2075 50  0001 C CNN
	1    9325 2075
	1    0    0    -1  
$EndComp
$Comp
L Device:D_Zener_Small D5
U 1 1 5D3937D7
P 9325 3050
F 0 "D5" V 9279 3118 50  0000 L CNN
F 1 "PESD3V3U1UA" V 9370 3118 50  0000 L CNN
F 2 "Diodes_SMD:D_SOD-323_HandSoldering" V 9325 3050 50  0001 C CNN
F 3 "http://www.farnell.com/datasheets/2341422.pdf" V 9325 3050 50  0001 C CNN
F 4 "Farnell" V 9325 3050 50  0001 C CNN "Vendor"
F 5 "2777561" V 9325 3050 50  0001 C CNN "Vendor Number"
	1    9325 3050
	0    1    1    0   
$EndComp
Wire Wire Line
	9325 3150 9325 3225
$Comp
L LOGICchain:GNDA #PWR093
U 1 1 5D3937DE
P 9325 3225
F 0 "#PWR093" H 9325 2975 50  0001 C CNN
F 1 "GNDA" H 9330 3052 50  0000 C CNN
F 2 "" H 9325 3225 50  0001 C CNN
F 3 "" H 9325 3225 50  0001 C CNN
	1    9325 3225
	1    0    0    -1  
$EndComp
Wire Wire Line
	9325 2950 9325 2825
Connection ~ 9325 2825
Wire Wire Line
	9325 2825 9925 2825
Text Notes 8500 2150 0    50   ~ 0
Cf(max.) = 3.1pF
Text Notes 8525 3250 0    50   ~ 0
Cf(max.) = 3.1pF
$EndSCHEMATC
