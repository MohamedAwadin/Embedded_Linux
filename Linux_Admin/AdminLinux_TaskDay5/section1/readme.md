# User and Group Creating Script

This script automates the creation of a user and a group on a Linux system. 

<p align='center'>
<img width="100%" src="./images/script.png"/>
</p>

## Script Overview

The bash script performs the following actions:

1.  **Prompts for User and Group Names:**
<p align='center'>
<img width="100%" src="./images/input.png"/>
</p>     
-  These will be stored in the `USER_NAME` and `GROUP_NAME` variables respectively

2. **Cleanup :**
The script removes any existing user or group with the provided names to avoid conflicts


3.  **User and  Group Creation:**
<p align='center'>
<img width="100%" src="./images/create.png"/>
</p>    

- It creates a new user with the specified `USER_NAME` using `sudo adduser "$USER_NAME"` 

-  It creates a new group with the specified `GROUP_NAME` using `sudo groupadd "$GROUP_NAME"`


5.  **Verification:**
<p align='center'>
<img width="100%" src="./images/verify.png"/>
</p>    

- Displaying their details


6.  **Adding User to Group:**
<p align='center'>
<img width="100%" src="./images/add.png"/>
</p>

- It adds the user to the specified group using `sudo usermod -aG "$GROUP_NAME" "$USER_NAME"`.



## Notes

*   This script requires `sudo` privileges to execute.

