#!/bin/bash
mkdir -p ~/myDirectory
echo "Done : Create a directory called 'myDirectory' in my home folder"
mkdir -p ~/myDirectory/secondDirectory
echo "Done : Inside 'myDirectory,' create another directory named 'secondDirectory.'"
touch ~/myDirectory/secondDirectory/myNotePaper
echo "Done : Within 'secondDirectory,' create a file named 'myNotePaper.'"
cp ~/myDirectory/secondDirectory/myNotePaper ~/myDirectory/
echo "Done : Copy 'myNotePaper' from 'secondDirectory' to 'myDirectory.'" 
mv ~/myDirectory/myNotePaper ~/myDirectory/myOldNotePaper
echo "Done : Rename the copied file in 'myDirectory' to 'myOldNotePaper.'"
echo "Script Done All the tasks . "


