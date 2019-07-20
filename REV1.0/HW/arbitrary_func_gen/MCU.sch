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
P 4425 5925
F 0 "U3" H 4725 6925 50  0000 C CNN
F 1 "FT232RL" H 4850 6850 50  0000 C CNN
F 2 "Package_SO:SSOP-28_5.3x10.2mm_P0.65mm" H 4425 5925 50  0001 C CNN
F 3 "http://www.ftdichip.com/Products/ICs/FT232RL.htm" H 4425 5925 50  0001 C CNN
	1    4425 5925
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR?
U 1 1 5D420FF8
P 6125 1175
F 0 "#PWR?" H 6125 1025 50  0001 C CNN
F 1 "+3.3V" H 6140 1348 50  0000 C CNN
F 2 "" H 6125 1175 50  0001 C CNN
F 3 "" H 6125 1175 50  0001 C CNN
	1    6125 1175
	1    0    0    -1  
$EndComp
Wire Wire Line
	5625 1775 4950 1775
Wire Wire Line
	4950 1775 4950 1625
$Comp
L power:+3.3V #PWR?
U 1 1 5D422292
P 4950 1400
F 0 "#PWR?" H 4950 1250 50  0001 C CNN
F 1 "+3.3V" H 4965 1573 50  0000 C CNN
F 2 "" H 4950 1400 50  0001 C CNN
F 3 "" H 4950 1400 50  0001 C CNN
	1    4950 1400
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R?
U 1 1 5D422EAD
P 4950 1525
F 0 "R?" H 5009 1571 50  0000 L CNN
F 1 "47k" H 5009 1480 50  0000 L CNN
F 2 "" H 4950 1525 50  0001 C CNN
F 3 "~" H 4950 1525 50  0001 C CNN
	1    4950 1525
	1    0    0    -1  
$EndComp
Wire Wire Line
	4950 1425 4950 1400
$Comp
L Device:R_Small R?
U 1 1 5D423804
P 5350 1975
F 0 "R?" V 5200 1950 50  0000 C CNN
F 1 "47k" V 5275 1975 50  0000 C CNN
F 2 "" H 5350 1975 50  0001 C CNN
F 3 "~" H 5350 1975 50  0001 C CNN
	1    5350 1975
	0    1    1    0   
$EndComp
Wire Wire Line
	5625 1975 5450 1975
Wire Wire Line
	5250 1975 4950 1975
$Comp
L LOGICchain:GND #PWR?
U 1 1 5D4248A8
P 4950 1975
F 0 "#PWR?" H 4950 1725 50  0001 C CNN
F 1 "GND" H 4955 1802 50  0000 C CNN
F 2 "" H 4950 1975 50  0001 C CNN
F 3 "" H 4950 1975 50  0001 C CNN
	1    4950 1975
	1    0    0    -1  
$EndComp
$Comp
L LOGICchain:GND #PWR?
U 1 1 5D424D94
P 6125 3550
F 0 "#PWR?" H 6125 3300 50  0001 C CNN
F 1 "GND" H 6130 3377 50  0000 C CNN
F 2 "" H 6125 3550 50  0001 C CNN
F 3 "" H 6125 3550 50  0001 C CNN
	1    6125 3550
	1    0    0    -1  
$EndComp
Wire Wire Line
	6125 3550 6125 3475
Wire Wire Line
	6125 3475 6225 3475
$Comp
L Device:C_Small C?
U 1 1 5D426BFA
P 4950 1875
F 0 "C?" H 4675 1900 50  0000 L CNN
F 1 "100n" H 4675 1800 50  0000 L CNN
F 2 "" H 4950 1875 50  0001 C CNN
F 3 "~" H 4950 1875 50  0001 C CNN
	1    4950 1875
	1    0    0    -1  
$EndComp
Connection ~ 4950 1775
Connection ~ 4950 1975
Text Notes 6275 3525 0    50   ~ 0
*bold labels are fixed
Wire Wire Line
	6725 3175 7125 3175
Wire Wire Line
	6725 3075 7125 3075
Text Label 7125 3075 2    50   ~ 10
SWDIO
Text Label 7125 3175 2    50   ~ 10
SWCLK
Wire Wire Line
	4600 1775 4950 1775
Text Label 4600 1775 0    50   ~ 10
NRST
$Comp
L Connector_Generic:Conn_01x05 J?
U 1 1 5D432FF6
P 975 1625
F 0 "J?" H 893 1950 50  0000 C CNN
F 1 "Conn_01x05" H 1055 1576 50  0001 L CNN
F 2 "" H 975 1625 50  0001 C CNN
F 3 "~" H 975 1625 50  0001 C CNN
	1    975  1625
	-1   0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR?
U 1 1 5D433B8C
P 1275 1375
F 0 "#PWR?" H 1275 1225 50  0001 C CNN
F 1 "+3.3V" H 1290 1548 50  0000 C CNN
F 2 "" H 1275 1375 50  0001 C CNN
F 3 "" H 1275 1375 50  0001 C CNN
	1    1275 1375
	1    0    0    -1  
$EndComp
$Comp
L LOGICchain:GND #PWR?
U 1 1 5D434388
P 1300 1950
F 0 "#PWR?" H 1300 1700 50  0001 C CNN
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
L MCU_ST_STM32F0:STM32F031K6Tx U?
U 1 1 5D43F0EA
P 6225 2475
F 0 "U?" H 6550 3450 50  0000 C CNN
F 1 "STM32F031K6Tx" H 6800 3350 50  0000 C CNN
F 2 "Package_QFP:LQFP-32_7x7mm_P0.8mm" H 5725 1575 50  0001 R CNN
F 3 "http://www.st.com/st-web-ui/static/active/en/resource/technical/document/datasheet/DM00104043.pdf" H 6225 2475 50  0001 C CNN
	1    6225 2475
	1    0    0    -1  
$EndComp
Wire Wire Line
	6225 1575 6325 1575
Connection ~ 6125 3475
Wire Wire Line
	6725 2275 7250 2275
Wire Wire Line
	6725 2375 7250 2375
Wire Wire Line
	6725 2475 7250 2475
Wire Wire Line
	6725 2175 7250 2175
Text Label 8025 2275 2    50   ~ 10
SCK
Text Label 8025 2375 2    50   ~ 10
MISO
Text Label 8025 2475 2    50   ~ 10
MOSI
Text Label 8025 2175 2    50   ~ 0
CS
Text Notes 8100 2375 0    50   ~ 0
Interface with\nFPGA via SPI
Wire Wire Line
	6225 1575 6125 1575
Connection ~ 6225 1575
Connection ~ 6125 1575
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
	7650 2175 7750 2175
Wire Wire Line
	7650 2275 8025 2275
Wire Wire Line
	7650 2375 8025 2375
Wire Wire Line
	7650 2475 8025 2475
$Comp
L Device:R_Pack04 RN?
U 1 1 5D44EE1D
P 7450 2375
F 0 "RN?" V 7150 2325 50  0000 C CNN
F 1 "1k" V 7150 2500 50  0000 C CNN
F 2 "" V 7725 2375 50  0001 C CNN
F 3 "~" H 7450 2375 50  0001 C CNN
	1    7450 2375
	0    1    1    0   
$EndComp
Wire Wire Line
	6725 2075 7175 2075
Wire Wire Line
	6725 1975 7175 1975
Text Label 7175 2075 2    50   ~ 10
UART_RX
Text Label 7175 1975 2    50   ~ 10
UART_TX
Text Label 6075 5225 2    50   ~ 0
UART_RX
Text Label 6075 5325 2    50   ~ 0
UART_TX
Wire Wire Line
	5225 5225 5400 5225
Wire Wire Line
	5400 5325 5225 5325
$Comp
L Device:R_Small R?
U 1 1 5D45F623
P 5500 5225
F 0 "R?" V 5350 5200 50  0000 C CNN
F 1 "100R" V 5425 5225 50  0000 C CNN
F 2 "" H 5500 5225 50  0001 C CNN
F 3 "~" H 5500 5225 50  0001 C CNN
	1    5500 5225
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R?
U 1 1 5D4609E8
P 5500 5325
F 0 "R?" V 5575 5275 50  0000 C CNN
F 1 "100R" V 5650 5325 50  0000 C CNN
F 2 "" H 5500 5325 50  0001 C CNN
F 3 "~" H 5500 5325 50  0001 C CNN
	1    5500 5325
	0    1    1    0   
$EndComp
Wire Wire Line
	5600 5225 6075 5225
Wire Wire Line
	5600 5325 6075 5325
$Comp
L LOGICchain:GND #PWR?
U 1 1 5D46D4DB
P 4225 7100
F 0 "#PWR?" H 4225 6850 50  0001 C CNN
F 1 "GND" H 4230 6927 50  0000 C CNN
F 2 "" H 4225 7100 50  0001 C CNN
F 3 "" H 4225 7100 50  0001 C CNN
	1    4225 7100
	1    0    0    -1  
$EndComp
Wire Wire Line
	4225 7100 4225 6925
Wire Wire Line
	4225 6925 4425 6925
Connection ~ 4225 6925
Connection ~ 4425 6925
Wire Wire Line
	4425 6925 4525 6925
Connection ~ 4525 6925
Wire Wire Line
	4525 6925 4625 6925
Wire Wire Line
	3625 6625 3525 6625
Wire Wire Line
	3525 6625 3525 6925
Wire Wire Line
	3525 6925 4225 6925
NoConn ~ 3625 6325
NoConn ~ 3625 6125
NoConn ~ 3625 5925
NoConn ~ 5225 6625
NoConn ~ 5225 6525
NoConn ~ 5225 6425
Wire Wire Line
	5225 6225 5400 6225
Wire Wire Line
	5400 6325 5225 6325
$Comp
L Device:R_Small R?
U 1 1 5D478FAB
P 5500 6225
F 0 "R?" V 5350 6200 50  0000 C CNN
F 1 "100R" V 5425 6225 50  0000 C CNN
F 2 "" H 5500 6225 50  0001 C CNN
F 3 "~" H 5500 6225 50  0001 C CNN
	1    5500 6225
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R?
U 1 1 5D478FB1
P 5500 6325
F 0 "R?" V 5575 6275 50  0000 C CNN
F 1 "100R" V 5650 6325 50  0000 C CNN
F 2 "" H 5500 6325 50  0001 C CNN
F 3 "~" H 5500 6325 50  0001 C CNN
	1    5500 6325
	0    1    1    0   
$EndComp
Wire Wire Line
	5600 6225 5750 6225
Wire Wire Line
	5600 6325 6225 6325
$Comp
L Device:LED D?
U 1 1 5D47B2C0
P 6225 5975
F 0 "D?" V 6264 5858 50  0000 R CNN
F 1 "LED" V 6173 5858 50  0000 R CNN
F 2 "" H 6225 5975 50  0001 C CNN
F 3 "~" H 6225 5975 50  0001 C CNN
	1    6225 5975
	0    -1   -1   0   
$EndComp
$Comp
L Device:LED D?
U 1 1 5D47C5B5
P 5750 5975
F 0 "D?" V 5789 5858 50  0000 R CNN
F 1 "LED" V 5698 5858 50  0000 R CNN
F 2 "" H 5750 5975 50  0001 C CNN
F 3 "~" H 5750 5975 50  0001 C CNN
	1    5750 5975
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5750 6125 5750 6225
Wire Wire Line
	6225 6125 6225 6325
Wire Wire Line
	5750 5825 5750 5750
Wire Wire Line
	6225 5750 6225 5825
$Comp
L LOGICchain:+5V #PWR?
U 1 1 5D480EB0
P 4525 4375
F 0 "#PWR?" H 4525 4225 50  0001 C CNN
F 1 "+5V" H 4540 4548 50  0000 C CNN
F 2 "" H 4525 4375 50  0001 C CNN
F 3 "" H 4525 4375 50  0001 C CNN
	1    4525 4375
	1    0    0    -1  
$EndComp
Wire Wire Line
	4525 4375 4525 4425
Wire Wire Line
	4325 4925 3625 4925
Wire Wire Line
	3625 4925 3625 5225
Wire Wire Line
	4525 4425 4225 4425
Connection ~ 4525 4425
Wire Wire Line
	4525 4425 4525 4925
$Comp
L Device:C_Small C?
U 1 1 5D489B0F
P 4225 4525
F 0 "C?" H 4050 4500 50  0000 L CNN
F 1 "4u7" H 4000 4575 50  0000 L CNN
F 2 "" H 4225 4525 50  0001 C CNN
F 3 "~" H 4225 4525 50  0001 C CNN
	1    4225 4525
	-1   0    0    1   
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5D48AF51
P 4075 4525
F 0 "C?" H 4275 4500 50  0000 L CNN
F 1 "100n" H 4175 4575 50  0000 L CNN
F 2 "" H 4075 4525 50  0001 C CNN
F 3 "~" H 4075 4525 50  0001 C CNN
	1    4075 4525
	-1   0    0    1   
$EndComp
Connection ~ 4225 4425
Wire Wire Line
	4075 4425 4225 4425
Wire Wire Line
	4075 4625 4225 4625
$Comp
L LOGICchain:GND #PWR?
U 1 1 5D493922
P 4075 4625
F 0 "#PWR?" H 4075 4375 50  0001 C CNN
F 1 "GND" H 4080 4452 50  0000 C CNN
F 2 "" H 4075 4625 50  0001 C CNN
F 3 "" H 4075 4625 50  0001 C CNN
	1    4075 4625
	1    0    0    -1  
$EndComp
Connection ~ 4075 4625
$Comp
L LOGICchain:+5V #PWR?
U 1 1 5D49B888
P 6000 5750
F 0 "#PWR?" H 6000 5600 50  0001 C CNN
F 1 "+5V" H 6015 5923 50  0000 C CNN
F 2 "" H 6000 5750 50  0001 C CNN
F 3 "" H 6000 5750 50  0001 C CNN
	1    6000 5750
	1    0    0    -1  
$EndComp
Text Notes 6250 5900 0    50   ~ 10
Rx
Text Notes 5775 5900 0    50   ~ 10
Tx
$Comp
L Device:C_Small C?
U 1 1 5D49FFC6
P 3275 5025
F 0 "C?" H 3475 5000 50  0000 L CNN
F 1 "100n" H 3375 5075 50  0000 L CNN
F 2 "" H 3275 5025 50  0001 C CNN
F 3 "~" H 3275 5025 50  0001 C CNN
	1    3275 5025
	-1   0    0    1   
$EndComp
Wire Wire Line
	3275 4925 3625 4925
Connection ~ 3625 4925
$Comp
L LOGICchain:GND #PWR?
U 1 1 5D4A2870
P 3275 5125
F 0 "#PWR?" H 3275 4875 50  0001 C CNN
F 1 "GND" H 3280 4952 50  0000 C CNN
F 2 "" H 3275 5125 50  0001 C CNN
F 3 "" H 3275 5125 50  0001 C CNN
	1    3275 5125
	1    0    0    -1  
$EndComp
Wire Wire Line
	6125 1225 5825 1225
$Comp
L Device:C_Small C?
U 1 1 5D4A7491
P 5825 1325
F 0 "C?" H 5650 1300 50  0000 L CNN
F 1 "1u" H 5600 1375 50  0000 L CNN
F 2 "" H 5825 1325 50  0001 C CNN
F 3 "~" H 5825 1325 50  0001 C CNN
	1    5825 1325
	-1   0    0    1   
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5D4A7497
P 5675 1325
F 0 "C?" H 5875 1300 50  0000 L CNN
F 1 "100n" H 5775 1375 50  0000 L CNN
F 2 "" H 5675 1325 50  0001 C CNN
F 3 "~" H 5675 1325 50  0001 C CNN
	1    5675 1325
	-1   0    0    1   
$EndComp
Connection ~ 5825 1225
Wire Wire Line
	5675 1225 5825 1225
Wire Wire Line
	5675 1425 5825 1425
$Comp
L LOGICchain:GND #PWR?
U 1 1 5D4A74A0
P 5675 1425
F 0 "#PWR?" H 5675 1175 50  0001 C CNN
F 1 "GND" H 5680 1252 50  0000 C CNN
F 2 "" H 5675 1425 50  0001 C CNN
F 3 "" H 5675 1425 50  0001 C CNN
	1    5675 1425
	1    0    0    -1  
$EndComp
Connection ~ 5675 1425
Wire Wire Line
	6125 1175 6125 1225
Connection ~ 6125 1225
Wire Wire Line
	6125 1225 6125 1575
Text Label 2775 5625 0    50   ~ 0
USB_D-
Text Label 2775 5525 0    50   ~ 0
USB_D+
Wire Wire Line
	3625 5625 3450 5625
Wire Wire Line
	3450 5525 3625 5525
$Comp
L Device:R_Small R?
U 1 1 5D4C4708
P 3350 5625
F 0 "R?" V 3275 5750 50  0000 C CNN
F 1 "27R" V 3275 5525 50  0000 C CNN
F 2 "" H 3350 5625 50  0001 C CNN
F 3 "~" H 3350 5625 50  0001 C CNN
	1    3350 5625
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3250 5625 2775 5625
Wire Wire Line
	3250 5525 2775 5525
$Comp
L Device:R_Small R?
U 1 1 5D4C470E
P 3350 5525
F 0 "R?" V 3425 5650 50  0000 C CNN
F 1 "27R" V 3425 5450 50  0000 C CNN
F 2 "" H 3350 5525 50  0001 C CNN
F 3 "~" H 3350 5525 50  0001 C CNN
	1    3350 5525
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
Connection ~ 6000 5750
Wire Wire Line
	6000 5750 6225 5750
Wire Wire Line
	5750 5750 6000 5750
$Comp
L Device:LED D?
U 1 1 5D4E698A
P 10225 4425
F 0 "D?" V 10264 4308 50  0000 R CNN
F 1 "LED" V 10173 4308 50  0000 R CNN
F 2 "" H 10225 4425 50  0001 C CNN
F 3 "~" H 10225 4425 50  0001 C CNN
	1    10225 4425
	0    -1   -1   0   
$EndComp
$Comp
L Device:LED D?
U 1 1 5D4E7ACC
P 9850 4425
F 0 "D?" V 9889 4308 50  0000 R CNN
F 1 "LED" V 9798 4308 50  0000 R CNN
F 2 "" H 9850 4425 50  0001 C CNN
F 3 "~" H 9850 4425 50  0001 C CNN
	1    9850 4425
	0    -1   -1   0   
$EndComp
$Comp
L power:+3.3V #PWR?
U 1 1 5D4E8729
P 9850 4225
F 0 "#PWR?" H 9850 4075 50  0001 C CNN
F 1 "+3.3V" H 9865 4398 50  0000 C CNN
F 2 "" H 9850 4225 50  0001 C CNN
F 3 "" H 9850 4225 50  0001 C CNN
	1    9850 4225
	1    0    0    -1  
$EndComp
Wire Wire Line
	9850 4275 9850 4225
Wire Wire Line
	9850 4225 10225 4225
Wire Wire Line
	10225 4225 10225 4275
Connection ~ 9850 4225
Wire Wire Line
	9850 4575 9850 4725
Wire Wire Line
	9850 4725 9625 4725
Wire Wire Line
	10225 4575 10225 4825
Wire Wire Line
	10225 4825 9625 4825
$Comp
L Device:R_Small R?
U 1 1 5D4F4F35
P 9525 4725
F 0 "R?" V 9375 4700 50  0000 C CNN
F 1 "1k" V 9450 4725 50  0000 C CNN
F 2 "" H 9525 4725 50  0001 C CNN
F 3 "~" H 9525 4725 50  0001 C CNN
	1    9525 4725
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R?
U 1 1 5D4F5DF9
P 9525 4825
F 0 "R?" V 9600 4800 50  0000 C CNN
F 1 "1k" V 9675 4800 50  0000 C CNN
F 2 "" H 9525 4825 50  0001 C CNN
F 3 "~" H 9525 4825 50  0001 C CNN
	1    9525 4825
	0    1    1    0   
$EndComp
Wire Wire Line
	9425 4725 8800 4725
Wire Wire Line
	9425 4825 8800 4825
Text Label 8800 4725 0    50   ~ 0
CH1_STATUS
Text Label 8800 4825 0    50   ~ 0
CH2_STATUS
Wire Wire Line
	6725 2675 7350 2675
Wire Wire Line
	6725 2775 7350 2775
Text Label 7350 2675 2    50   ~ 0
CH1_STATUS
Text Label 7350 2775 2    50   ~ 0
CH2_STATUS
$Comp
L Connector_Generic:Conn_01x05 J?
U 1 1 5D50D9B4
P 2875 1625
F 0 "J?" H 2793 1950 50  0000 C CNN
F 1 "Conn_01x05" H 2955 1576 50  0001 L CNN
F 2 "" H 2875 1625 50  0001 C CNN
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
L LOGICchain:GND #PWR?
U 1 1 5D5134B1
P 3075 1825
F 0 "#PWR?" H 3075 1575 50  0001 C CNN
F 1 "GND" H 3080 1652 50  0000 C CNN
F 2 "" H 3075 1825 50  0001 C CNN
F 3 "" H 3075 1825 50  0001 C CNN
	1    3075 1825
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R?
U 1 1 5D524E18
P 7750 1975
F 0 "R?" H 7809 2021 50  0000 L CNN
F 1 "10k" H 7809 1930 50  0000 L CNN
F 2 "" H 7750 1975 50  0001 C CNN
F 3 "~" H 7750 1975 50  0001 C CNN
	1    7750 1975
	1    0    0    -1  
$EndComp
Wire Wire Line
	7750 2075 7750 2175
Connection ~ 7750 2175
Wire Wire Line
	7750 2175 8025 2175
Wire Wire Line
	7750 1875 7750 1850
$Comp
L power:+3.3V #PWR?
U 1 1 5D52BAC2
P 7750 1850
F 0 "#PWR?" H 7750 1700 50  0001 C CNN
F 1 "+3.3V" H 7765 2023 50  0000 C CNN
F 2 "" H 7750 1850 50  0001 C CNN
F 3 "" H 7750 1850 50  0001 C CNN
	1    7750 1850
	1    0    0    -1  
$EndComp
$EndSCHEMATC
