# Running Linux Kernel on QEMU Emulator for vexpress-A9 Board

This guide provides step-by-step instructions for running a Linux kernel on the QEMU emulator for the vexpress-A9 board.

## Prerequisites

Before starting, ensure you have the following:

- QEMU installed on your system. You can install it using:
  ```bash
  sudo apt update
  sudo apt install qemu-system-arm
  ```
- Cross-compilation toolchain .
  - Follow this [Link](https://github.com/MohamedAwadin/Embedded_Linux/tree/main/LEC_Crosstoolchain_EmbeddedLinuxKitchen) to Generate your own Cross-compilation toolchain.


## Steps

### Step 1: Download and Configure the Linux Kernel
1. Clone the Linux kernel source code:
   ```bash
   git clone --depth=1 git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
   cd linux
   ```
2. Configure the kernel for the Vexpress-A9 board:
   ```bash
   export ARCH=arm 
   export CROSS_COMPILE=~/x-tools/arm-awadin-linux-musleabihf/bin/arm-awadin-linux-musleabihf-
   make vexpress_defconfig
   ```
3. Enter the kernel menuconfig to customize:
   ```bash
   make menuconfig
   ```
   1- Enable **devtmpfs**:
      - In the Linux kernel, `devtmpfs` is a virtual filesystem that provides a simple and automated way to manage device nodes in the `/dev` directory. It is essential for handling devices dynamically.
      - Purpose: `devtmpfs` automatically creates and removes device nodes in the `/dev` directory for all devices detected by the kernel. This simplifies device management during boot and runtime.
      <p align='center'>
      <img width="95%" src="./images/devtmpfs.png"/>
      </p> 

   2- Change Kernel Compression Mode to **XZ**:
     - the Kernel Compression Mode setting determines how the Linux kernel image is compressed. The compression mode affects the size of the kernel image and the time it takes to decompress it during the boot process.
     <p align='center'>
     <img width="95%" src="./images/Kernel_compression_mode.png"/>
     </p> 

   3-Change your kernel local version to your name and append on it <youName>-v1.0 
   <p align='center'>
    <img width="95%" src="./images/local_version_name.png"/>
    </p> 
    
### Step 2: Build the Linux Kernel
1. Compile the kernel:
   ```bash
   make 
   ```
2. Once completed, you will find the `zImage` (compressed kernel image), and `Image` (uncompressed kernel image) in the `arch/arm/boot/` directory:
   ```bash
   cd arch/arm/boot/
   ```
   - Difference Images types :


    | Image Type | Compressed | Metadata Header | Bootloader       | Use Case                                      |
    |------------|------------|------------------|------------------|-----------------------------------------------|
    | zImage     | Yes        | No               | Any              | Embedded systems, storage-limited devices.    |
    | Image      | No         | No               | Any              | Debugging or devices with no storage constraints. |
    | uImage     | Yes        | Yes (U-Boot)     | U-Boot           | Embedded systems using U-Boot.                |
    | vmlinuz    | Yes        | Bootloader-specific | GRUB, LILO    | Standard Linux distributions on PCs/servers.  |
    
   <p align='center'>
   <img width="95%" src="./images/z_images.png"/>
   </p> 

   <p align='center'>
   <img width="95%" src="./images/file_z_images.png"/>
   </p> 

### Step 3: Prepare SD-Card boot partition with the Device Tree Blob (DTB) and zImage.

   - You Can find the .dtb for your board in the `/arch/arm/boot/dts/arm`
   > NOTE : The Device Tree is a data structure that represents the hardware layout of a system, including CPUs, memory, peripherals, buses, and other components. It is typically written in a human-readable format called Device Tree Source (DTS), which is then compiled into a binary format called the Device Tree Blob (DTB).

   - you must copy the .dtb file and zImage to the boot partition on your virtual sd-card

   ```bash
   sudo losetup --partscan -f --show sd.img
   ``` 
<p align='center'>
   <img width="95%" src="./images/vir_sdcard.png"/>
   </p> 
   
### Step 4: Run the Linux Kernel on QEMU
1. Launch the QEMU emulator with the following command:

```bash
qemu-system-arm -M vexpress-a9 -kernel u-boot -nographic -sd ~/ITI_9Monthes/EmbeddedLinux_Kitchen/sd_card/sd.img
```
- Be aware, to change the file location to your `u-boot` and virtual `sd.img` locations  

2- Change the bootargs environment variable to Sets the console for kernel messages :
 > NOTE: The `bootargs` environment variable in U-Boot is used to pass kernel command-line arguments to the Linux kernel during the boot process. These arguments are crucial for configuring the kernel's behavior at runtime.
<p align='center'>
   <img width="95%" src="./images/bootargs_init.png"/>
   </p> 

```bash
setenv bootargs console=ttyAMA0
saveenv
```
3- Load Your Kernel and DTB to situble address.

   - `kernel_addr_r` environment variable in U-Boot specifies the memory address where the Linux kernel image should be loaded into RAM during the boot process.
   - `fdt_addr_r` environment variable in U-Boot specifies the memory address where the Flattened Device Tree (FDT), or Device Tree Blob (DTB), is loaded during the boot process. 

   <p align='center'>
   <img width="95%" src="./images/fatload_kernel_dtb.png"/>
   </p> 

4- bootz your kernel image 
    <p align='center'>
   <img width="95%" src="./images/bootz.png"/>
   </p>

   



### Step 5: Troubleshooting kernel Panics

1- Kernel kill because dosen't find rootfile system location 

 <p align='center'>
   <img width="95%" src="./images/kernel_panic.png"/>
   </p>

> SOLUTION : Specifies the root filesystem device on `bootargs` environment varible

<p align='center'>
   <img width="95%" src="./images/bootargs_rootfs.png"/>
   </p>

2- Kernel kill because dosen't find init process

 <p align='center'>
   <img width="95%" src="./images/panic_noinit.png"/>
   </p>

> SOLUTION : Specifies an alternative init program to start on `bootargs` environment varible.

[1] - Create init C program file :
<p align='center'>
   <img width="95%" src="./images/vim_init.png"/>
   </p>

[2] - Compile this c file using your cross compiler for this target.
<p align='center'>
   <img width="95%" src="./images/compile_init.png"/>
   </p>

[3] - Move output file to your sdcard rootfs partion on `/sbin`.

[4] - Specifies an init program to start on `bootargs` environment varible.

<p align='center'>
   <img width="95%" src="./images/bootargs_init.png"/>
   </p>

<p align='center'>
   <img width="95%" src="./images/kill_init.png"/>
   </p>


3- Kernel kill find init process:

> SOLUTION : To Solve this Problem you can use `dash` terminal as an init process

[1] - Compile dash using your cross compiler for this target.

<p align='center'>
   <img width="95%" src="./images/compile_dash.png"/>
   </p>

[2] - Move output file to your sdcard rootfs partion on `/sbin`.

[3] - Specifies an init program to start on `bootargs` environment varible.

<p align='center'>
   <img width="95%" src="./images/init_dash.png"/>
   </p>

<p align='center'>
   <img width="95%" src="./images/dash_initProcess.png"/>
   </p>
