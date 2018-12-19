EESchema Schematic File Version 4
LIBS:nano_m0-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L SMT32F070F6P6:STM32F0706P6 U2
U 1 1 5C0B337B
P 9100 3950
F 0 "U2" H 9100 4717 50  0000 C CNN
F 1 "STM32F0706P6" H 9100 4626 50  0000 C CNN
F 2 "Housings_SSOP:TSSOP-20_4.4x6.5mm_Pitch0.65mm" H 9100 3950 50  0001 L CNN
F 3 "" H 9100 3950 50  0001 L CNN
	1    9100 3950
	1    0    0    -1  
$EndComp
$Comp
L device:Jumper_NC_Small JP1
U 1 1 5C0B3515
P 7950 1150
F 0 "JP1" H 7950 1362 50  0000 C CNN
F 1 "Jumper_NC_Small" H 7950 1271 50  0000 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Bridged_Pad1.0x1.5mm" H 7950 1150 50  0001 C CNN
F 3 "" H 7950 1150 50  0001 C CNN
	1    7950 1150
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR0101
U 1 1 5C0B356B
P 7100 900
F 0 "#PWR0101" H 7100 750 50  0001 C CNN
F 1 "+3.3V" H 7115 1073 50  0000 C CNN
F 2 "" H 7100 900 50  0001 C CNN
F 3 "" H 7100 900 50  0001 C CNN
	1    7100 900 
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_SPST SW1
U 1 1 5C0B4A16
P 7300 1150
F 0 "SW1" H 7300 1385 50  0000 C CNN
F 1 "SW_SPST" H 7300 1294 50  0000 C CNN
F 2 "Buttons_Switches_SMD:SW_SPST_PTS810" H 7300 1150 50  0001 C CNN
F 3 "" H 7300 1150 50  0001 C CNN
	1    7300 1150
	1    0    0    -1  
$EndComp
$Comp
L device:R R3
U 1 1 5C0B5007
P 8400 1850
F 0 "R3" H 8470 1896 50  0000 L CNN
F 1 "10k" H 8470 1805 50  0000 L CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 8330 1850 50  0001 C CNN
F 3 "" H 8400 1850 50  0001 C CNN
	1    8400 1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	8400 3850 8250 3850
$Comp
L power:+3.3V #PWR0102
U 1 1 5C0B5116
P 8250 3200
F 0 "#PWR0102" H 8250 3050 50  0001 C CNN
F 1 "+3.3V" H 8265 3373 50  0000 C CNN
F 2 "" H 8250 3200 50  0001 C CNN
F 3 "" H 8250 3200 50  0001 C CNN
	1    8250 3200
	1    0    0    -1  
$EndComp
Wire Wire Line
	7500 3750 8400 3750
Text Label 7500 3750 0    50   ~ 0
NRST
$Comp
L Switch:SW_SPST SW2
U 1 1 5C0B5714
P 9600 1450
F 0 "SW2" H 9600 1685 50  0000 C CNN
F 1 "SW_SPST" H 9600 1594 50  0000 C CNN
F 2 "Buttons_Switches_SMD:SW_SPST_PTS810" H 9600 1450 50  0001 C CNN
F 3 "" H 9600 1450 50  0001 C CNN
	1    9600 1450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0103
U 1 1 5C0B5759
P 9100 1700
F 0 "#PWR0103" H 9100 1450 50  0001 C CNN
F 1 "GND" H 9105 1527 50  0000 C CNN
F 2 "" H 9100 1700 50  0001 C CNN
F 3 "" H 9100 1700 50  0001 C CNN
	1    9100 1700
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR0104
U 1 1 5C0B5775
P 10100 950
F 0 "#PWR0104" H 10100 800 50  0001 C CNN
F 1 "+3.3V" H 10115 1123 50  0000 C CNN
F 2 "" H 10100 950 50  0001 C CNN
F 3 "" H 10100 950 50  0001 C CNN
	1    10100 950 
	1    0    0    -1  
$EndComp
Wire Wire Line
	9800 1450 10100 1450
$Comp
L device:R R4
U 1 1 5C0B57F1
P 10100 1200
F 0 "R4" H 10170 1246 50  0000 L CNN
F 1 "10k" H 10170 1155 50  0000 L CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 10030 1200 50  0001 C CNN
F 3 "" H 10100 1200 50  0001 C CNN
	1    10100 1200
	1    0    0    -1  
$EndComp
$Comp
L device:C C7
U 1 1 5C0B5846
P 10350 1700
F 0 "C7" H 10465 1746 50  0000 L CNN
F 1 "0.1uF" H 10465 1655 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 10388 1550 50  0001 C CNN
F 3 "" H 10350 1700 50  0001 C CNN
	1    10350 1700
	1    0    0    -1  
$EndComp
Wire Wire Line
	10100 1450 10100 1350
Connection ~ 10100 1450
Wire Wire Line
	10100 1450 10350 1450
Wire Wire Line
	10100 950  10100 1050
Wire Wire Line
	10350 1450 10350 1550
Connection ~ 10350 1450
Wire Wire Line
	10350 1450 10750 1450
$Comp
L power:GND #PWR0105
U 1 1 5C0B5B83
P 10350 2000
F 0 "#PWR0105" H 10350 1750 50  0001 C CNN
F 1 "GND" H 10355 1827 50  0000 C CNN
F 2 "" H 10350 2000 50  0001 C CNN
F 3 "" H 10350 2000 50  0001 C CNN
	1    10350 2000
	1    0    0    -1  
$EndComp
Wire Wire Line
	10350 1850 10350 2000
Wire Wire Line
	9400 1450 9100 1450
Wire Wire Line
	9100 1450 9100 1700
Text Label 10600 1450 0    50   ~ 0
NRST
Wire Notes Line
	11100 600  8900 600 
Wire Notes Line
	8900 600  8900 2300
Wire Notes Line
	8900 2300 11100 2300
Wire Notes Line
	11100 2300 11100 600 
Text Notes 9000 750  0    50   ~ 0
Reset\n
Wire Wire Line
	8250 3850 8250 3200
$Comp
L power:GND #PWR0106
U 1 1 5C0B6431
P 8400 2000
F 0 "#PWR0106" H 8400 1750 50  0001 C CNN
F 1 "GND" H 8405 1827 50  0000 C CNN
F 2 "" H 8400 2000 50  0001 C CNN
F 3 "" H 8400 2000 50  0001 C CNN
	1    8400 2000
	1    0    0    -1  
$EndComp
Wire Wire Line
	7500 1250 7500 1150
Wire Wire Line
	8400 3450 7500 3450
Text Label 8400 1150 0    50   ~ 0
BOOT
Text Label 7500 3450 0    50   ~ 0
BOOT
Wire Notes Line
	8700 600  6950 600 
Wire Notes Line
	6950 600  6950 2300
Wire Notes Line
	6950 2300 8700 2300
Wire Notes Line
	8700 2300 8700 600 
Text Notes 8100 750  0    50   ~ 0
Boot Override
$Comp
L power:+3.3V #PWR0107
U 1 1 5C0B6D96
P 10000 3200
F 0 "#PWR0107" H 10000 3050 50  0001 C CNN
F 1 "+3.3V" H 10015 3373 50  0000 C CNN
F 2 "" H 10000 3200 50  0001 C CNN
F 3 "" H 10000 3200 50  0001 C CNN
	1    10000 3200
	1    0    0    -1  
$EndComp
Wire Wire Line
	9800 3850 10000 3850
Wire Wire Line
	10000 3850 10000 3200
Wire Wire Line
	9800 3950 10000 3950
Wire Wire Line
	10000 3950 10000 4750
$Comp
L power:GND #PWR0108
U 1 1 5C0B728E
P 10000 4750
F 0 "#PWR0108" H 10000 4500 50  0001 C CNN
F 1 "GND" H 10005 4577 50  0000 C CNN
F 2 "" H 10000 4750 50  0001 C CNN
F 3 "" H 10000 4750 50  0001 C CNN
	1    10000 4750
	1    0    0    -1  
$EndComp
$Comp
L device:C C6
U 1 1 5C0B7322
P 10300 5550
F 0 "C6" H 10415 5596 50  0000 L CNN
F 1 "1uF" H 10415 5505 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 10338 5400 50  0001 C CNN
F 3 "" H 10300 5550 50  0001 C CNN
	1    10300 5550
	1    0    0    -1  
$EndComp
$Comp
L device:C C5
U 1 1 5C0B7397
P 9900 5550
F 0 "C5" H 10015 5596 50  0000 L CNN
F 1 "1uF" H 10015 5505 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 9938 5400 50  0001 C CNN
F 3 "" H 9900 5550 50  0001 C CNN
	1    9900 5550
	1    0    0    -1  
$EndComp
Wire Wire Line
	8250 3850 7500 3850
Connection ~ 8250 3850
Wire Wire Line
	10000 3850 10500 3850
Connection ~ 10000 3850
Text Label 10400 3850 0    50   ~ 0
VDD
Text Label 7500 3850 0    50   ~ 0
VDDA
Wire Wire Line
	10600 5150 10300 5150
Wire Wire Line
	10300 5150 10300 5400
Text Label 10500 5150 0    50   ~ 0
VDD
Wire Wire Line
	9900 5150 9900 5400
Wire Wire Line
	9900 5150 10200 5150
Text Label 10050 5150 0    50   ~ 0
VDDA
$Comp
L power:GND #PWR0109
U 1 1 5C0B858C
P 9900 5950
F 0 "#PWR0109" H 9900 5700 50  0001 C CNN
F 1 "GND" H 9905 5777 50  0000 C CNN
F 2 "" H 9900 5950 50  0001 C CNN
F 3 "" H 9900 5950 50  0001 C CNN
	1    9900 5950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0110
U 1 1 5C0B85B0
P 10300 5950
F 0 "#PWR0110" H 10300 5700 50  0001 C CNN
F 1 "GND" H 10305 5777 50  0000 C CNN
F 2 "" H 10300 5950 50  0001 C CNN
F 3 "" H 10300 5950 50  0001 C CNN
	1    10300 5950
	1    0    0    -1  
$EndComp
Wire Wire Line
	10300 5700 10300 5950
Wire Wire Line
	9900 5700 9900 5950
Wire Wire Line
	8400 3550 7500 3550
Wire Wire Line
	8400 3650 7500 3650
Text Label 7500 3550 0    50   ~ 0
OSC_IN
Text Label 7500 3650 0    50   ~ 0
OSC_OUT
$Comp
L device:C C4
U 1 1 5C0B9AFF
P 8050 5650
F 0 "C4" V 7798 5650 50  0000 C CNN
F 1 ".01uF" V 7889 5650 50  0000 C CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 8088 5500 50  0001 C CNN
F 3 "" H 8050 5650 50  0001 C CNN
	1    8050 5650
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR0111
U 1 1 5C0B9B4D
P 8750 6100
F 0 "#PWR0111" H 8750 5850 50  0001 C CNN
F 1 "GND" H 8755 5927 50  0000 C CNN
F 2 "" H 8750 6100 50  0001 C CNN
F 3 "" H 8750 6100 50  0001 C CNN
	1    8750 6100
	1    0    0    -1  
$EndComp
Wire Wire Line
	9800 4050 10500 4050
Text Label 10400 4050 0    50   ~ 0
PB1
Wire Wire Line
	8050 1150 8250 1150
$Comp
L device:Jumper_NO_Small JP2
U 1 1 5C0BD8A6
P 8050 1700
F 0 "JP2" H 8050 1885 50  0000 C CNN
F 1 "Jumper_NO_Small" H 8050 1794 50  0000 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Open_Pad1.0x1.5mm" H 8050 1700 50  0001 C CNN
F 3 "" H 8050 1700 50  0001 C CNN
	1    8050 1700
	1    0    0    -1  
$EndComp
Wire Wire Line
	7500 1150 7700 1150
Connection ~ 7500 1150
Wire Wire Line
	7700 1700 7700 1150
Connection ~ 7700 1150
Wire Wire Line
	7700 1150 7850 1150
Wire Wire Line
	8150 1700 8400 1700
Text Label 8400 1700 0    50   ~ 0
PB1
Wire Wire Line
	8400 3950 7500 3950
Wire Wire Line
	8400 4050 7500 4050
Text Label 7500 3950 0    50   ~ 0
PA0
Text Label 7500 4050 0    50   ~ 0
PA1
$Comp
L device:LED D1
U 1 1 5C0C1A5D
P 4600 1300
F 0 "D1" V 4638 1183 50  0000 R CNN
F 1 "LED" V 4547 1183 50  0000 R CNN
F 2 "LEDs:LED_0805_HandSoldering" H 4600 1300 50  0001 C CNN
F 3 "~" H 4600 1300 50  0001 C CNN
	1    4600 1300
	0    -1   -1   0   
$EndComp
$Comp
L device:R R1
U 1 1 5C0C1B92
P 4600 1750
F 0 "R1" H 4670 1796 50  0000 L CNN
F 1 "80ohm" H 4670 1705 50  0000 L CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 4530 1750 50  0001 C CNN
F 3 "" H 4600 1750 50  0001 C CNN
	1    4600 1750
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR0112
U 1 1 5C0C4C65
P 4600 1000
F 0 "#PWR0112" H 4600 850 50  0001 C CNN
F 1 "+3.3V" H 4615 1173 50  0000 C CNN
F 2 "" H 4600 1000 50  0001 C CNN
F 3 "" H 4600 1000 50  0001 C CNN
	1    4600 1000
	1    0    0    -1  
$EndComp
Wire Wire Line
	4600 1000 4600 1150
Wire Wire Line
	4600 1450 4600 1600
Wire Wire Line
	4600 1900 4600 2100
Wire Wire Line
	4600 2100 5050 2100
Text Label 4950 2100 0    50   ~ 0
PA1
Text Label 5700 2100 0    50   ~ 0
PA0
Wire Notes Line
	6700 600  6700 2300
Text Notes 6450 750  0    50   ~ 0
LEDs
Wire Wire Line
	9800 3750 10500 3750
Wire Wire Line
	9800 3650 10500 3650
Text Label 10250 3750 0    50   ~ 0
USB_N
Text Label 10250 3650 0    50   ~ 0
USB_P
Wire Wire Line
	8400 4150 7500 4150
Wire Wire Line
	8400 4250 7500 4250
Wire Wire Line
	8400 4350 7500 4350
Text Label 7500 4150 0    50   ~ 0
PA2
Text Label 7500 4250 0    50   ~ 0
PA3
Text Label 7500 4350 0    50   ~ 0
PA4
$Comp
L Connector:USB_B_Micro J3
U 1 1 5C0D06C0
P 3450 1400
F 0 "J3" H 3505 1867 50  0000 C CNN
F 1 "USB_B_Micro" H 3505 1776 50  0000 C CNN
F 2 "digikey-footprints:USB_Micro_B_Female_10118194-0001LF" H 3600 1350 50  0001 C CNN
F 3 "~" H 3600 1350 50  0001 C CNN
	1    3450 1400
	1    0    0    -1  
$EndComp
Wire Wire Line
	3750 1200 4100 1200
Wire Wire Line
	4100 1200 4100 900 
Wire Wire Line
	3750 1400 4100 1400
Wire Wire Line
	3750 1500 4100 1500
Text Label 3850 1400 0    50   ~ 0
USB_P
Text Label 3850 1500 0    50   ~ 0
USB_N
NoConn ~ 3750 1600
$Comp
L power:GND #PWR0114
U 1 1 5C0D5C0B
P 3400 2050
F 0 "#PWR0114" H 3400 1800 50  0001 C CNN
F 1 "GND" H 3405 1877 50  0000 C CNN
F 2 "" H 3400 2050 50  0001 C CNN
F 3 "" H 3400 2050 50  0001 C CNN
	1    3400 2050
	1    0    0    -1  
$EndComp
Wire Wire Line
	3350 1800 3350 1900
Wire Wire Line
	3350 1900 3400 1900
Wire Wire Line
	3400 1900 3400 2050
Wire Wire Line
	3400 1900 3450 1900
Wire Wire Line
	3450 1900 3450 1800
Connection ~ 3400 1900
Wire Notes Line
	4300 600  4300 2300
Wire Notes Line
	4300 2300 3000 2300
Wire Notes Line
	3000 2300 3000 600 
Wire Notes Line
	3000 600  4300 600 
Text Notes 3050 750  0    50   ~ 0
USB
Wire Wire Line
	9800 3550 10500 3550
Text Label 10350 3450 0    50   ~ 0
PA14
Text Label 10350 3550 0    50   ~ 0
PA13
Wire Wire Line
	9800 4150 10500 4150
Wire Wire Line
	9800 4250 10500 4250
Wire Wire Line
	9800 4350 10500 4350
Text Label 10400 4150 0    50   ~ 0
PA7
Text Label 10400 4250 0    50   ~ 0
PA6
Text Label 10400 4350 0    50   ~ 0
PA5
$Comp
L AP2112K-3.3TRG1:AP2112K-3.3TRG1 U1
U 1 1 5C0ECCF9
P 5250 6600
F 0 "U1" H 5250 7070 50  0000 C CNN
F 1 "AP2112K-3.3TRG1" H 5250 6979 50  0000 C CNN
F 2 "AP2112K-3.3TRG1:SOT95P285X140-5N" H 5250 6600 50  0001 L BNN
F 3 "AP2112 Series 0.6 A 3.3 V Fixed Output SMT LDO Linear Regulator - SOT23-5" H 5250 6600 50  0001 L BNN
F 4 "SOT-753 Diodes Inc." H 5250 6600 50  0001 L BNN "Field4"
F 5 "Unavailable" H 5250 6600 50  0001 L BNN "Field5"
F 6 "AP2112K-3.3TRG1" H 5250 6600 50  0001 L BNN "Field6"
F 7 "None" H 5250 6600 50  0001 L BNN "Field7"
F 8 "Diodes Inc." H 5250 6600 50  0001 L BNN "Field8"
	1    5250 6600
	1    0    0    -1  
$EndComp
Wire Wire Line
	5750 6400 6000 6400
Wire Wire Line
	6000 6400 6000 6150
$Comp
L power:+3.3V #PWR0115
U 1 1 5C0EEDCC
P 6000 6150
F 0 "#PWR0115" H 6000 6000 50  0001 C CNN
F 1 "+3.3V" H 6015 6323 50  0000 C CNN
F 2 "" H 6000 6150 50  0001 C CNN
F 3 "" H 6000 6150 50  0001 C CNN
	1    6000 6150
	1    0    0    -1  
$EndComp
$Comp
L device:C C2
U 1 1 5C0EEF05
P 6300 6650
F 0 "C2" H 6415 6696 50  0000 L CNN
F 1 "2.2uF" H 6415 6605 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 6338 6500 50  0001 C CNN
F 3 "" H 6300 6650 50  0001 C CNN
	1    6300 6650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0116
U 1 1 5C0EEF86
P 6300 7100
F 0 "#PWR0116" H 6300 6850 50  0001 C CNN
F 1 "GND" H 6305 6927 50  0000 C CNN
F 2 "" H 6300 7100 50  0001 C CNN
F 3 "" H 6300 7100 50  0001 C CNN
	1    6300 7100
	1    0    0    -1  
$EndComp
Wire Wire Line
	6000 6400 6300 6400
Wire Wire Line
	6300 6400 6300 6500
Connection ~ 6000 6400
Wire Wire Line
	6300 6800 6300 7000
Wire Wire Line
	5750 6800 5900 6800
Wire Wire Line
	5900 6800 5900 7000
Wire Wire Line
	5900 7000 6300 7000
Connection ~ 6300 7000
Wire Wire Line
	6300 7000 6300 7100
Wire Wire Line
	4750 6400 4650 6400
Wire Wire Line
	4750 6600 4650 6600
Wire Wire Line
	4650 6600 4650 6400
Connection ~ 4650 6400
$Comp
L device:C C1
U 1 1 5C0FA4CC
P 4300 6650
F 0 "C1" H 4415 6696 50  0000 L CNN
F 1 "1uF" H 4415 6605 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 4338 6500 50  0001 C CNN
F 3 "" H 4300 6650 50  0001 C CNN
	1    4300 6650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0118
U 1 1 5C0FA551
P 4300 7100
F 0 "#PWR0118" H 4300 6850 50  0001 C CNN
F 1 "GND" H 4305 6927 50  0000 C CNN
F 2 "" H 4300 7100 50  0001 C CNN
F 3 "" H 4300 7100 50  0001 C CNN
	1    4300 7100
	1    0    0    -1  
$EndComp
Wire Wire Line
	4300 6400 4300 6500
Wire Wire Line
	4300 6800 4300 7100
$Comp
L power:VBUS #PWR0119
U 1 1 5C0FFED2
P 4100 900
F 0 "#PWR0119" H 4100 750 50  0001 C CNN
F 1 "VBUS" H 4115 1073 50  0000 C CNN
F 2 "" H 4100 900 50  0001 C CNN
F 3 "" H 4100 900 50  0001 C CNN
	1    4100 900 
	1    0    0    -1  
$EndComp
$Comp
L power:VBUS #PWR0120
U 1 1 5C0FFF4F
P 3250 6100
F 0 "#PWR0120" H 3250 5950 50  0001 C CNN
F 1 "VBUS" H 3265 6273 50  0000 C CNN
F 2 "" H 3250 6100 50  0001 C CNN
F 3 "" H 3250 6100 50  0001 C CNN
	1    3250 6100
	1    0    0    -1  
$EndComp
$Comp
L device:Polyfuse F1
U 1 1 5C102DC5
P 3750 6400
F 0 "F1" V 3525 6400 50  0000 C CNN
F 1 "500mA" V 3616 6400 50  0000 C CNN
F 2 "Fuse_Holders_and_Fuses:Fuse_SMD1206_HandSoldering" H 3800 6200 50  0001 L CNN
F 3 "" H 3750 6400 50  0001 C CNN
	1    3750 6400
	0    1    1    0   
$EndComp
Wire Wire Line
	4300 6400 3900 6400
Connection ~ 4300 6400
Wire Wire Line
	3600 6400 3250 6400
Wire Wire Line
	3250 6400 3250 6100
Wire Notes Line
	11000 6350 11000 2800
Wire Notes Line
	11000 2800 7000 2800
Wire Notes Line
	7000 2800 7000 6350
Wire Notes Line
	7000 6350 11000 6350
Text Notes 7050 2950 0    50   ~ 0
Core
Wire Notes Line
	6800 7400 3000 7400
Wire Notes Line
	3000 7400 3000 5700
Wire Notes Line
	3000 5700 6800 5700
Wire Notes Line
	6800 5700 6800 7400
Text Notes 6350 5850 0    50   ~ 0
Regulator
Wire Wire Line
	5650 5450 6100 5450
Wire Wire Line
	5650 4050 6100 4050
$Comp
L power:+3.3V #PWR0121
U 1 1 5C11C1C4
P 6100 4050
F 0 "#PWR0121" H 6100 3900 50  0001 C CNN
F 1 "+3.3V" V 6115 4178 50  0000 L CNN
F 2 "" H 6100 4050 50  0001 C CNN
F 3 "" H 6100 4050 50  0001 C CNN
	1    6100 4050
	0    1    1    0   
$EndComp
Wire Wire Line
	5650 5350 6100 5350
Wire Wire Line
	5650 5250 6100 5250
Wire Wire Line
	5650 5150 6100 5150
Wire Wire Line
	5650 5050 6100 5050
Wire Wire Line
	5650 4950 6100 4950
Wire Wire Line
	5650 4850 6100 4850
Wire Wire Line
	5650 4750 6100 4750
Wire Wire Line
	5650 4650 6100 4650
$Comp
L power:GND #PWR0123
U 1 1 5C13CF4B
P 6100 3950
F 0 "#PWR0123" H 6100 3700 50  0001 C CNN
F 1 "GND" V 6105 3822 50  0000 R CNN
F 2 "" H 6100 3950 50  0001 C CNN
F 3 "" H 6100 3950 50  0001 C CNN
	1    6100 3950
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0124
U 1 1 5C13CFD5
P 6100 5350
F 0 "#PWR0124" H 6100 5100 50  0001 C CNN
F 1 "GND" V 6105 5222 50  0000 R CNN
F 2 "" H 6100 5350 50  0001 C CNN
F 3 "" H 6100 5350 50  0001 C CNN
	1    6100 5350
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5650 3950 6100 3950
Text Label 5950 5250 0    50   ~ 0
BOOT
Text Label 5950 5150 0    50   ~ 0
NRST
Text Label 5950 5050 0    50   ~ 0
PA0
Text Label 5950 4950 0    50   ~ 0
PA1
Text Label 5950 4850 0    50   ~ 0
PA2
Text Label 5950 4750 0    50   ~ 0
PA3
Text Label 5950 4650 0    50   ~ 0
PA4
Wire Wire Line
	5650 3850 6100 3850
Wire Wire Line
	5650 3750 6100 3750
Text Label 5950 3850 0    50   ~ 0
PA14
Text Label 5950 3750 0    50   ~ 0
PA13
$Comp
L Connector:Conn_01x10 J2
U 1 1 5C16ACC6
P 5450 5050
F 0 "J2" H 5370 4325 50  0000 C CNN
F 1 "Conn_01x10" H 5370 4416 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x10_Pitch2.54mm" H 5450 5050 50  0001 C CNN
F 3 "~" H 5450 5050 50  0001 C CNN
	1    5450 5050
	-1   0    0    1   
$EndComp
$Comp
L Connector:Conn_01x10 J1
U 1 1 5C16AD71
P 5450 3650
F 0 "J1" H 5370 2925 50  0000 C CNN
F 1 "Conn_01x10" H 5370 3016 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x10_Pitch2.54mm" H 5450 3650 50  0001 C CNN
F 3 "~" H 5450 3650 50  0001 C CNN
	1    5450 3650
	-1   0    0    1   
$EndComp
Wire Wire Line
	5650 3450 6100 3450
Text Label 6000 3450 0    50   ~ 0
PB1
Wire Wire Line
	5650 3350 6100 3350
Text Label 6000 3350 0    50   ~ 0
PA7
Wire Wire Line
	5650 3250 6100 3250
Wire Wire Line
	5650 3150 6100 3150
Text Label 6000 3250 0    50   ~ 0
PA6
Text Label 6000 3150 0    50   ~ 0
PA5
Wire Wire Line
	5650 4550 6100 4550
$Comp
L power:GND #PWR0125
U 1 1 5C18CAEB
P 6100 4550
F 0 "#PWR0125" H 6100 4300 50  0001 C CNN
F 1 "GND" V 6105 4422 50  0000 R CNN
F 2 "" H 6100 4550 50  0001 C CNN
F 3 "" H 6100 4550 50  0001 C CNN
	1    6100 4550
	0    -1   -1   0   
$EndComp
$Comp
L power:PWR_FLAG #FLG0101
U 1 1 5C18CF64
P 850 1900
F 0 "#FLG0101" H 850 1975 50  0001 C CNN
F 1 "PWR_FLAG" H 850 2073 50  0000 C CNN
F 2 "" H 850 1900 50  0001 C CNN
F 3 "" H 850 1900 50  0001 C CNN
	1    850  1900
	-1   0    0    1   
$EndComp
$Comp
L power:+3.3V #PWR0126
U 1 1 5C18D024
P 850 1700
F 0 "#PWR0126" H 850 1550 50  0001 C CNN
F 1 "+3.3V" H 865 1873 50  0000 C CNN
F 2 "" H 850 1700 50  0001 C CNN
F 3 "" H 850 1700 50  0001 C CNN
	1    850  1700
	1    0    0    -1  
$EndComp
Wire Wire Line
	850  1700 850  1900
Wire Notes Line
	5100 5600 6800 5600
Text Notes 6400 2950 0    50   ~ 0
Headers
Wire Notes Line
	6800 5600 6800 2800
Wire Notes Line
	6800 2800 5100 2800
Wire Notes Line
	5100 2800 5100 5600
Text Notes 10600 7650 0    50   ~ 0
A
Wire Wire Line
	5650 3650 6100 3650
Wire Wire Line
	5650 3550 6100 3550
Text Label 5850 3650 0    50   ~ 0
USB_P
Text Label 5850 3550 0    50   ~ 0
USB_N
Wire Wire Line
	4300 6400 4500 6400
$Comp
L power:+5V #PWR03
U 1 1 5C1ACFC1
P 4500 6050
F 0 "#PWR03" H 4500 5900 50  0001 C CNN
F 1 "+5V" H 4515 6223 50  0000 C CNN
F 2 "" H 4500 6050 50  0001 C CNN
F 3 "" H 4500 6050 50  0001 C CNN
	1    4500 6050
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR04
U 1 1 5C1AD01C
P 6100 5450
F 0 "#PWR04" H 6100 5300 50  0001 C CNN
F 1 "+5V" V 6115 5578 50  0000 L CNN
F 2 "" H 6100 5450 50  0001 C CNN
F 3 "" H 6100 5450 50  0001 C CNN
	1    6100 5450
	0    1    1    0   
$EndComp
Wire Wire Line
	4500 6050 4500 6400
Connection ~ 4500 6400
Wire Wire Line
	4500 6400 4650 6400
$Comp
L Connector:Conn_ARM_JTAG_SWD_10 J4
U 1 1 5C0CD059
P 3800 4300
F 0 "J4" H 3360 4346 50  0000 R CNN
F 1 "SWD" H 3360 4255 50  0000 R CNN
F 2 "Pin_Headers:Pin_Header_Straight_2x05_Pitch1.27mm_SMD" H 3850 3750 50  0001 L TNN
F 3 "http://infocenter.arm.com/help/topic/com.arm.doc.faqs/attached/13634/cortex_debug_connectors.pdf" V 3450 3050 50  0001 C CNN
	1    3800 4300
	1    0    0    -1  
$EndComp
Wire Wire Line
	3800 3700 3800 3500
$Comp
L power:+3.3V #PWR02
U 1 1 5C0D1FE8
P 3800 3500
F 0 "#PWR02" H 3800 3350 50  0001 C CNN
F 1 "+3.3V" H 3815 3673 50  0000 C CNN
F 2 "" H 3800 3500 50  0001 C CNN
F 3 "" H 3800 3500 50  0001 C CNN
	1    3800 3500
	1    0    0    -1  
$EndComp
Wire Wire Line
	4300 4000 4600 4000
Text Label 4450 4000 0    50   ~ 0
NRST
NoConn ~ 4300 4400
NoConn ~ 4300 4500
$Comp
L power:GND #PWR01
U 1 1 5C0E1396
P 3750 5050
F 0 "#PWR01" H 3750 4800 50  0001 C CNN
F 1 "GND" H 3755 4877 50  0000 C CNN
F 2 "" H 3750 5050 50  0001 C CNN
F 3 "" H 3750 5050 50  0001 C CNN
	1    3750 5050
	1    0    0    -1  
$EndComp
Wire Wire Line
	3700 4900 3700 4950
Wire Wire Line
	3700 4950 3750 4950
Wire Wire Line
	3750 4950 3750 5050
Wire Wire Line
	3750 4950 3800 4950
Wire Wire Line
	3800 4950 3800 4900
Connection ~ 3750 4950
Wire Wire Line
	9800 3450 10500 3450
Wire Wire Line
	4600 4200 4300 4200
Wire Wire Line
	4300 4300 4600 4300
Text Label 4450 4200 0    50   ~ 0
PA14
Text Label 4450 4300 0    50   ~ 0
PA13
$Comp
L power:+5V #PWR0117
U 1 1 5C102D8B
P 1200 1700
F 0 "#PWR0117" H 1200 1550 50  0001 C CNN
F 1 "+5V" H 1215 1873 50  0000 C CNN
F 2 "" H 1200 1700 50  0001 C CNN
F 3 "" H 1200 1700 50  0001 C CNN
	1    1200 1700
	1    0    0    -1  
$EndComp
$Comp
L power:PWR_FLAG #FLG0102
U 1 1 5C102E1D
P 1200 1900
F 0 "#FLG0102" H 1200 1975 50  0001 C CNN
F 1 "PWR_FLAG" H 1200 2073 50  0000 C CNN
F 2 "" H 1200 1900 50  0001 C CNN
F 3 "" H 1200 1900 50  0001 C CNN
	1    1200 1900
	-1   0    0    1   
$EndComp
Wire Wire Line
	1200 1700 1200 1900
Wire Notes Line
	4900 5600 3000 5600
Wire Notes Line
	3000 5600 3000 2800
Wire Notes Line
	3000 2800 4900 2800
Wire Notes Line
	4900 2800 4900 5600
Text Notes 3050 2950 0    50   ~ 0
SWD
Wire Wire Line
	5350 2100 5800 2100
Wire Wire Line
	5350 1900 5350 2100
Wire Wire Line
	5350 1450 5350 1600
Wire Wire Line
	5350 1000 5350 1150
$Comp
L power:+3.3V #PWR0113
U 1 1 5C0C7FD0
P 5350 1000
F 0 "#PWR0113" H 5350 850 50  0001 C CNN
F 1 "+3.3V" H 5365 1173 50  0000 C CNN
F 2 "" H 5350 1000 50  0001 C CNN
F 3 "" H 5350 1000 50  0001 C CNN
	1    5350 1000
	1    0    0    -1  
$EndComp
$Comp
L device:R R2
U 1 1 5C0C7FC9
P 5350 1750
F 0 "R2" H 5420 1796 50  0000 L CNN
F 1 "80ohm" H 5420 1705 50  0000 L CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 5280 1750 50  0001 C CNN
F 3 "" H 5350 1750 50  0001 C CNN
	1    5350 1750
	1    0    0    -1  
$EndComp
$Comp
L device:LED D2
U 1 1 5C0C7FC2
P 5350 1300
F 0 "D2" V 5388 1183 50  0000 R CNN
F 1 "LED" V 5297 1183 50  0000 R CNN
F 2 "LEDs:LED_0805_HandSoldering" H 5350 1300 50  0001 C CNN
F 3 "~" H 5350 1300 50  0001 C CNN
	1    5350 1300
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6100 1450 6100 1600
Wire Wire Line
	6100 1000 6100 1150
$Comp
L power:+3.3V #PWR05
U 1 1 5C0DF2B3
P 6100 1000
F 0 "#PWR05" H 6100 850 50  0001 C CNN
F 1 "+3.3V" H 6115 1173 50  0000 C CNN
F 2 "" H 6100 1000 50  0001 C CNN
F 3 "" H 6100 1000 50  0001 C CNN
	1    6100 1000
	1    0    0    -1  
$EndComp
$Comp
L device:R R5
U 1 1 5C0DF2B9
P 6100 1750
F 0 "R5" H 6170 1796 50  0000 L CNN
F 1 "80ohm" H 6170 1705 50  0000 L CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 6030 1750 50  0001 C CNN
F 3 "" H 6100 1750 50  0001 C CNN
	1    6100 1750
	1    0    0    -1  
$EndComp
$Comp
L device:LED D3
U 1 1 5C0DF2C0
P 6100 1300
F 0 "D3" V 6138 1183 50  0000 R CNN
F 1 "PWR" V 6047 1183 50  0000 R CNN
F 2 "LEDs:LED_0805_HandSoldering" H 6100 1300 50  0001 C CNN
F 3 "~" H 6100 1300 50  0001 C CNN
	1    6100 1300
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR06
U 1 1 5C0E52CC
P 6100 2050
F 0 "#PWR06" H 6100 1800 50  0001 C CNN
F 1 "GND" H 6105 1877 50  0000 C CNN
F 2 "" H 6100 2050 50  0001 C CNN
F 3 "" H 6100 2050 50  0001 C CNN
	1    6100 2050
	1    0    0    -1  
$EndComp
Wire Wire Line
	6100 1900 6100 2050
$Comp
L device:R R6
U 1 1 5C0F1F04
P 8250 1400
F 0 "R6" H 8320 1446 50  0000 L CNN
F 1 "10k" H 8320 1355 50  0000 L CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 8180 1400 50  0001 C CNN
F 3 "" H 8250 1400 50  0001 C CNN
	1    8250 1400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0122
U 1 1 5C0F1F52
P 8250 1800
F 0 "#PWR0122" H 8250 1550 50  0001 C CNN
F 1 "GND" H 8255 1627 50  0000 C CNN
F 2 "" H 8250 1800 50  0001 C CNN
F 3 "" H 8250 1800 50  0001 C CNN
	1    8250 1800
	1    0    0    -1  
$EndComp
Wire Wire Line
	8250 1550 8250 1800
Wire Wire Line
	8250 1250 8250 1150
Connection ~ 8250 1150
Wire Wire Line
	8250 1150 8550 1150
Connection ~ 8400 1700
Wire Wire Line
	8400 1700 8550 1700
Wire Wire Line
	7700 1700 7950 1700
Wire Wire Line
	7100 1150 7100 900 
Wire Notes Line
	4400 600  4400 2300
Wire Notes Line
	4400 600  6700 600 
Wire Notes Line
	4400 2300 6700 2300
$Comp
L Oscillators:ASE-xxxMHz X1
U 1 1 5C1A2FB8
P 8750 5650
F 0 "X1" H 9091 5696 50  0000 L CNN
F 1 "ASE-xxxMHz" H 9091 5605 50  0000 L CNN
F 2 "Crystals:Crystal_SMD_Abracon_ABM3B-4pin_5.0x3.2mm" H 9450 5300 50  0001 C CNN
F 3 "http://www.abracon.com/Oscillators/ASV.pdf" H 8650 5650 50  0001 C CNN
	1    8750 5650
	1    0    0    -1  
$EndComp
Wire Wire Line
	8750 5350 8050 5350
Wire Wire Line
	8050 5350 8050 5500
Wire Wire Line
	8050 5800 8050 5950
Wire Wire Line
	8050 5950 8750 5950
Wire Wire Line
	8750 5950 8750 6100
Connection ~ 8750 5950
$Comp
L power:+3.3V #PWR07
U 1 1 5C1B9503
P 8750 5100
F 0 "#PWR07" H 8750 4950 50  0001 C CNN
F 1 "+3.3V" H 8765 5273 50  0000 C CNN
F 2 "" H 8750 5100 50  0001 C CNN
F 3 "" H 8750 5100 50  0001 C CNN
	1    8750 5100
	1    0    0    -1  
$EndComp
Wire Wire Line
	8750 5100 8750 5150
Connection ~ 8750 5350
Wire Wire Line
	8450 5650 8350 5650
Wire Wire Line
	8350 5650 8350 5150
Wire Wire Line
	8350 5150 8750 5150
Connection ~ 8750 5150
Wire Wire Line
	8750 5150 8750 5350
Wire Wire Line
	9050 5650 9550 5650
Text Label 9300 5650 0    50   ~ 0
OSC_IN
$EndSCHEMATC
