# MMDVM on STM32-DVM-MTR2K

DD image to SD card

NanoPI will pull DHCP address, check DHCP  leases for address

ssh to addess

login root / 1234

# Install prereqs
```
sudo apt-get install -y stm32flash vim git gcc-arm-none-eabi  libnewlib-arm-none-eabi libstdc++-arm-none-eabi-newlib build-essential
```

# Basics
proceed through setup wizard

setup hostname / networking

setup IP address

# Zerotier (optional)
```
curl -s https://install.zerotier.com | sudo bash
zerotier-cli join 159924d630ef79db
```

# Setup Serial Port
edit /boot/armbianEnv.txt

change

overlays=usbhost1 usbhost2

to

overlays=uart1 uart2 uart3

reboot


# Clone this repo
TBD
modem_update.sh

# Install GPIO programmer
```
cd ~
git clone https://github.com/friendlyarm/WiringNP
cd WiringNP/
git checkout nanopi-m1
chmod 755 build
./build
sudo cp ./gpio/gpio /usr/local/bin/
```


# MMDVM Firmware 
```
git clone https://github.com/g4klx/mmdvm
cd mmdvm
git submodule init
git submodule update
make eda405 or make eda405 #depending on hardware
cp bin/mmdvm_f4.hex ~/
cd ~
modem_update.sh mmdvm_f4.hex
```

# MMDVM Host Software
cd ~
git clone https://github.com/g4klx/MMDVMHost.git
cd MMDVMHost
make
sudo make install
sudo make install-service



