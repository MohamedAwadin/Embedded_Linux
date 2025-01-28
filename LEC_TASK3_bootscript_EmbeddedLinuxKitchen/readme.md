# U-Boot Script for Raspberry Pi 3B+ Boot

This guide outlines the steps to create and run a U-Boot script on a Raspberry Pi 3B+ to load a firmware from either the MMC (SD card) or via TFTP.

## Prerequisites

Before starting, make sure you have the following:

- A Raspberry Pi 3B+ with U-Boot installed at a sd-card, see the [readme](https://github.com/MohamedAwadin/Embedded_Linux/tree/main/LEC_Task1_EmbeddedLinux/RPI_BOOTING_SEQ) to understand.

## Steps

### 1. **Create the U-Boot Script**

Create a script file (`boot_script.txt`) with the following content:

```bash
setenv loadFromFAT \
"if mmc dev; then run checkFileExistInMMC; else run loadFromTFTP; fi"

setenv checkFileExistInMMC \
"if fatload mmc 0:1 0x0800000 led_flash.bin; then echo Find File on MMC; else run loadFromTFTP; fi"

setenv loadFromTFTP \
"if tftp 0x0800000 led_flash.bin; then echo Find File on TFTP Server; else echo Cant Find File; fi"

setenv bootcmd "run loadFromFAT"

saveenv

```
#### **Edit using VIM**
<p align='center'>
<img width="95%" src="./images/uboot_script.png"/>
</p> 

---

### 2. **Convert the Script to U-Boot Format**
- After creating the `.txt` script, you need to convert it into a format that U-Boot can execute. This is done using the `mkimage` tool, which generates a `binary` file from the plain text script. This file is a binary format recognized by U-Boot for running scripts.
- Use the `mkimage` tool to convert the script into a U-Boot-compatible binary (`ubootscript`):

```bash
sudo apt update
sudo apt install u-boot-tools
mkimage -T script -n "Bootscript" -C none -d uboot-script.txt ubootscript
```

This generates the `ubootscript` file that can be executed by U-Boot.

#### **Convert .txt to binary**
<p align='center'>
<img width="95%" src="./images/generate_bin.png"/>
</p> 

---

### 3. **Set Up the TFTP Server**

1. **Install TFTP server** on your PC:
   ```bash
   sudo apt install tftpd-hpa
   ```

2. **Move the script to the TFTP directory** (`/srv/tftp/`):
   ```bash
   sudo cp -r ubootscript /srv/tftp
   ```
 #### **Copy to tftp directory**
<p align='center'>
<img width="95%" src="./images/generate_bin1.png"/>
</p> 


3. **Configure Network**:
   First, you need to configure the network interface on your PC to be in the same subnet as the Raspberry Pi. Use the following commands:

   - To check your network interface and ensure it's up:
     ```bash
     ifconfig
     ```

   - To assign a static IP address to your network interface (replace `enp59s0` with your actual network interface name if different):
     ```bash
     sudo ip a add 192.168.1.19/24 dev enp59s0
     ```

4. **Restart the TFTP server** to apply the changes:
   ```bash
   sudo systemctl restart tftpd-hpa
   ```
---

### 4. **Transfer and Run the Script on Raspberry Pi**

1. **Set IP addresses** for the Raspberry Pi and the TFTP server in U-Boot:
   ```bash
   setenv serverip <PC_TFTP_SERVER_IP>
   setenv ipaddr <RPI_IP>
   ```
    #### **Set IP addresses**
    <p align='center'>
    <img width="95%" src="./images/2.png"/>
    </p> 

2. **Transfer the script** to the Raspberry Pi via TFTP:
   ```bash
   tftp 0x01000000 ubootscript
   ```

3. **Execute the script** in U-Boot:
   ```bash
   source 0x01000000
   ```
### **Transfer the script via TFTP and Source/Run It**
<p align='center'>
<img width="95%" src="./images/load_from_tftp_source.png"/>
</p> 

---

### 5. **Testing**

### **Find File on MMC**
<p align='center'>
<img width="95%" src="./images/mmc_find_file.png"/>
</p> 

### **Find File on TFTP Server Directory**
<p align='center'>
<img width="95%" src="./images/find_file_tftp.png"/>
</p>     

### **Can't Find file**
<p align='center'>
<img width="95%" src="./images/cant_find_file.png"/>
</p>     
