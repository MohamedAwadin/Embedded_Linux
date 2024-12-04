#include <stdio.h>

int array_find_binary_search(int *arr, int size, int num) {
    int low = 0, high = size - 1, mid = 0;

    while (low <= high) {
        mid = (low + high) / 2;

        if (arr[mid] == num) {
            return mid; 
        } else if (num < arr[mid]) {
            high = mid - 1; 
        } else {
            low = mid + 1; 
        }
    }

    return -1; 
}

int main() {
    int arr[10] = {22, 27, 32, 54, 54, 55, 75, 99, 556, 666}; 
    int index = 0, element = 0;

    while (1) {
        printf("\nArray Elements (sorted):\n");
        for (int i = 0; i < 10; i++) {
            printf("Element [%d] = %d\n", i, arr[i]);
        }

        printf("Enter any element to search using Binary Search: ");
        scanf("%d", &element);

        index = array_find_binary_search(arr, 10, element);
        if (index == -1) {
            printf("Element %d not found in the array.\n", element);
        } else {
            printf("Element %d found at Index = %d\n", element, index);
        }
    }

    return 0;
}

