#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <fcntl.h>
#include <unistd.h>

int main(int argc, char *argv[]) {
    
    int variable = open("/sys/class/leds/input4::capslock/brightness", O_RDWR);
    
    if (strcmp(argv[1], "on") == 0) 
    {
        dprintf(variable, "1\n");    
    } 
    else if (strcmp(argv[1], "off") == 0) {
        dprintf(variable, "0\n");
        
    } 
    return 0;
}
