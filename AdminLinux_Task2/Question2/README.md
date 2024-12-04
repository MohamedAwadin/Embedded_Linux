# Question 2 

## Req : Move the binary file output to the directory /usr/local/bin with sudo permissions.

>Command to move main output file to bin location 

```bash
sudo mv main /usr/local/bin 
```

> Command to change dir to the /usr/local/bin and check the availabilty of main

```bash
cd /usr/loca/bin 
ls
```
> OUTPUT 
```bash
async-json-rpc-server  platformio         tabulate          ZED_Explorer
bottle.py              __pycache__        uvicorn           ZEDfu
main                 pyserial-miniterm  ZED_Calibration   ZED_Sensor_Viewer
pio                    pyserial-ports     ZED_Depth_Viewer  ZED_SVO_Editor
piodebuggdb            readelf.py         ZED_Diagnostic
```
> Now you can run main from any terminal.

```bash
awadin@Awadin:~$ main

Array Elements (sorted):
Element [0] = 22
Element [1] = 27
Element [2] = 32
Element [3] = 54
Element [4] = 54
Element [5] = 55
Element [6] = 75
Element [7] = 99
Element [8] = 556
Element [9] = 666
Enter any element to search using Binary Search: 99
Element 99 found at Index = 7

Array Elements (sorted):
Element [0] = 22
Element [1] = 27
Element [2] = 32
Element [3] = 54
Element [4] = 54
Element [5] = 55
Element [6] = 75
Element [7] = 99
Element [8] = 556
Element [9] = 666
Enter any element to search using Binary Search:
```
Screenshot  1
<p align='center'>
<img width="95%" src="./images/mv_path.png"/>
</p> 

##  *Detailed Explanation*

1. **The Environment PATH Variable**  
   - Linux uses the `PATH` environment variable to locate executables.
     ```bash
     echo $PATH
     ```

   - Typical directories in `PATH` include `/usr/local/bin`.

2. **Placing the Binary in a PATH Directory**  
   - When I moved the binary to `/usr/local/bin`, I placed it in one of the directories listed in the `PATH` environment variable.
   - As a result, the shell can find and execute the binary without needing to specify its full path.


### Why It Works Globally  
Placing an executable in a directory included in the `PATH` variable makes it globally accessible. The system doesn't care about the current working directory because it searches for the binary in the listed `PATH` directories. As long as the binary is in one of these directories, it can be executed from anywhere.

         