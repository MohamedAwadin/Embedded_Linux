# Section 2 Task

## Q1. List the user commands and redirect the output to /tmp/commands.list

> Command: redirect the output of /usr/bin directory to /tmp/commands.list

```bash
ls /usr/bin > /tmp/commands.list
```
<p align='center'>
<img width="95%" src="./images/q1_p1.png"/>
</p> 

<p align='center'>
<img width="95%" src="./images/q1_p2.png"/>
</p> 

## Q2. Edit in your profile to display date at login and change your prompt permanently.

<p align='center'>
<img width="95%" src="./images/q2_p1.png"/>
</p> 

<p align='center'>
<img width="95%" src="./images/q2_p2.png"/>
</p> 

## Q3. What is the command to count the word in a file or number of file in directory. (a. Count the number of user commands)


> Use the wc (word count) command.

<p align='center'>
<img width="95%" src="./images/wc_man.png"/>
</p> 


> Example : 
```bash
wc -w man_wc.txt 
```
<p align='center'>
<img width="95%" src="./images/wc_man_1.png"/>
</p> 

> Count the Number of User Commands

```bash
ls /usr/bin | wc -l
```

<p align='center'>
<img width="95%" src="./images/count_cmd.png"/>
</p> 

## Q4. What happens if you execute:

- a. cat filename1 | cat filename2

<p align='center'>
<img width="60%" src="./images/q4_p1.png"/>
</p> 
> The pipe (|) sends the output of one command as the input to another, but in *cat filename1 | cat filename2* example, the second cat command doesn't use the piped input correctly, instead reading the contents of filename2. So, the result is the contents of filename2 being displayed, not the combined content of both files.

- b. ls | rm

<p align='center'>
<img width="60%" src="./images/q4_p2.png"/>
</p> 

- c. ls /etc/passwd | wc -l
<p align='center'>
<img width="60%" src="./images/q4_p3.png"/>
</p> 

> the output of ls /etc/passwd is just the file name, the result of wc -l will be 1

## Q5. Write a command to search for all files on the system that, its name is “.profile”.

> Command:

```bash
sudo find / -name .profile
```
<p align='center'>
<img width="60%" src="./images/q5.png"/>
</p> 

## Q6. List the inode numbers of /, /etc, /etc/hosts.
<p align='center'>
<img width="60%" src="./images/q6_p1.png"/>
</p> 
<p align='center'>
<img width="60%" src="./images/q6_p2.png"/>
</p> 
