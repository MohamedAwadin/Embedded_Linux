# Extra Task 
Description : Controling the PC's leds. By interacts directly with the Linux LED subsystem by writing to the appropriate system file in /sys/class/leds.

## Program1: Caps Lock LED Control
> How It work :

- Turn LED On: Pass the argument *on* to turn the Caps Lock LED on.
- Turn LED Off: Pass the argument *off* to turn the Caps Lock LED off.

>Be attention :

- The program must be executed on a Linux system.
- Root privileges are required to write to the LED control file. (sudo)
- The target LED is identified by the path /sys/class/leds/input4::capslock/brightness, compare this path to your path first.

> Usage 

- To turn on the LED:
```bash
sudo ./ctrl_capsLock_Led on
```

- To turn off the LED:
```bash
sudo ./ctrl_capsLock_Led off
```


## Program2: KeyBoard Backlight Control
> How It is work :

- High Brightness: Pass the argument *high* to maximize the brightness.
- Low Brightness: Pass the argument *low* to reduce the brightness.
- Turn Off Backlight: Pass the argument *off* to completely turn of the backlight .


>Be attention :

- The program must be executed on a Linux system.
- Root privileges are required to write to the LED control file. (sudo)
- The target LED is identified by the path /sys/class/leds/dell::kbd_backlight/brightness, compare this path to your path first.

> Usage 

- TSet brightness to high:
```bash
sudo ./ctrl_backlight_bright high
```

- Set brightness to low:
```bash
sudo ./ctrl_backlight_bright low
```

- Turn off the backlight:
```bash
sudo ./ctrl_backlight_bright off
```