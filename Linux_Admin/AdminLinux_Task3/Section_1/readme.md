# Section 1 Task 
Write a Bash script that checks IF the .bashrc file exists in the user's home
directory. If it does, append new environment variables to the file: one called
HELLO with the value of HOSTNAME, and another local variable called LOCAL
with the value of the whoami command. Additionally, the script should include a
command to open another terminal at the end. Describe what happens when the
terminal is opened.

## 1. Script 

<p align='center'>
<img width="95%" src="./images/script.png"/>
</p> 

## 2. Run the Script 
```bash
chmod +x BashScript.sh
./BashScript.sh
```
<p align='center'>
<img width="95%" src="./images/runscript.png"/>

## 3.  Know it is work Correctley 

> Open the .bashrc after run the script 

<p align='center'>
<img width="95%" src="./images/bashrcfile.png"/>

> Check the Variable 

```bash
echo $HELLO
```
```plaintext
Awadin
```
```bash
echo $LOCAL
```
```plaintext
awadin
```

<p align='center'>
<img width="95%" src="./images/printvar.png"/>

## Explain

The script adds two environment variables to the .bashrc file: 
- one as a globally exported variable 
- and the other as a local shell variable. 
>By doing so, every new terminal instance—assuming it sources the .bashrc file—will automatically have these variables defined, ensuring consistent availability across sessions.