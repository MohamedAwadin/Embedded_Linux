# Section 2:

## Q1. Create a supplementary (Secondary) group called pgroup with group ID of 30000


1. Insert group at '/etc/group' File

<p align='center'>
<img width="100%" src="./images/insert_group.png"/>
</p>

2. Check the group at '/etc/group' File

<p align='center'>
<img width="100%" src="./images/t1_verify.png"/>
</p>


3. Add a User to the Group at '/etc/group' File

<p align='center'>
<img width="100%" src="./images/t1_adduser.png"/>
</p>


4. Check User Groups

<p align='center'>
<img width="100%" src="./images/t1_checkgroups.png"/>
</p>

## Q2. Lock any user created account so he can't log in.

<p align='center'>
<img width="100%" src="./images/t2_change_auth.png"/>
</p>

## Q3. Delete user account.

<p align='center'>
<img width="100%" src="./images/t3_userdelete.png"/>
</p>

## Q4. Delete group account

1. Delete group from '/etc/group' file

<p align='center'>
<img width="100%" src="./images/t4_deletegr.png"/>
</p>

2. Verify 

<p align='center'>
<img width="100%" src="./images/t4_verify.png"/>
</p>

## Q5. State the difference between adduser and useradd with example shown.

- adduser:
    It is a user-friendly script which Create a user with its home directory and its files automatically.

<p align='center'>
<img width="100%" src="./images/t5_adduser.png"/>
</p>

- useradd:
  It is a bin application. t doesn't automatically set up certain things like home directories, default shell, and user groups unless specified via options. You should create the home directory manually.

<p align='center'>
<img width="100%" src="./images/t5_useradd.png"/>
</p>