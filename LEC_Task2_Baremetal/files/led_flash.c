#include <stdint.h>

// Base address for GPIO peripheral (BCM2837)
#define GPIO_BASE 0x3F200000

// GPIO register offsets
#define GPFSEL2   (GPIO_BASE + 0x08)  // GPIO Function Select 2 (controls GPIO 20-29)
#define GPSET0    (GPIO_BASE + 0x1C)  // GPIO Pin Output Set 0 (controls GPIO 0-31)
#define GPCLR0    (GPIO_BASE + 0x28)  // GPIO Pin Output Clear 0 (controls GPIO 0-31)

// Main function
void main() {
    // Configure GPIO23 as output
    volatile uint32_t* gpfsel2 = (uint32_t*)GPFSEL2;
    *gpfsel2 &= ~(7 << 9);  // Clear bits 9-11 (GPIO23)
    *gpfsel2 |= (1 << 9);   // Set GPIO23 as output (001 in bits 9-11)

    // Turn on the LED (set GPIO23 high)
    volatile uint32_t* gpset0 = (uint32_t*)GPSET0;
    *gpset0 = (1 << 23);  // Set GPIO23 high

    // Infinite loop to prevent returning
    while (1) {
    }
}