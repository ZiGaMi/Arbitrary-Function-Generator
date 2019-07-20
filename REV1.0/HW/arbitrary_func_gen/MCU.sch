EESchema Schematic File Version 4
LIBS:arbitrary_func_gen-cache
EELAYER 29 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 4 5
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text Notes 8150 7650 0    59   ~ 12
11.07.2019
Text Notes 10600 7650 0    59   ~ 12
1.0
Text Notes 7400 7500 0    59   ~ 12
Arbitrary function generator
Text Notes 7075 6950 0    157  ~ 31
MCU & PC interface
$Comp
L Interface_USB:FT232RL U3
U 1 1 5D2814F1
P 4475 5925
F 0 "U3" H 4775 6925 50  0000 C CNN
F 1 "FT232RL" H 4900 6850 50  0000 C CNN
F 2 "Housings_SSOP:SSOP-28_5.3x10.2mm_Pitch0.65mm" H 4475 5925 50  0001 C CNN
F 3 "http://www.ftdichip.com/Products/ICs/FT232RL.htm" H 4475 5925 50  0001 C CNN
	1    4475 5925
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR083
U 1 1 5D420FF8
P 5725 1425
F 0 "#PWR083" H 5725 1275 50  0001 C CNN
F 1 "+3.3V" H 5740 1598 50  0000 C CNN
F 2 "" H 5725 1425 50  0001 C CNN
F 3 "" H 5725 1425 50  0001 C CNN
	1    5725 1425
	1    0    0    -1  
$EndComp
Wire Wire Line
	5225 2025 4550 2025
Wire Wire Line
	4550 2025 4550 1875
$Comp
L power:+3.3V #PWR079
U 1 1 5D422292
P 4550 1650
F 0 "#PWR079" H 4550 1500 50  0001 C CNN
F 1 "+3.3V" H 4565 1823 50  0000 C CNN
F 2 "" H 4550 1650 50  0001 C CNN
F 3 "" H 4550 1650 50  0001 C CNN
	1    4550 1650
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R71
U 1 1 5D422EAD
P 4550 1775
F 0 "R71" H 4609 1821 50  0000 L CNN
F 1 "47k" H 4609 1730 50  0000 L CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" H 4550 1775 50  0001 C CNN
F 3 "~" H 4550 1775 50  0001 C CNN
	1    4550 1775
	1    0    0    -1  
$EndComp
Wire Wire Line
	4550 1675 4550 1650
$Comp
L Device:R_Small R72
U 1 1 5D423804
P 4950 2225
F 0 "R72" V 4800 2200 50  0000 C CNN
F 1 "47k" V 4875 2225 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" H 4950 2225 50  0001 C CNN
F 3 "~" H 4950 2225 50  0001 C CNN
	1    4950 2225
	0    1    1    0   
$EndComp
Wire Wire Line
	5225 2225 5050 2225
Wire Wire Line
	4850 2225 4550 2225
$Comp
L LOGICchain:GND #PWR080
U 1 1 5D4248A8
P 4550 2225
F 0 "#PWR080" H 4550 1975 50  0001 C CNN
F 1 "GND" H 4555 2052 50  0000 C CNN
F 2 "" H 4550 2225 50  0001 C CNN
F 3 "" H 4550 2225 50  0001 C CNN
	1    4550 2225
	1    0    0    -1  
$EndComp
$Comp
L LOGICchain:GND #PWR084
U 1 1 5D424D94
P 5725 3800
F 0 "#PWR084" H 5725 3550 50  0001 C CNN
F 1 "GND" H 5730 3627 50  0000 C CNN
F 2 "" H 5725 3800 50  0001 C CNN
F 3 "" H 5725 3800 50  0001 C CNN
	1    5725 3800
	1    0    0    -1  
$EndComp
Wire Wire Line
	5725 3800 5725 3725
Wire Wire Line
	5725 3725 5825 3725
$Comp
L Device:C_Small C47
U 1 1 5D426BFA
P 4550 2125
F 0 "C47" H 4275 2150 50  0000 L CNN
F 1 "100n" H 4275 2050 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 4550 2125 50  0001 C CNN
F 3 "~" H 4550 2125 50  0001 C CNN
	1    4550 2125
	1    0    0    -1  
$EndComp
Connection ~ 4550 2025
Connection ~ 4550 2225
Text Notes 5875 3775 0    50   ~ 0
*bold labels are fixed
Wire Wire Line
	6325 3425 6725 3425
Wire Wire Line
	6325 3325 6725 3325
Text Label 6725 3325 2    50   ~ 10
SWDIO
Text Label 6725 3425 2    50   ~ 10
SWCLK
Wire Wire Line
	4200 2025 4550 2025
Text Label 4200 2025 0    50   ~ 10
NRST
$Comp
L Connector_Generic:Conn_01x05 J3
U 1 1 5D432FF6
P 975 1625
F 0 "J3" H 893 1950 50  0000 C CNN
F 1 "Conn_01x05" H 1055 1576 50  0001 L CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x05_Pitch2.54mm" H 975 1625 50  0001 C CNN
F 3 "~" H 975 1625 50  0001 C CNN
	1    975  1625
	-1   0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR072
U 1 1 5D433B8C
P 1275 1375
F 0 "#PWR072" H 1275 1225 50  0001 C CNN
F 1 "+3.3V" H 1290 1548 50  0000 C CNN
F 2 "" H 1275 1375 50  0001 C CNN
F 3 "" H 1275 1375 50  0001 C CNN
	1    1275 1375
	1    0    0    -1  
$EndComp
$Comp
L LOGICchain:GND #PWR073
U 1 1 5D434388
P 1300 1950
F 0 "#PWR073" H 1300 1700 50  0001 C CNN
F 1 "GND" H 1305 1777 50  0000 C CNN
F 2 "" H 1300 1950 50  0001 C CNN
F 3 "" H 1300 1950 50  0001 C CNN
	1    1300 1950
	1    0    0    -1  
$EndComp
Wire Wire Line
	1175 1425 1275 1425
Wire Wire Line
	1275 1425 1275 1375
Wire Wire Line
	1175 1625 1300 1625
Wire Wire Line
	1300 1625 1300 1950
Wire Wire Line
	1175 1825 1650 1825
Wire Wire Line
	1175 1725 1650 1725
Wire Wire Line
	1175 1525 1650 1525
Text Label 1650 1725 2    50   ~ 10
SWDIO
Text Label 1650 1525 2    50   ~ 10
SWCLK
Text Label 1650 1825 2    50   ~ 10
NRST
Text Notes 900  1100 0    79   ~ 16
Programming \nheader
$Comp
L MCU_ST_STM32F0:STM32F031K6Tx U2
U 1 1 5D43F0EA
P 5825 2725
F 0 "U2" H 6150 3700 50  0000 C CNN
F 1 "STM32F031K6Tx" H 6400 3600 50  0000 C CNN
F 2 "Housings_QFP:LQFP-32_7x7mm_Pitch0.8mm" H 5325 1825 50  0001 R CNN
F 3 "http://www.st.com/st-web-ui/static/active/en/resource/technical/document/datasheet/DM00104043.pdf" H 5825 2725 50  0001 C CNN
	1    5825 2725
	1    0    0    -1  
$EndComp
Wire Wire Line
	5825 1825 5925 1825
Connection ~ 5725 3725
Wire Wire Line
	6325 2525 6850 2525
Wire Wire Line
	6325 2625 6850 2625
Wire Wire Line
	6325 2725 6850 2725
Wire Wire Line
	6325 2425 6850 2425
Text Label 7625 2525 2    50   ~ 10
SCK
Text Label 7625 2625 2    50   ~ 10
MISO
Text Label 7625 2725 2    50   ~ 10
MOSI
Text Label 7625 2425 2    50   ~ 0
CS
Text Notes 7700 2625 0    50   ~ 0
Interface with\nFPGA via SPI
Wire Wire Line
	5825 1825 5725 1825
Connection ~ 5825 1825
Connection ~ 5725 1825
Wire Wire Line
	1400 3150 1950 3150
Wire Wire Line
	1400 3250 1950 3250
Wire Wire Line
	1400 3350 1950 3350
Wire Wire Line
	1400 3050 1950 3050
Text Label 1950 3150 2    50   ~ 10
SCK
Text Label 1950 3250 2    50   ~ 10
MISO
Text Label 1950 3350 2    50   ~ 10
MOSI
Text Label 1950 3050 2    50   ~ 0
CS
Text GLabel 1400 3150 0    50   BiDi ~ 0
MCU_SCK
Text GLabel 1400 3050 0    50   BiDi ~ 0
MCU_CS
Text GLabel 1400 3250 0    50   BiDi ~ 0
MCU_MISO
Text GLabel 1400 3350 0    50   BiDi ~ 0
MCU_MOSI
Text Notes 900  2900 0    79   ~ 16
Interface with FPGA
Wire Wire Line
	7250 2425 7350 2425
Wire Wire Line
	7250 2525 7625 2525
Wire Wire Line
	7250 2625 7625 2625
Wire Wire Line
	7250 2725 7625 2725
$Comp
L Device:R_Pack04 RN1
U 1 1 5D44EE1D
P 7050 2625
F 0 "RN1" V 6750 2575 50  0000 C CNN
F 1 "1k" V 6750 2750 50  0000 C CNN
F 2 "" V 7325 2625 50  0001 C CNN
F 3 "~" H 7050 2625 50  0001 C CNN
	1    7050 2625
	0    1    1    0   
$EndComp
Wire Wire Line
	6325 2325 6775 2325
Wire Wire Line
	6325 2225 6775 2225
Text Label 6775 2325 2    50   ~ 10
UART_RX
Text Label 6775 2225 2    50   ~ 10
UART_TX
Text Label 6125 5225 2    50   ~ 0
UART_RX
Text Label 6125 5325 2    50   ~ 0
UART_TX
Wire Wire Line
	5275 5225 5450 5225
Wire Wire Line
	5450 5325 5275 5325
$Comp
L Device:R_Small R73
U 1 1 5D45F623
P 5550 5225
F 0 "R73" V 5400 5200 50  0000 C CNN
F 1 "100R" V 5475 5225 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" H 5550 5225 50  0001 C CNN
F 3 "~" H 5550 5225 50  0001 C CNN
	1    5550 5225
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R74
U 1 1 5D4609E8
P 5550 5325
F 0 "R74" V 5625 5275 50  0000 C CNN
F 1 "100R" V 5700 5325 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" H 5550 5325 50  0001 C CNN
F 3 "~" H 5550 5325 50  0001 C CNN
	1    5550 5325
	0    1    1    0   
$EndComp
Wire Wire Line
	5650 5225 6125 5225
Wire Wire Line
	5650 5325 6125 5325
$Comp
L LOGICchain:GND #PWR077
U 1 1 5D46D4DB
P 4275 7100
F 0 "#PWR077" H 4275 6850 50  0001 C CNN
F 1 "GND" H 4280 6927 50  0000 C CNN
F 2 "" H 4275 7100 50  0001 C CNN
F 3 "" H 4275 7100 50  0001 C CNN
	1    4275 7100
	1    0    0    -1  
$EndComp
Wire Wire Line
	4275 7100 4275 6925
Wire Wire Line
	4275 6925 4475 6925
Connection ~ 4275 6925
Connection ~ 4475 6925
Wire Wire Line
	4475 6925 4575 6925
Connection ~ 4575 6925
Wire Wire Line
	4575 6925 4675 6925
Wire Wire Line
	3675 6625 3575 6625
Wire Wire Line
	3575 6625 3575 6925
Wire Wire Line
	3575 6925 4275 6925
NoConn ~ 3675 6325
NoConn ~ 3675 6125
NoConn ~ 3675 5925
NoConn ~ 5275 6625
NoConn ~ 5275 6525
NoConn ~ 5275 6425
Wire Wire Line
	5275 6225 5450 6225
Wire Wire Line
	5450 6325 5275 6325
$Comp
L Device:R_Small R75
U 1 1 5D478FAB
P 5550 6225
F 0 "R75" V 5400 6200 50  0000 C CNN
F 1 "100R" V 5475 6225 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" H 5550 6225 50  0001 C CNN
F 3 "~" H 5550 6225 50  0001 C CNN
	1    5550 6225
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R76
U 1 1 5D478FB1
P 5550 6325
F 0 "R76" V 5625 6275 50  0000 C CNN
F 1 "100R" V 5700 6325 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" H 5550 6325 50  0001 C CNN
F 3 "~" H 5550 6325 50  0001 C CNN
	1    5550 6325
	0    1    1    0   
$EndComp
Wire Wire Line
	5650 6225 5800 6225
Wire Wire Line
	5650 6325 6225 6325
$Comp
L Device:LED D2
U 1 1 5D47B2C0
P 6275 5975
F 0 "D2" V 6314 5858 50  0000 R CNN
F 1 "LED" V 6223 5858 50  0000 R CNN
F 2 "LEDs:LED_0603_HandSoldering" H 6275 5975 50  0001 C CNN
F 3 "~" H 6275 5975 50  0001 C CNN
	1    6275 5975
	0    -1   -1   0   
$EndComp
$Comp
L Device:LED D1
U 1 1 5D47C5B5
P 5800 5975
F 0 "D1" V 5839 5858 50  0000 R CNN
F 1 "LED" V 5748 5858 50  0000 R CNN
F 2 "LEDs:LED_0603_HandSoldering" H 5800 5975 50  0001 C CNN
F 3 "~" H 5800 5975 50  0001 C CNN
	1    5800 5975
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5800 6125 5800 6225
Wire Wire Line
	6225 6125 6225 6325
Wire Wire Line
	5800 5825 5800 5750
Wire Wire Line
	6225 5750 6225 5825
$Comp
L LOGICchain:+5V #PWR078
U 1 1 5D480EB0
P 4575 4375
F 0 "#PWR078" H 4575 4225 50  0001 C CNN
F 1 "+5V" H 4590 4548 50  0000 C CNN
F 2 "" H 4575 4375 50  0001 C CNN
F 3 "" H 4575 4375 50  0001 C CNN
	1    4575 4375
	1    0    0    -1  
$EndComp
Wire Wire Line
	4575 4375 4575 4425
Wire Wire Line
	4375 4925 3675 4925
Wire Wire Line
	3675 4925 3675 5225
Wire Wire Line
	4575 4425 4275 4425
Connection ~ 4575 4425
Wire Wire Line
	4575 4425 4575 4925
$Comp
L Device:C_Small C46
U 1 1 5D489B0F
P 4275 4525
F 0 "C46" H 4100 4500 50  0000 L CNN
F 1 "4u7" H 4050 4575 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 4275 4525 50  0001 C CNN
F 3 "~" H 4275 4525 50  0001 C CNN
	1    4275 4525
	-1   0    0    1   
$EndComp
$Comp
L Device:C_Small C45
U 1 1 5D48AF51
P 4125 4525
F 0 "C45" H 4325 4500 50  0000 L CNN
F 1 "100n" H 4225 4575 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 4125 4525 50  0001 C CNN
F 3 "~" H 4125 4525 50  0001 C CNN
	1    4125 4525
	-1   0    0    1   
$EndComp
Connection ~ 4275 4425
Wire Wire Line
	4125 4425 4275 4425
Wire Wire Line
	4125 4625 4275 4625
$Comp
L LOGICchain:GND #PWR076
U 1 1 5D493922
P 4125 4625
F 0 "#PWR076" H 4125 4375 50  0001 C CNN
F 1 "GND" H 4130 4452 50  0000 C CNN
F 2 "" H 4125 4625 50  0001 C CNN
F 3 "" H 4125 4625 50  0001 C CNN
	1    4125 4625
	1    0    0    -1  
$EndComp
Connection ~ 4125 4625
$Comp
L LOGICchain:+5V #PWR082
U 1 1 5D49B888
P 6050 5750
F 0 "#PWR082" H 6050 5600 50  0001 C CNN
F 1 "+5V" H 6065 5923 50  0000 C CNN
F 2 "" H 6050 5750 50  0001 C CNN
F 3 "" H 6050 5750 50  0001 C CNN
	1    6050 5750
	1    0    0    -1  
$EndComp
Text Notes 6250 5900 0    50   ~ 10
Rx
Text Notes 5825 5900 0    50   ~ 10
Tx
$Comp
L Device:C_Small C44
U 1 1 5D49FFC6
P 3325 5025
F 0 "C44" H 3525 5000 50  0000 L CNN
F 1 "100n" H 3425 5075 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 3325 5025 50  0001 C CNN
F 3 "~" H 3325 5025 50  0001 C CNN
	1    3325 5025
	-1   0    0    1   
$EndComp
Wire Wire Line
	3325 4925 3675 4925
Connection ~ 3675 4925
$Comp
L LOGICchain:GND #PWR075
U 1 1 5D4A2870
P 3325 5125
F 0 "#PWR075" H 3325 4875 50  0001 C CNN
F 1 "GND" H 3330 4952 50  0000 C CNN
F 2 "" H 3325 5125 50  0001 C CNN
F 3 "" H 3325 5125 50  0001 C CNN
	1    3325 5125
	1    0    0    -1  
$EndComp
Wire Wire Line
	5725 1475 5425 1475
$Comp
L Device:C_Small C49
U 1 1 5D4A7491
P 5425 1575
F 0 "C49" H 5200 1550 50  0000 L CNN
F 1 "1u" H 5250 1625 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 5425 1575 50  0001 C CNN
F 3 "~" H 5425 1575 50  0001 C CNN
	1    5425 1575
	-1   0    0    1   
$EndComp
$Comp
L Device:C_Small C48
U 1 1 5D4A7497
P 5275 1575
F 0 "C48" H 5375 1550 50  0000 L CNN
F 1 "100n" H 5350 1625 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 5275 1575 50  0001 C CNN
F 3 "~" H 5275 1575 50  0001 C CNN
	1    5275 1575
	-1   0    0    1   
$EndComp
Connection ~ 5425 1475
Wire Wire Line
	5275 1475 5425 1475
Wire Wire Line
	5275 1675 5425 1675
$Comp
L LOGICchain:GND #PWR081
U 1 1 5D4A74A0
P 5275 1675
F 0 "#PWR081" H 5275 1425 50  0001 C CNN
F 1 "GND" H 5280 1502 50  0000 C CNN
F 2 "" H 5275 1675 50  0001 C CNN
F 3 "" H 5275 1675 50  0001 C CNN
	1    5275 1675
	1    0    0    -1  
$EndComp
Connection ~ 5275 1675
Wire Wire Line
	5725 1425 5725 1475
Connection ~ 5725 1475
Wire Wire Line
	5725 1475 5725 1825
Text Label 2825 5625 0    50   ~ 0
USB_D-
Text Label 2825 5525 0    50   ~ 0
USB_D+
Wire Wire Line
	3675 5625 3500 5625
Wire Wire Line
	3500 5525 3675 5525
$Comp
L Device:R_Small R70
U 1 1 5D4C4708
P 3400 5625
F 0 "R70" V 3325 5750 50  0000 C CNN
F 1 "27R" V 3325 5525 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" H 3400 5625 50  0001 C CNN
F 3 "~" H 3400 5625 50  0001 C CNN
	1    3400 5625
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3300 5625 2825 5625
Wire Wire Line
	3300 5525 2825 5525
$Comp
L Device:R_Small R69
U 1 1 5D4C470E
P 3400 5525
F 0 "R69" V 3475 5650 50  0000 C CNN
F 1 "27R" V 3475 5450 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" H 3400 5525 50  0001 C CNN
F 3 "~" H 3400 5525 50  0001 C CNN
	1    3400 5525
	0    -1   -1   0   
$EndComp
Text Notes 950  3900 0    79   ~ 16
Interface with PC
Text Label 2000 4150 2    50   ~ 0
USB_D-
Text Label 2000 4050 2    50   ~ 0
USB_D+
Wire Wire Line
	1425 4150 2000 4150
Wire Wire Line
	1425 4050 2000 4050
Text GLabel 1425 4050 0    50   BiDi ~ 0
D+
Text GLabel 1425 4150 0    50   BiDi ~ 0
D-
Connection ~ 6050 5750
Wire Wire Line
	6050 5750 6225 5750
Wire Wire Line
	5800 5750 6050 5750
$Comp
L Device:LED D4
U 1 1 5D4E698A
P 10450 1750
F 0 "D4" V 10489 1633 50  0000 R CNN
F 1 "LED" V 10398 1633 50  0000 R CNN
F 2 "LEDs:LED_0603_HandSoldering" H 10450 1750 50  0001 C CNN
F 3 "~" H 10450 1750 50  0001 C CNN
	1    10450 1750
	0    -1   -1   0   
$EndComp
$Comp
L Device:LED D3
U 1 1 5D4E7ACC
P 10075 1750
F 0 "D3" V 10114 1633 50  0000 R CNN
F 1 "LED" V 10023 1633 50  0000 R CNN
F 2 "LEDs:LED_0603_HandSoldering" H 10075 1750 50  0001 C CNN
F 3 "~" H 10075 1750 50  0001 C CNN
	1    10075 1750
	0    -1   -1   0   
$EndComp
$Comp
L power:+3.3V #PWR086
U 1 1 5D4E8729
P 10075 1550
F 0 "#PWR086" H 10075 1400 50  0001 C CNN
F 1 "+3.3V" H 10090 1723 50  0000 C CNN
F 2 "" H 10075 1550 50  0001 C CNN
F 3 "" H 10075 1550 50  0001 C CNN
	1    10075 1550
	1    0    0    -1  
$EndComp
Wire Wire Line
	10075 1600 10075 1550
Wire Wire Line
	10075 1550 10450 1550
Wire Wire Line
	10450 1550 10450 1600
Connection ~ 10075 1550
Wire Wire Line
	10075 1900 10075 2050
Wire Wire Line
	10075 2050 9850 2050
Wire Wire Line
	10450 1900 10450 2150
Wire Wire Line
	10450 2150 9850 2150
$Comp
L Device:R_Small R78
U 1 1 5D4F4F35
P 9750 2050
F 0 "R78" V 9600 2025 50  0000 C CNN
F 1 "1k" V 9675 2050 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" H 9750 2050 50  0001 C CNN
F 3 "~" H 9750 2050 50  0001 C CNN
	1    9750 2050
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R79
U 1 1 5D4F5DF9
P 9750 2150
F 0 "R79" V 9825 2125 50  0000 C CNN
F 1 "1k" V 9900 2125 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" H 9750 2150 50  0001 C CNN
F 3 "~" H 9750 2150 50  0001 C CNN
	1    9750 2150
	0    1    1    0   
$EndComp
Wire Wire Line
	9650 2050 9025 2050
Wire Wire Line
	9650 2150 9025 2150
Text Label 9025 2050 0    50   ~ 0
CH1_STATUS
Text Label 9025 2150 0    50   ~ 0
CH2_STATUS
Wire Wire Line
	6325 2925 6950 2925
Wire Wire Line
	6325 3025 6950 3025
Text Label 6950 2925 2    50   ~ 0
CH1_STATUS
Text Label 6950 3025 2    50   ~ 0
CH2_STATUS
$Comp
L Connector_Generic:Conn_01x05 J4
U 1 1 5D50D9B4
P 2875 1625
F 0 "J4" H 2793 1950 50  0000 C CNN
F 1 "Conn_01x05" H 2955 1576 50  0001 L CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x05_Pitch2.54mm" H 2875 1625 50  0001 C CNN
F 3 "~" H 2875 1625 50  0001 C CNN
	1    2875 1625
	-1   0    0    -1  
$EndComp
Text Notes 2775 1125 0    79   ~ 16
Debug\nheader
Wire Wire Line
	3075 1525 3350 1525
Wire Wire Line
	3075 1625 3350 1625
Wire Wire Line
	3075 1725 3350 1725
Wire Wire Line
	3075 1425 3350 1425
Text Label 3350 1525 2    50   ~ 0
SCK
Text Label 3350 1625 2    50   ~ 0
MISO
Text Label 3350 1725 2    50   ~ 0
MOSI
Text Label 3350 1425 2    50   ~ 0
CS
$Comp
L LOGICchain:GND #PWR074
U 1 1 5D5134B1
P 3075 1825
F 0 "#PWR074" H 3075 1575 50  0001 C CNN
F 1 "GND" H 3080 1652 50  0000 C CNN
F 2 "" H 3075 1825 50  0001 C CNN
F 3 "" H 3075 1825 50  0001 C CNN
	1    3075 1825
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R77
U 1 1 5D524E18
P 7350 2225
F 0 "R77" H 7409 2271 50  0000 L CNN
F 1 "10k" H 7409 2180 50  0000 L CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" H 7350 2225 50  0001 C CNN
F 3 "~" H 7350 2225 50  0001 C CNN
	1    7350 2225
	1    0    0    -1  
$EndComp
Wire Wire Line
	7350 2325 7350 2425
Connection ~ 7350 2425
Wire Wire Line
	7350 2425 7625 2425
Wire Wire Line
	7350 2125 7350 2100
$Comp
L power:+3.3V #PWR085
U 1 1 5D52BAC2
P 7350 2100
F 0 "#PWR085" H 7350 1950 50  0001 C CNN
F 1 "+3.3V" H 7365 2273 50  0000 C CNN
F 2 "" H 7350 2100 50  0001 C CNN
F 3 "" H 7350 2100 50  0001 C CNN
	1    7350 2100
	1    0    0    -1  
$EndComp
NoConn ~ 5275 5425
NoConn ~ 5275 5525
NoConn ~ 5275 5625
NoConn ~ 5275 5725
NoConn ~ 5275 5825
NoConn ~ 5275 5925
Text Notes 9325 1250 0    79   ~ 16
Channel Status LEDs
Connection ~ 6225 5750
Wire Wire Line
	6225 5750 6275 5750
Connection ~ 6225 6325
Wire Wire Line
	6225 6325 6275 6325
$EndSCHEMATC
