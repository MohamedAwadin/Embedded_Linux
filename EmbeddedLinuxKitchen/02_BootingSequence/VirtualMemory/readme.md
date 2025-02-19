# Virtual SD Card Creation

This document provides a step-by-step guide to creating a virtual SD card on a Linux system. The process involves creating a disk image, partitioning it, formatting the partitions, and mounting them for use. Below is a detailed explanation of each command used in the process, including the specific choices made during the partitioning step.

## Prerequisites

- A Linux-based operating system.
- Administrative privileges (sudo access).

## Steps to Create a Virtual SD Card

### 1. Create a Disk Image

The first step is to create a disk image file that will act as our virtual SD card. We use the `dd` command to create a file filled with zeros.

```bash
dd if=/dev/zero of=sd.img bs=1M count=1023
```

- **`if=/dev/zero`**: Specifies the input file. `/dev/zero` is a special file that provides as many null characters as are read from it.
- **`of=sd.img`**: Specifies the output file, which will be our disk image.
- **`bs=1M`**: Sets the block size to 1 megabyte.
- **`count=1023`**: Specifies the number of blocks to copy, resulting in a 1023 MB file.

**Output:**
```
1023+0 records in
1023+0 records out
1072693248 bytes (1.1 GB, 1023 MiB) copied, 0.659766 s, 1.6 GB/s
```
<p align='center'>
<img width="95%" src="./images/dd.png"/>
</p> 

### 2. Partition the Disk Image

Next, we use `cfdisk` to partition the disk image. Here are the specific steps you followed:

```bash
cfdisk sd.img
```

1. **Choose DOS Partition Table:**
   - When prompted, select **DOS/MBR** as the partition table type.
   - It is ideal for legacy systems, embedded devices, and BIOS-based booting. For larger disks or UEFI systems, GPT would be more appropriate, but ``MBR`` **(Master Boot Record)** is perfect for your use case.
<p align='center'>
<img width="95%" src="./images/cfdisk.png"/>
</p> 

2. **Create the First Partition:**
   - Create a new partition with a size of **200M**.
   - Set the partition as **primary** and **bootable**.
   - Choose the partition type as **FAT16**.
<p align='center'>
<img width="95%" src="./images/cfdisk_part1.png"/>
</p> 

3. **Create the Second Partition:**
   - Use the remaining space for the second partition.
   - Set the partition as **extended**.
   - Choose the partition type as **Linux**.

<p align='center'>
<img width="95%" src="./images/cfdisk_part2.png"/>
</p> 


4. **Write Changes:**
   - Select **Write** to save the changes to the disk image.
   - Confirm by typing `yes`.

**Output:**
```
Syncing disks.
```

### 3. Set Up Loop Device

- We then set up a loop device to associate the disk image with a device file.
- A **loop device** in Linux is a virtual block device that allows a file (like sd.img) to be treated as a physical disk. It "loops" the file back to the system, enabling operations like partitioning, formatting, and mounting. This is commonly used for disk images, virtual machines, or testing filesystems without needing physical hardware.

```bash
sudo losetup --partscan -f --show sd.img
```

- **`losetup`**: Associates loop devices with regular files or block devices.
- **`--partscan`**: Forces the kernel to scan the partition table on the newly created loop device.
- **`-f`**: Finds the first unused loop device.
- **`--show`**: Prints the name of the assigned loop device.

<p align='center'>
<img width="95%" src="./images/losetup.png"/>
</p> 

**Output:**
```
/dev/loop36
```

### 4. Verify the Loop Device

We use `lsblk` to verify that the loop device and its partitions have been created correctly.

```bash
lsblk
```

**Output:**
```
loop36        7:36   0  1023M  0 loop 
├─loop36p1  259:8    0   200M  0 part 
└─loop36p2  259:9    0   822M  0 part 
```
<p align='center'>
<img width="95%" src="./images/lsblk.png"/>
</p> 

### 5. Format the Partitions

- We format the partitions with appropriate file systems.
- The ``mkfs`` command in Linux is used to create (or "make") a filesystem on a partition or disk. It formats the storage with a specific filesystem type (e.g., ext4, FAT, NTFS) so it can store files and directories. For example, mkfs.ext4 creates an ext4 filesystem, while mkfs.vfat creates a FAT filesystem.


```bash
sudo mkfs.vfat -F 16 -n boot /dev/loop36p1
sudo mkfs.ext4 -L rootfs /dev/loop36p2
```

- **`mkfs.vfat`**: Creates a FAT filesystem.
  - **`-F 16`**: Specifies a 16-bit FAT.
  - **`-n boot`**: Sets the volume label to "boot".
- **`mkfs.ext4`**: Creates an ext4 filesystem.
  - **`-L rootfs`**: Sets the volume label to "rootfs".

<p align='center'>
<img width="95%" src="./images/mkffs.png"/>
</p> 

### 6. Create Mount Points and Mount the Partitions

- We create directories to serve as mount points and then mount the partitions.
- The **`mount`** command in Linux attaches a filesystem (like a partition or disk) to a directory (called a mount point), making its contents accessible to the system. For example, `mount /dev/sda1 /mnt` makes the files on `/dev/sda1` available under the `/mnt` directory. Unmounting with `umount` detaches it.

```bash
mkdir boot rootfs
sudo mount /dev/loop36p1 boot/
sudo mount /dev/loop36p2 rootfs/
```

- **`mkdir boot rootfs`**: Creates directories named `boot` and `rootfs`.
- **`mount`**: Attaches the filesystem found on the specified device to the directory.

**Output:**
```
loop36        7:36   0  1023M  0 loop 
├─loop36p1  259:8    0   200M  0 part /home/awadin/ITI_9Monthes/EmbeddedLinux_Kitchen/VirtualSdCard/boot
└─loop36p2  259:9    0   822M  0 part /home/awadin/ITI_9Monthes/EmbeddedLinux_Kitchen/VirtualSdCard/rootfs
```

<p align='center'>
<img width="95%" src="./images/mount_1.png"/>
</p> 

<p align='center'>
<img width="95%" src="./images/mount_2.png"/>
</p> 

<p align='center'>
<img width="95%" src="./images/mount_3.png"/>
</p> 

### 7. Unmount the Partitions

- When done, unmount the partitions to safely detach them.
- The **`umount`** command in Linux detaches a mounted filesystem from its mount point, making it no longer accessible to the system. For example, `umount /mnt` safely removes the filesystem mounted at `/mnt`, ensuring all data is synced and the filesystem is properly disconnected.

```bash
sudo umount /home/awadin/ITI_9Monthes/EmbeddedLinux_Kitchen/VirtualSdCard/boot
sudo umount /home/awadin/ITI_9Monthes/EmbeddedLinux_Kitchen/VirtualSdCard/rootfs
```
<p align='center'>
<img width="95%" src="./images/umount.png"/>
</p> 


## Conclusion

You have successfully created a virtual SD card on Linux, partitioned it, formatted the partitions, and mounted them for use. This setup can be useful for testing, development, or any scenario where a physical SD card is not available.

