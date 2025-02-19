# ** `SystemV` Creating a HeartApp Service on Runlevel 4 to Print a Heart Pattern**

This guide documents the steps taken to create a new service (`HeartApp`) on **runlevel 4** that runs a script (`heart.sh`) to print a heart-shaped pattern repeatedly. The service is managed using a SystemV-style init script and `start-stop-daemon`.

---

## **Table of Contents**
1. [Introduction to SystemV Init](#introduction-to-systemv-init)
2. [Introduction to the Project](#introduction-to-the-project)
3. [Prerequisites](#prerequisites)
4. [Steps](#steps)
   - [Step 1: Create the `heart.sh` Script](#step-1-create-the-heartsh-script)
   - [Step 2: Create the `HeartApp` Init Script](#step-2-create-the-heartapp-init-script)
   - [Step 3: Set Up Runlevel 4](#step-3-set-up-runlevel-4)
   - [Step 4: Test the Service](#step-4-test-the-service)
   - [Step 5: Verify Output](#step-5-verify-output)
5. [Troubleshooting](#troubleshooting)
6. [Conclusion](#conclusion)

---

## **Introduction to SystemV Init**

### **What is SystemV Init?**
SystemV Init (or SysV Init) is one of the oldest initialization systems used in Linux distributions. It is responsible for starting, stopping, and managing system services during the boot process and runtime. SystemV Init uses a series of scripts located in `/etc/init.d` to manage services, and it organizes these scripts into **runlevels**, which define the system's state (e.g., single-user mode, multi-user mode, etc.).

### **Key Concepts of SystemV Init**
1. **Runlevels**:
   - Runlevels define the system's operational state. Each runlevel corresponds to a specific set of services that should be running.

| **Runlevel** | **Description** |
|-------------|----------------|
| `0` | Halt (Shutdown) |
| `1` | Single-user mode (Maintenance) |
| `2` | Multi-user mode (No network) |
| `3` | Multi-user mode with Networking (Server Mode) |
| `4` | Unused/Custom |
| `5` | Multi-user mode with GUI (Desktop) |
| `6` | Reboot |


2. **Init Scripts**:
   - Init scripts are located in `/etc/init.d` and are used to start, stop, restart, and check the status of services.
   - These scripts follow a standard format and support commands like `start`, `stop`, `restart`, and `status`.

3. **Symbolic Links in Runlevel Directories**:
   - Each runlevel has a corresponding directory (e.g., `/etc/rc0.d`, `/etc/rc1.d`, etc.).
   - Symbolic links in these directories point to the scripts in `/etc/init.d`.
   - Links starting with `S` (e.g., `S99HeartApp`) are started in that runlevel.
   - Links starting with `K` (e.g., `K01HeartApp`) are stopped in that runlevel.

4. **start-stop-daemon**:
   - A utility used in init scripts to manage daemons or background processes.
   - It ensures that only one instance of a process runs at a time and provides options for starting, stopping, and checking the status of processes.

### **Why Use SystemV Init?**
- **Simplicity**: SystemV Init is straightforward and easy to understand.
- **Compatibility**: It is widely supported, even in minimal environments like BusyBox.
- **Control**: It provides fine-grained control over services and runlevels.

---

## **Introduction to the Project**
The goal of this project is to create a custom service (`HeartApp`) that runs on **runlevel 4** and executes a script (`heart.sh`) to print a heart-shaped pattern every 10 seconds. The service is managed using a SystemV-style init script and `start-stop-daemon`.

---

## **Prerequisites**
- A working Raspberry Pi 3B+ with a custom 64-bit kernel and BusyBox init system.
- A USB drive with a `boot` partition (FAT32) and a `rootfs` partition (ext4) See This [Readme](../LEC_TASK5_BusyBox_EmbeddedLinuxKitchen/RPI3B+/readme.md).

---

## **Steps**

### **Step 1: Create the `heart.sh` Script**
1. Create the `heart.sh` script in `/usr/bin`:
   ```bash
   mkdir -p /usr/bin
   vi /usr/bin/heart.sh
   ```

2.  Create your `heart.sh` script, and make sure to redirect the output of `heart.sh` to a log file for debug:

- Log File System :
<img src="images/log.png">

- `heart.sh` Script :
<img src="images/heart_sh.png">


3. Make the script executable:
   ```bash
   chmod +x /usr/bin/heart.sh
   ```

---

### **Step 2: Create the `HeartApp` Init Script**
1. Create the `HeartApp` init script in `/etc/init.d`:
   ```bash
   mkdir -p /etc/init.d
   vi /etc/init.d/HeartApp
   ```

2. Edit your `HeartApp` script:
   
   1-
    <img src="images/HeartApp_1.png">
   2- 
   <img src="images/HeartApp_2.png">

3. Make the script executable:
   ```bash
   chmod +x /etc/init.d/HeartApp
   ```

---

### **Step 3: Set Up Runlevel 4**
1. Create the runlevel directories if they don’t already exist:
   ```bash
   mkdir -p /etc/rc{0,1,2,3,4,5,6}.d
   ```

2. Link the `HeartApp` script to runlevel 4:
   ```bash
   ln -s ../init.d/HeartApp /etc/rc4.d/S99HeartApp
   ```
   <img src="images/ln.png">

---

### **Step 4: Test the Service**
<img src="images/HeartApp_Status.png">

---

### **Step 5: Verify Output**


1. **System Logs**:
   - You can read ``heart.log`` to see the output :
   ```bash
   /var/log # cat heart.log 
   ```

   <img src="images/heart_log.png">

---

## **Troubleshooting**
- **Service not starting**:
  - Ensure the `/var/run` directory exists and is writable:
    ```bash
    mkdir -p /var/run
    chmod 777 /var/run
    ```
---


## **References**
- [BusyBox Documentation](https://busybox.net/)
- [SystemV Init Scripts Guide](https://www.tldp.org/HOWTO/HighQuality-Apps-HOWTO/boot.html)

--- 
