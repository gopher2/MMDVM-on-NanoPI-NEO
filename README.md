# MMDVM-on-NanoPI-NEO
how to setup a NanoPI NEO for MMDVM operations

NanoPi Neo Setup for MTR2k

DD image do sd card
NanoPI will pull DHCP address, check DHCP  leases for address
ssh to addess
login root / 1234
proceede through set wizard

Basics:
sudo apt-get install vim
setup hostname / networking
hostname repeater
vi /etc/hosts
vi /etc/hostname
IP Address setup

Zerotier:
curl -s https://install.zerotier.com | sudo bash
zerotier-cli join 159924d630ef79db

Setup Serial:
edit /boot/armbianEnv.txt
change
overlays=usbhost1 usbhost2
to
overlays=uart1 uart2 uart3
reboot

Install prereqs
sudo apt-get install -y stm32flash vim git gcc-arm-none-eabi  libnewlib-arm-none-eabi libstdc++-arm-none-eabi-newlib

Download this repo and install
modem_update.sh

Install GPIO programmer
cd ~
git clone https://github.com/friendlyarm/WiringNP
cd WiringNP/
git checkout nanopi-m1
chmod 755 build
./build
sudo cp ./gpio/gpio /usr/local/bin/



Download compile and install Firmware
git clone https://github.com/g4klx/mmdvm
cd mmdvm
git submodule init
git submodule update
make eda405 or make eda405 #depending on hardware
cp bin/mmdvm_f4.hex ~/
cd ~
modem_update.sh mmdvm_f4.hex


