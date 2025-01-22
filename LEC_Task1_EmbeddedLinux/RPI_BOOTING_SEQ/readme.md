# The boot sequence of Raspberry Pi 3 Model B

## RPI3 model B boot sequence

<p align='center'>
<img width="95%" src="./images/rpi3b-boot-sequence.png"/>
</p> 



## Raspberry Pi 3B+ Boot Sequence:

### The boot sequence for the Raspberry Pi 3B+ is as follows:

1-  Boot ROM (First Stage Bootloader):
- Hardcoded into the Raspberry Pi's SoC (System on Chip).

- Looks for the second-stage bootloader (bootcode.bin) on the SD card.

2- Second Stage Bootloader (bootcode.bin):
- Loaded by the Boot ROM.
- Initializes the GPU and reads config.txt for configuration settings.
- Loads the third-stage bootloader (start.elf).

3- Third Stage Bootloader (start.elf):
- Loaded by bootcode.bin.
- Reads config.txt multiple times to configure hardware settings.
- Loads the Device Tree Blob (*.dtb) and kernel (kernel.img or kernel8.img) into RAM.
- Starts the kernel.

### Files Required on the SD Card
To boot the Raspberry Pi 3B+, you need the following files in the boot partition of the SD card:

1. Essential Files:
- bootcode.bin: Second-stage bootloader.

- start.elf: Third-stage bootloader.

- fixup.dat: GPU firmware configuration.

- config.txt: Configuration file for hardware settings [The official page to configure config.txt file can be found here.](https://www.raspberrypi.com/documentation/computers/config_txt.html).

- cmdline.txt: Kernel command-line parameters.
[The official page to cmdline.txt file can be found here.](https://www.raspberrypi.com/documentation/computers/configuration.html#kernel-command-line-cmdline-txt).

2. Device Tree Blob (DTB):

- bcm2837-rpi-3-b-plus.dtb: Device Tree Blob for the Raspberry Pi 3B+.


3. Overlays (Optional):

overlays/: Directory containing Device Tree Overlays.


## Download bootloader files

Download ``bootcode.bin`` and ``start.elf`` files from [Official rpi firmware repo](https://github.com/raspberrypi/firmware/tree/master/boot). These files are proprietary GPU firmware files and are necessary to start RPI3 model B.

Copy downloaded files to ~/rpi3/sdCardFiles/ directory.

```bash
mkdir -p ~/rpi3/sdCardFiles
cd ~/rpi3/sdCardFiles
cp ~/Downloads/bootcode.bin ~/Downloads/start.elf ./
```

## Cross compiling U-boot bootloader for Raspberry Pi 3 Model B

We use U-boot to do the following :

- Initialized basic hardware
- Load kernel, device tree from non volatile storage or network (through tptp).
- Make Linux kernel to load network file system and pass other important command line parameters.


Download the U-boot


```bash
cd ~/EmbeddedLinux_Kitchen 
git clone git://git.denx.de/u-boot.git
git checkout v2025.01
cd u-boot
```
The configs directory contains configuration file for the Raspberry Pi 3 Model B and other popular boards.

## Compile U-boot for Raspberry Pi 3 Model B

RPI 3 model b has already a predefined configuration in the u-boot configs directory. Let’s compile the u-boot for this platform.

What is Cross-Compilation?
- Cross-compilation is the process of compiling code on one system (e.g., your Ubuntu PC) for a different target system (e.g., the Raspberry Pi 3B+). This is useful when the target system has limited resources or when you want to speed up the compilation process.

Setting Up Cross-Compilation for Raspberry Pi 3B+
- To use the ``CROSS_COMPILE`` variable, you need to have the appropriate cross-compilation tools installed. Here's how to set it up:

1. If you Build Your Own Cross-Compiler :
```bash
export CROSS_COMPILE=~/x-tools/arm-awadin-linux-musleabihf/bin/arm-awadin-linux-musleabihf-
```
2. OR On your Ubuntu PC, you install the cross-compiler for aarch64 (64-bit ARM architecture) and use it :
```bash
sudo apt update
sudo apt install gcc-aarch64-linux-gnu
export CROSS_COMPILE=aarch64-linux-gnu-
```
```bash
make rpi_3_defconfig
make -j`nproc`
```

> Make sure that the U-boot is compiled for ARM aarch64 architecture with the following command.
```bash
file u-boot
```

Then Copy the u-boot.bin file compiled also to the ~/rpi3/sdCardFiles/ folder.

```bash
cp ~/rpi3/u-boot/u-boot.bin ./
```

## Add basic configuration in the config.txt

Create a minimal config.txt configuration file in the ~/rpi3/sdCardFiles/ directory with the following lines.

```plaintext 
arm_64bit=1
kernel=u-boot.bin
enable_uart=1

```
- The ``kernel=u-boot.bin`` loads u-boot.bin in the place of actual Linux kernel.
- The ``arm_64bit=1`` tells the firmware to start ARM cores in 64 bit mode.
- The ``enable_uart=1``, to enable uart for serial monitor 

## Prepare SD card

#### Create two partitions using cfdisk and mkfs

- First partition is type fat32 with label boot. Create filesystem with mkfs.vfat.
- Second partition is type Linux with label rootfs. Create filesystem with mkfs.ext4.

Once the SD card partitioning is done, copy above mentioned files to SD card.

```bash 
cp -r ~/rpi3/sdCardFiles/. <PATH_TO_BOOT_PART_MOUNT_POINT> # Use lsblk command to find the mount point
```
Ex: cp -r ~/rpi3/sdCardFiles/. /media/awadin/boot/

## Power up the board.

### Connect the Raspberry Pi to Your PC via UART(TTL)

### Wiring:

#### Connect the TTL-USB converter to the Raspberry Pi's GPIO pins as follows:

- TTL-USB GND → Raspberry Pi GND (Pin 6).

- TTL-USB TX → Raspberry Pi RX (Pin 10, GPIO 15).

- TTL-USB RX → Raspberry Pi TX (Pin 8, GPIO 14).

- Plug the TTL-USB converter into your PC.

### Set Up Serial Communication on Your PC
- Identify the Serial Device: On your PC, identify the serial device name for the TTL-USB converter:

```bash
dmesg | grep tty
```
Look for something like /dev/ttyUSB0 or /dev/ttyACM0.

### Install a Serial Terminal Program:

- Install minicom or screen on your PC:

```bash
sudo apt update
sudo apt install minicom
```

### Open the Serial Connection:

- Use minicom to connect to the Raspberry Pi:

```bash
sudo minicom -D /dev/ttyUSB0 -b 115200
```
Replace /dev/ttyUSB0 with the correct device name.

### Power Up the Raspberry Pi
Insert the SD card into the Raspberry Pi.

Power up the Raspberry Pi using a compatible power supply.

You should see boot messages in the minicom terminal on your PC.

<p align='center'>
<img width="95%" src="./images/p2_1.png"/>
</p> 

#### Use ``bdinfo`` command to display information about the board  This command provides details about the hardware configuration, memory layout, and other relevant parameters of the system.

- We use this command to identify the  STATR Address of DRAM > ``0x0000000000000000000``
<p align='center'>
<img width="95%" src="./images/p2_2.png"/>
</p> 

#### Use ``fatload`` command to write data from the rom(mmc) Partion_1 into the DRAM

<p align='center'>
<img width="95%" src="./images/p2_3.png"/>
</p>

#### Use ``md`` command to view the data into the ram 

<p align='center'>
<img width="95%" src="./images/p2_4.png"/>
</p>