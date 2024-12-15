# Shared Memory IPC Project
## Run the programm
<p align='center'>
<img width="60%" src="./images/full_task.png"/>
</p> 

---

## How It Works
- Shared Memory Creation: A shared memory block is created or accessed using the `shmget` system call. The filename (`write_sharedmem.c`) is used to generate a unique key for the shared memory.

- Writing Data: The `write_sharedmem.c` program takes a string as input, attaches to the shared memory block, and writes the string to it.

- Reading Data: The `read_sharedmem.c` program reads the data from the shared memory and prints it to the terminal.

- Memory Cleanup: The `destroy_sharedmem.c` program removes the shared memory block using the `shmctl` system call.

----

## Refernces help me :

- [How to Set up Shared Memory in Your Linux and MacOS Programs. (shmget, shmat, shmdt, shmctl, ftok)](https://youtu.be/WgVSq-sgHOc?si=48x4arVMjszFoHOr)

- [shmget()](https://www.ibm.com/docs/en/zos/2.5.0?topic=functions-shmget-get-shared-memory-segment#rshmgt)

- [shmdt()](https://www.ibm.com/docs/en/zos/2.5.0?topic=functions-shmdt-shared-memory-detach-operation)

- [shmctl()](https://www.ibm.com/docs/en/zos/2.5.0?topic=functions-shmctl-shmctl64-shared-memory-control-operations)