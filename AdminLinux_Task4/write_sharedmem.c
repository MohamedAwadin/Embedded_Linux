#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "sharedmem.h"

#define BLOCK_SIZE 4096


int main(int argc , char *argv[]){

    if (argc != 2)
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

    //printf("Writing: \"%s\"\n", argv[1]);
    strncpy(block, argv[1], BLOCK_SIZE);
    printf("Block Address: %p\n", block);
    printf("Content Written: %s\n", block);

    detach_memory_block(block);

    return 0;
}