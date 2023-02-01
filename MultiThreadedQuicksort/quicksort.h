#ifndef QUICKSORT_H_
#define QUICKSORT_H_
void selectionSort(int arr[], int size);
void insertionSort(int arr[], int size);
void quickSort(int arr[], int size);

typedef struct Arguments Arguments;
struct Arguments{
    long unsigned int ID;
    int lowerBounds;
    int upperBounds;
};

extern int number_comparisons;
extern int number_swaps;


#endif