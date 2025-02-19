/*
#include<stdio.h>
#include <unistd.h>
#include <string.h>
int main(){
    write(STDOUT_FILENO, "Hello World\n", strlen("Hello World"));
    

    return 0;
}
*/

#include <unistd.h>
#include <stdarg.h>

/* implement as a variadic Function (...: indicates a variable number of arguments.)
/* char *format > a string that contains text and format specifier(to replaced by arguments when the user use this function) 
 */
void awadin_printf(const char *format, ...) {
    

    // Declaring pointer to the argument list
    va_list args_ptr;

    // Initializing argument to the list pointer
    va_start(args_ptr, format);

    
    //array of character  Decleration with size 1024 byte, to store final output  
    char buffer[1024];

    
    char *str_arg;
    int int_arg;
    double float_arg;
    
    
    
    unsigned int i = 0 , len = 0 ;

    // Loop through the format input string until null character is reached 
    for (; format[i] != '\0'; i++) {
        
        // check if the current char is '%' format specifier && check if it's not the last character (will be a regular char)
        if (format[i] == '%' && format[i + 1] != '\0') {
            i++; // to skip '%' format specifier
            switch (format[i]) {
                case 'd': // integer 
                    // accessing args_ptr and Fetching the next argument  list of type int
                    int_arg = va_arg(args_ptr, int);
                    // convert integer value returned from va_args into string, and store it at position "len" 
                    // snprintf() returns the number of characters written (excluding '/n')
                    len = len + snprintf(buffer + len, sizeof(buffer) - len, "%d", int_arg);
                    break;
                case 'f': // float 
                    
                    float_arg = va_arg(args_ptr, double);
                    
                    len = len + snprintf(buffer + len, sizeof(buffer) - len, "%f", float_arg);
                    break;
                case 's': // string
                    // accessing args_ptr and Fetching the next argument list of type string 
                    str_arg = va_arg(args_ptr, char *);
                    len = len +  snprintf(buffer + len, sizeof(buffer) - len, "%s", str_arg);
                    break;
                case 'c': // character
                    buffer[len++] = (char)va_arg(args_ptr, int);
                    break;
                default: //incorrect specifier 
                    buffer[len++] = '%';
                    buffer[len++] = format[i];
                    break;
            }
        } 
        //regular character 
        else 
        {
            buffer[len++] = format[i];
        }
    }

    va_end(args_ptr);

    // write the formatted string to the standard output
    write(0, buffer, len);
}

int main() {
    awadin_printf("Hello, I am %s, %d years old, my length %f, and i test my printf  function.\n", "Awadin", 23, 185.5);
    for (int i = 0; i < 10; i++)
    {
        awadin_printf("%d\t", i);
    }
    awadin_printf("\n");
    
    return 0;
}
