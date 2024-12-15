#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/types.h>
#include <sys/ipc.h>
#include <sys/shm.h>

#include "sharedmem.h"

#define  IPC_RESULT_ERROR (-1)


static int get_shared_block(char *filename, int size){
    
    // __STD_TYPE __KEY_T_TYPE __key_t;	/* Type of an IPC key.  */
    key_t key ;

    //  Request a key 
    //  The key is linked to a file name, so that program can access it.
    //  I want key 0 that go with this file 
    key = ftok(filename, 0);
    if (key == IPC_RESULT_ERROR)
    {
        return IPC_RESULT_ERROR;
    }

    // get shared block ---- create it if it doesn't exist 
    // the last argument tells it first the permissions we want to use.
    // ipc.h >> #define IPC_CREAT	01000		/* Create key if key does not exist. */

    // 0666 > 101  101 101 
    // 0644 > 101  100 100 
    return shmget(key , size, 0644|IPC_CREAT);

}


char * attach_memory_block(char * filename , int size ){
    int shared_block_id = get_shared_block(filename, size);
    char *result;

    if (shared_block_id == IPC_RESULT_ERROR)
    {
        return NULL;
    }

    // map the shared block into this process's memory 
    // and give me a pointer to it 

    result = shmat(shared_block_id, NULL, 0);
    // If unsuccessful, shmat() returns -1
    if (result == (char*)IPC_RESULT_ERROR)
    {
        return NULL;
    }
    return result ; 
}



bool detach_memory_block(char   * block){
    /*The shmdt() function detaches from the calling process's address
     space the shared memory segment located at the address specified by the argument shmaddr.
    */
    return (shmdt(block) != IPC_RESULT_ERROR); 
}



bool destroy_memory_block(char  * filename){

    int shared_block_id = get_shared_block(filename, 0);

     
    if (shared_block_id == IPC_RESULT_ERROR)
    {
        return NULL;
    }
    //The shmctl service provides a variety of shared memory control operations as specified by the Command parameter.
    //These functions include reading and changing shared memory variables with the shmid_ds data structure, and removing a shared memory segment from the system.
    //---
    // Ipc_RMID > This command removes the shared memory identifier that is specified by Shared_Memory_ID from the system, and removes the shared memory segment and SHMID_DS data structure that are associated with it. 
    /*The shmctl() or shmctl64() function provides a variety of shared memory control operations on the shared memory segment identified by the argument, shmid.
     */
    return (shmctl(shared_block_id, IPC_RMID, NULL) != IPC_RESULT_ERROR);

}