#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "../inc/pressure.h"


float read_pressure_from_log(char *filename)
{
    float pressure = 0.0 ;
    char line[256];
    
    FILE *file = fopen(filename, "r");
    
    if (file == NULL) {
        perror("Error opening file");
        exit(EXIT_FAILURE);
    }

    if (fgets(line, sizeof(line), file) != NULL)
    {
        char *pressure_str = strstr(line , "Pressure=");
        if (pressure_str != NULL)
        {
             sscanf(pressure_str, "Pressure=%f hPa", &pressure);
        }
        
        
    }
    fclose(file);
    return pressure ;

}

float pressure_hpa_to_pa(float hpa)
{
    return hpa * 100;
}

