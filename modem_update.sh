#!/bin/bash
 
echo "Setting Up GPIO Pins"
gpio mode 7 out
gpio mode 1 out

echo "Sending STM32 Device Into Bootloader Mode"
gpio write 7 1
gpio write 1 0
sleep .5
gpio write 1 1
gpio write 7 0

echo "Resetting GPIO Pins"
gpio mode 7 in
gpio mode 1 in

echo "Attempting to program STM32 device"
echo "The following output is from stm32flash:"
echo

stm32flash -v -w ./"$1" -R /dev/ttyS1

echo "stm32flash completed"
