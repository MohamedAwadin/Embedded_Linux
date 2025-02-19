# Caps Lock Control GUI with Keyboard Brightness & System Monitoring runs as a ``systemD`` service at system startup.

## Overview

This project provides a **Qt-based GUI application** that allows users to control the Caps Lock LED, adjust the keyboard backlight brightness, and monitor CPU temperature and battery level. The application features a **login screen with an animated background** and runs as a **systemd service** at system startup.

---

## What is Systemd?

**Systemd** is a system and service manager for Linux operating systems. It is responsible for initializing the system, managing services, and handling dependencies between services. Here are some key concepts:

1. **Units**:
   - Systemd uses configuration files called **units** to define services, targets, and other resources.
   - Units are typically stored in `/etc/systemd/system/` or `/usr/lib/systemd/system/`.
   - Common unit types include:
     - **Service units**: Define how a service should be started, stopped, and managed.
     - **Target units**: Group multiple units together (e.g., `graphical.target` starts all services required for a graphical environment).
     - **socket**: A network socket associated with a service.

     - **device**: A device specifically managed with systemd.

     - **mount**: A mountpoint managed with systemd.

     - **automount**: A mountpoint automatically mounted on boot.

     - **swap**: Swap space on the system.

2. **Service Management**:
   - Systemd allows you to start, stop, enable, disable, and monitor services.
   - Commands include:
     - `systemctl start <service>`: Start a service.
     - `systemctl stop <service>`: Stop a service.
     - `systemctl enable <service>`: Enable a service to start at boot.
     - `systemctl disable <service>`: Disable a service from starting at boot.
     - `systemctl status <service>`: Check the status of a service.

3. **Dependencies**:
   - Systemd ensures services start in the correct order by managing dependencies.
   - For example, the `After=` directive in the `[Unit]` section ensures the service starts after the specified target or service.

4. **Journal Logging**:
   - Systemd provides a logging system called **journald**.
   - Logs can be viewed using the `journalctl` command:
     - `journalctl -u <service>`: View logs for a specific service.
     - `journalctl -f`: Follow logs in real-time.

---

## Systemd Service Configuration

The application is configured to run as a **systemd service**. Below is the configuration for the `capslockcontrol.service` file:

```ini
[Unit]
Description=Caps Lock Control GUI
After=graphical.target

[Service]
ExecStart=/media/awadin/extra/ITI/capslockcontrol/build/Desktop_Qt_6_5_3_GCC_64bit-Debug/appcapslockcontrol
Restart=always
User=awadin
Environment=DISPLAY=:1
Environment=XDG_RUNTIME_DIR=/run/user/1000
WorkingDirectory=/media/awadin/extra/ITI/capslockcontrol/
StandardOutput=journal
StandardError=journal

[Install]
WantedBy=graphical.target
```

### Explanation of the Systemd Service File

#### **[Unit] Section**
- **Description**: A brief description of the service. This is displayed when you query the service status.
- **After**: Specifies that the service should start after the `graphical.target`. This ensures the GUI environment is ready before the application starts.

#### **[Service] Section**
- **ExecStart**: The command to start the application. This should point to the compiled executable.
- **Restart**: Ensures that the service restarts automatically if it fails or crashes.
- **User**: The user under which the service runs. This ensures the application has the necessary permissions.
- **Environment**: Sets environment variables required for the GUI application:
  - `DISPLAY=:1`: Specifies the display server for the GUI.
  - `XDG_RUNTIME_DIR=/run/user/1000`: Specifies the runtime directory for the user.
- **WorkingDirectory**: The directory from which the application runs. This is useful for resolving relative paths.
- **StandardOutput** and **StandardError**: Redirects output and errors to the systemd journal for logging.

#### **[Install] Section**
- **WantedBy**: Specifies the target under which the service should be started. `graphical.target` ensures the service starts with the graphical environment.

---

## Application Components

### 1. **Main.qml**
The `Main.qml` file defines the GUI layout and behavior of the application. It includes:
- **Login Page**: An animated background with a button to enter the control panel.
- **Control Page**: Contains controls for the Caps Lock LED, keyboard backlight brightness, CPU temperature, and battery level.

### 2. **main.cpp**
The `main.cpp` file initializes the Qt application and sets up the QML engine. It also registers the `CapsLockControl` class as a QML context property.

### 3. **capslockcontrol.cpp and capslockcontrol.h**
These files define the `CapsLockControl` class, which handles the logic for:
- Controlling the Caps Lock LED.
- Adjusting the keyboard backlight brightness.
- Monitoring CPU temperature and battery level.

---

## **Install the Systemd Service**
- Copy the `capslockcontrol.service` file to `/etc/systemd/system/`:
  ```bash
  sudo cp capslockcontrol.service /etc/systemd/system/
  ```
- Reload the systemd daemon to apply changes:
  ```bash
  sudo systemctl daemon-reload
  ```
- Enable the service to start at boot:
  ```bash
  sudo systemctl enable capslockcontrol.service
  ```
- Start the service:
  ```bash
  sudo systemctl start capslockcontrol.service
  ```



## Troubleshooting

- **Service Fails to Start**:
  - Check the systemd journal for errors:
    ```bash
    journalctl -u capslockcontrol.service
    ```
- **GUI Not Displaying**:
  - Ensure the `DISPLAY` environment variable is correctly set and the graphical environment is running.

---

## Final Video Output:
<video src="/LEC_TASK7_SystemD_EmbeddedLinuxKitchen/images/video.mp4" width="500" height="500" controls></video>


## Referances

- [ Fedora's documentation on systemd ](https://docs.fedoraproject.org/en-US/quick-docs/systemd-understanding-and-administering/)

- [Systemd Service Files](https://www.freedesktop.org/software/systemd/man/latest/systemd.service.html)
- [Understanding Systemd Units and Unit Files](https://www.digitalocean.com/community/tutorials/understanding-systemd-units-and-unit-files)




