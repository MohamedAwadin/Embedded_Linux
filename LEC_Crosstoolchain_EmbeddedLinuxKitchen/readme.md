# Cross-Toolchain Build with Crosstool-NG

This document outlines the steps to build a cross-toolchain using `crosstool-ng` on a Linux system. The cross-toolchain is targeted for the `arm-cortexa9_neon-linux-gnueabihf` architecture.

## Prerequisites

Before starting, ensure the following dependencies are installed on your system:
- `git`
- `build-essential`
- `libtool`
- `gawk`
- `gperf`
- `bison`
- `flex`
- `texinfo`
- `libgmp3-dev`
- `libmpc-dev`
- `libmpfr-dev`
- `libexpat1-dev`
- `libncurses5-dev`
- `python3`

You can install these dependencies on Ubuntu/Debian using:
```bash
sudo apt update
sudo apt install git build-essential libtool gawk gperf bison flex texinfo libgmp3-dev libmpc-dev libmpfr-dev libexpat1-dev libncurses5-dev python3
```

## Steps to Build the Cross-Toolchain

### 1. Clone the Crosstool-NG Repository
Clone the official `crosstool-ng` repository from GitHub:
```bash
git clone git@github.com:crosstool-ng/crosstool-ng.git
cd crosstool-ng/
```

### 2. Checkout the Desired Version
Check out the stable version `crosstool-ng-1.26.0`:
```bash
git checkout crosstool-ng-1.26.0
```

### 3. Bootstrap the Build System
Run the bootstrap script to generate the necessary configuration files:
```bash
./bootstrap
```

### 4. Configure the Build
Configure the build to enable local mode (no installation required):
```bash
./configure --enable-local
```

### 5. Build Crosstool-NG
Compile the `crosstool-ng` tool:
```bash
make
```

### 6. List Available Samples
List the available pre-configured toolchain samples:
```bash
./ct-ng list-samples
```

### 7. Select the Target Architecture
Choose the `arm-cortexa9_neon-linux-gnueabihf` sample for the ARM Cortex-A9 architecture with NEON support:
```bash
./ct-ng arm-cortexa9_neon-linux-gnueabihf
```

### 8. Configure the Toolchain (Optional)
Open the configuration menu to customize the toolchain settings:
```bash
./ct-ng menuconfig
```
Make any necessary changes and save the configuration.

<p align='center'>
<img width="95%" src="./images/gui_1.png"/>
</p> 

<p align='center'>
<img width="95%" src="./images/gui_target.png"/>
</p> 

<p align='center'>
<img width="95%" src="./images/gui_lib.png"/>
</p> 

<p align='center'>
<img width="95%" src="./images/gui_lang.png"/>
</p> 

<p align='center'>
<img width="95%" src="./images/gui_lib.png"/>
</p> 

<p align='center'>
<img width="95%" src="./images/guidebug_fac.png"/>
</p> 

### 9. Build the Toolchain
Start the build process. This step may take a while depending on your system's performance:
```bash
./ct-ng build
```

### 10. Verify the Toolchain
Once the build is complete, the toolchain will be located in the `~/x-tools` directory. Verify its contents:
```bash
ls ~/x-tools
```
You should see a directory named `arm-awadin-linux-musleabihf` (or similar), which contains the cross-compiler and associated tools.

<p align='center'>
<img width="95%" src="./images/xtools.png"/>
</p> 

## Using the Cross-Toolchain
To use the cross-toolchain, add its `bin` directory to your `PATH` environment variable. For example:
```bash
export PATH=~/x-tools/arm-awadin-linux-musleabihf/bin:$PATH
```

You can now use the cross-compiler (`arm-awadin-linux-musleabihf-gcc`) to build software for the ARM Cortex-A9 target.



## References

- [Crosstool-NG Official Documentation](https://crosstool-ng.github.io/docs/)
- [Crosstool-NG GitHub Repository](https://github.com/crosstool-ng/crosstool-ng)

---