#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "sharedmem.h"




int main(int argc , char *argv[]){

    if (argc != 1)
    {
        return -1;
    }

    if (destroy_memory_block(FILENAME))
    {
        printf("Destroyed Block: %s\n", FILENAME);
    }
    else{
        printf("Could not Destroy Block: %s\n", FILENAME);
    }
    
    return 0;
}