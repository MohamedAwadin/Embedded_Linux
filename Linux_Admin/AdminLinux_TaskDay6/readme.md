# AdminLinux_TaskDay6

## Section 1:

1. Create a folder called myteam in your home directory and change its permissions to read only for the owner.

<p align='center'>
<img width="100%" src="./images/s1_q1.png"/>
</p>


2. Log out and log in by another user
<p align='center'>
<img width="100%" src="./images/s1_q2.png"/>
</p>



3. Try to access (by cd command) the folder (myteam)
<p align='center'>
<img width="100%" src="./images/s1_q3.png"/>
</p>



4. Using the command Line
    
    a. Change the permissions of oldpasswd file to give owner read and write permissions and for group write and execute and execute only for the others (using chmod in 2 different ways)
    <p align='center'>
    <img width="100%" src="./images/q4_a.png"/>
    </p>
    
    b. Change your default permissions to be as above.
    <p align='center'>
    <img width="100%" src="./images/q4_b.png"/>
    </p>
    
    c. What is the maximum permission a file can have, by default when it is just created? And what is that for directory.

    <p align='center'>
    <img width="100%" src="./images/q4.c.png"/>
    </p>
    

    d. Change your default permissions to be no permission to everyone then create a directory and a file to verify.
    <p align='center'>
    <img width="100%" src="./images/q4_d.png"/>
    </p>
    
    e. State who can access a this file if any with proof.

    <p align='center'>
    <img width="100%" src="./images/q4_e.png"/>
    </p>
    

5. Create a file with permission 444. Try to edit in it and to remove it? Note what happened.

<p align='center'>
<img width="100%" src="./images/q5_1.png"/>
</p>

<p align='center'>
<img width="100%" src="./images/q5_2.png"/>
</p>


6. What is the difference between the “x” permission for a file and for a directory?
<p align='center'>
<img width="100%" src="./images/q6.png"/>
</p>

- Create a new directory.
    1. Set the sticky bit on the newly created directory.
    <p align='center'>
    <img width="100%" src="./images/q7_1.png"/>
    </p>
    2. set the setgui bit on the created directory
    <p align='center'>
    <img width="100%" src="./images/q7_2.png"/>
    </p>
    3. Create multiple user accounts.
    <p align='center'>
    <img width="100%" src="./images/q7_3.png"/>
    </p>

    4. Allow these users to create files within the directory and directory.
    5. Attempt to delete or rename each other's files.
    6. Provide a clear output demonstrating the impact of the sticky bit on file deletion and renaming within the directory.
    7. Provide a clear output for the directory created.
    <p align='center'>
    <img width="100%" src="./images/q7_4.png"/>
    </p>

## Why Does passwd Have the S (SetUID) Bit?
    - The SetUID bit (s) allows the passwd command to run with the permissions of its owner (which is root), regardless of which user invokes it.


    