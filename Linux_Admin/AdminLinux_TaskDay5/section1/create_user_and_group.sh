#!/bin/bash


#USER_NAME="awadin_2"
#GROUP_NAME="awadin_group"

echo "Enter the username to create :"
read -r USER_NAME


echo "Enter the group name to create :"
read -r GROUP_NAME


echo "Cleaning up any existing user/group with the same name.."
sudo userdel -r "$USER_NAME"
sudo groupdel "$GROUP_NAME"



echo "Creating a new user and group..."
sudo adduser "$USER_NAME"
echo "New user '$USER_NAME' created successfully :)"

sudo groupadd "$GROUP_NAME"
echo "New group '$GROUP_NAME' created successfully :)"


echo "Verifying user and group details..."
cat /etc/passwd | grep "$USER_NAME"
cat /etc/group  | grep "$GROUP_NAME"



echo "Adding user '$USER_NAME' to group '$GROUP_NAME'..."
sudo usermod -aG "$GROUP_NAME" "$USER_NAME"



echo "Script execution completed successfully."
