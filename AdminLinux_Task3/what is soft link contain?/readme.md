# SoftLink(Symbolic link) :

## Important Defination: 
- A soft link (symbolic link) does not directly store the inode of the original file. Instead, it saves a ` reference to the path of the target file.` The information about this reference is stored in `the filesystem's `metadata` for the symbolic link.`

- A symbolic link is another file that contains the path name for the original file; in essence, a reference to the file. A symbolic link can refer to a path name for a file that does not exist.

## Eaxmple :
> Command :
```bash
ln -s /u/smitha/proja /u/benson/proja
```
> Explain:

- The /u/benson/proja is the name of the new file containing the reference to the file named /u/smitha/proja.

<p align='center'>
<img width="95%" src="./images/bpxa4sl2.gif"/>
</p> 

When you create a symbolic link, you create a new physical file with its own inode number, as shown in Figure. Because a symbolic link refers to a file by `its path name rather than by its inode number`, a symbolic link can refer to files in other mounted file systems.

## How Soft Links Save the Reference Path:

1. File Content in Metadata: 
- A soft link is treated as a special file type that contains the path to the target file or directory (not the actual inode of the target).
- The path saved in the symbolic link can be either absolute (full path) or relative (relative path).

2. Filesystem Location:

- The symbolic link's metadata includes its own inode (distinct from the target's inode) where the reference path is stored as its "data."
- The link's inode and metadata are managed by the filesystem, just like any other file.

3. Accessing the Target:

- When the symbolic link is accessed, the operating system uses the stored path to locate the actual file and fetch its inode from the disk.

## Example to Practice :

1. Create a soft link 

<p align='center'>
<img width="90%" src="..//Section_2/images/q7_p1.png"/>
</p> 

2. Show the Inode of Original file and the Link file 

> Inode Original File :

<img width="90%" src="./images/inode_originalfile.png"/>
</p> 

> Inode Symbolic File :

<img width="90%" src="./images/inode_softlink.png"/>
</p>

3. Verify :
> Command shows the path stored in the symbolic link.

```bash
readlink /boot/passwd_link
```
Output:
```
/etc/passwd
```
4. To get the metadata of the target file:

>Command (Using stat) :
```bash
stat --dereference /boot/passwd_link
```
- This will show the metadata of the file the symbolic link points to, rather than the link itself.

Output :
```
  File: /boot/passwd_link
  Size: 3243      	Blocks: 8          IO Block: 4096   regular file
Device: 804h/2052d	Inode: 2624588     Links: 2
Access: (0644/-rw-r--r--)  Uid: (    0/    root)   Gid: (    0/    root)
Access: 2024-12-08 12:07:42.244480677 +0200
Modify: 2024-12-07 19:07:09.281687183 +0200
Change: 2024-12-08 12:07:21.720561050 +0200
 Birth: -
```
- in line 3 you can see the Inode number of the original file.

 > You can resolve the symbolic link and print the inode of the target file using find:

 ```bash
 find -L /boot/passwd_link -printf '%i\n'
 ```

 - Output :
 ```
 2624588
 ```
- Note : 
1.  `-L`
The -L option tells the find command to follow symbolic links. Without this option, find would treat a symbolic link as a file and would not resolve it to its target.
2. ` -printf '%i\n' ` 
- The -printf option allows custom output formatting. Here:

- %i: Prints the inode number of the file being processed (in this case, the target of the symbolic link, because of -L).



## REFERANCES :
- https://www.ibm.com/docs/en/zos/2.5.0?topic=links-creating-symbolic-link

- https://www.redhat.com/en/blog/soft-links-linux






