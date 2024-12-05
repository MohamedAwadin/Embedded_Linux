#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <fcntl.h>
#include <unistd.h>

int main(int argc, char *argv[]) {
    
    int variable = open("/sys/class/leds/dell::kbd_backlight/brightness", O_RDWR);
    
    if (strcmp(argv[1], "high") == 0) 
    {
        dprintf(variable, "2\n");    
    } 
    else if (strcmp(argv[1], "low") == 0) {
        dprintf(variable, "1\n");
        
    }
    else if (strcmp(argv[1], "off") == 0) {
        dprintf(variable, "0\n");
        
    } 
    else {
        fprintf(stderr, "Error: Argument must be 'high', 'low', or 'off'.\n");
        return 1;
    }
    return 0;
}
