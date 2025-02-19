#include <stdio.h>
#include "sensor/inc/temp.h"
#include "sensor/inc/pressure.h"

int main() {
    // Read temperature from log file
    float temperature_kelvin = read_temp_from_log("logs/temperature.log");
    float temperature_celsius = temp_fahrenheit_to_celsius(temperature_kelvin);
    fopen("temp.txt" , "r");    // Read pressure from log file
    float pressure_hpa = read_pressure_from_log("logs/pressure.log");
    float pressure_pa = pressure_hpa_to_pa(pressure_hpa);

    
    printf("Temperature (Kelvin): %f K\n", temperature_kelvin);
    printf("Temperature (Celsius): %f C\n", temperature_celsius);
    printf("Pressure (hPa): %f hPa\n", pressure_hpa);
    printf("Pressure (Pa): %f Pa\n", pressure_pa);

    return 0;
}