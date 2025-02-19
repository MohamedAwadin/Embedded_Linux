#!/bin/bash
Bashrc_file="${HOME}/.bashrc"

if [ -f "$Bashrc_file" ]; then
    echo "File ${Bashrc_file} exists."
    echo "export HELLO=\$(hostname)" >> "$Bashrc_file"
    echo "LOCAL=\$(whoami)" >> "$Bashrc_file"
else 
    echo "File ${Bashrc_file} does not exist."
fi 

terminator &

exit 0
