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
L MCU_ST_STM32F0:STM32F030K6Tx U2
U 1 1 5D27FC79
P 3925 2900
F 0 "U2" H 3875 1811 50  0000 C CNN
F 1 "STM32F030K6Tx" H 3875 1720 50  0000 C CNN
F 2 "Package_QFP:LQFP-32_7x7mm_P0.8mm" H 3425 2000 50  0001 R CNN
F 3 "http://www.st.com/st-web-ui/static/active/en/resource/technical/document/datasheet/DM00088500.pdf" H 3925 2900 50  0001 C CNN
	1    3925 2900
	1    0    0    -1  
$EndComp
$Comp
L Interface_USB:FT232RL U3
U 1 1 5D2814F1
P 8125 3200
F 0 "U3" H 8125 4381 50  0000 C CNN
F 1 "FT232RL" H 8125 4290 50  0000 C CNN
F 2 "Package_SO:SSOP-28_5.3x10.2mm_P0.65mm" H 8125 3200 50  0001 C CNN
F 3 "http://www.ftdichip.com/Products/ICs/FT232RL.htm" H 8125 3200 50  0001 C CNN
	1    8125 3200
	1    0    0    -1  
$EndComp
Text Notes 3100 1600 0    79   ~ 16
MCU purpose:\n- controling FPGA -> DAC\n- interfacing with PC as CLI (user only\nopens Putty or similar program and\nis ready to use )\n- light LED as output is active
$EndSCHEMATC
