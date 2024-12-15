#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "sharedmem.h"

//#define BLOCK_SIZE 4096


int main(int argc , char *argv[]){

    if (argc != 1)
    {
        return -1;
    }

    //grap the shared memory block
    char * block = attach_memory_block(FILENAME, BLOCK_SIZE);
    if (block == NULL)
    {
        /* code */
        printf("Error : Couldn't get block \n");
        return -1;
    }

    // printf("Hello\n");
    //printf("Reading: \"%s\"\n", block);
    printf("Block Address: %p\n", block);
    printf("Content Read: %s\n", block);
    

    detach_memory_block(block);

    return 0;
}