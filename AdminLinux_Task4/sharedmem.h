#ifndef SHAREDMEM_H
#define SHAREDMEM_H

#include <stdbool.h>




// attach a shared memory block
// associted with filename 
// create it if it doesn't exist 

char * attach_memory_block(char * filename , int size );
bool detach_memory_block(char   * block);
bool destroy_memory_block(char  * filename);

#define BLOCK_SIZE 4096
#define FILENAME   "write_sharedmem.c"
//#define FILENAME   "/tmp/sharedmem_file"


#endif 