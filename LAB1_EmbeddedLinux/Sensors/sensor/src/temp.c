
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "../inc/temp.h"


float read_temp_from_log(const char *filename)
{

    if (filename == NULL) {
        perror("Error opening file");
        exit(EXIT_FAILURE);
    }
    
    float temp = 0.0 ;
    char line[256];
    
    FILE *file = fopen(filename, "r");
    
    

    if (fgets(line, sizeof(line), file) != NULL)
    {
        char *temp_str = strstr(line , "Temperture=");
        if (temp_str != NULL)
        {
             sscanf(temp_str, "Temperture=%f K", &temp);
        }
        
        
    }
    fclose(file);
    return temp ;

}

float temp_fahrenheit_to_celsius(float temp)
{
    float temp_cel = ((temp -32 ) * (5 / 9));
    return temp_cel ;
}