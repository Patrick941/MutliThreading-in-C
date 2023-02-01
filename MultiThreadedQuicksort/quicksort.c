#include"arrays.h"
#include"quicksort.h"
#include <pthread.h>

pthread_mutex_t queueMutex;
pthread_mutex_t incrementMutex;
pthread_cond_t taskStart;

typedef struct Task Task;
struct Task{
    void * (*taskFunction)(void *);
    void * dataAddress;
    int testing;
};

typedef struct Queue Queue;
struct Queue{
    Task * task;
    Queue * prev;
    Queue * next;
};

Queue * head;
Queue * tail;

#define THREAD_NUM 2

int ArrayCapacity = 50, finished = 0;

Arguments argArray[THREAD_NUM];
pthread_mutex_t boundsMutex;

void Swap(int *Value1, int *Value2);
void Partition(int arr[], int LowerIndex, int UpperIndex);
void quickSort(int arr[], int size);
void printMallocedArray(int * array[], int size);
void * mallocedQuickSort(void * dataAddress);

//A function to implement selection sort without counting swaps and comparisons
void selectionSort(int arr[], int size){
    //Initialise the variable that will be used to remember the lower Number each time the loop goes through the Array
    int LocalMinValue, LocalMinIndex; 
    for(int i = 0; i < size; i++){
        LocalMinIndex = i;     
        LocalMinValue = arr[i];   
        //The next loop which goes through the array starts at i becuase everything that is before i should already be sorted
        for(int j = i; j < size; j++){
            //If the data at the current index is lower than the current local min value set the local min index to j and update the value of localminvalue to the value at this index
            if (arr[j] < LocalMinValue){
                LocalMinIndex = j;
                LocalMinValue = arr[j];
            }
        }
        //This is swapping the positions of the data at index i and the data which has the lowest value
        arr[LocalMinIndex] = arr[i];
        arr[i] = LocalMinValue;
    }
    finished = 1;
}

void insertQueue(Task * newTask){
    printf("inserting task\n");
    Queue * newNode = (Queue *)malloc(sizeof(Queue));
    if (tail == NULL){
        newNode->task = newTask;
        newNode->next = NULL;
        newNode->prev = NULL;
        tail = newNode;
        head = newNode;
        return;
    }
    Queue * temp = tail;
    tail = newNode;
    temp->next = newNode;
    newNode->prev = temp;
    newNode->next = NULL;
    newNode->task = newTask;
    //printf("%i is being stored at %p it has a next of %p and a prev of %p, head has an address of %p, task has an address of %p\n", newNode->task->testing, newNode, newNode->next, newNode->prev, head, newNode->task);
}

void printQueue(){
    Queue * ptr = head;
    while(ptr != NULL){
        //printf("Value is: %i at %p it has a next of %p and a prev of %p with a head of %p, task has an address %p\n", ptr->task->testing, ptr, ptr->next, ptr->prev, head, ptr->task);
        printf("Value is %i\n", ptr->task->testing);
        ptr = ptr->next;
    }
}

void reversePrintQueue(){
    Queue * ptr = tail;
    while(ptr != NULL){
        printf("Value is %i\n", ptr->task->testing);
        ptr = ptr->prev;
    }
}

Task * popQueue(){
    //printf("popping from que\n");
    if(head == NULL){
        return NULL;
    }
    if(head == tail){
        Task * outputTask = head->task;
        free(head);
        head = NULL;
        tail = NULL;
        return outputTask;
    }
    Task * outputTask = head->task;
    Queue * nextHead = head->next;
    free(head);
    head = nextHead;
    return outputTask;
}

//A function to implement insertion sort without counting swaps and comparisons
void insertionSort(int arr[], int size){
    //Start at first element, check that everything to the left of it is higher than it, this is always true
    //for the rest of the elements scroll through the array until a number to the left is lower than it, then place the element to the right of this number that is lower than it
    for (int i = 0; i < size; i++){
        int PointFound = 0;
        for(int j = i; j >  0 && PointFound == 0; j--){
            //Test if j >0 as if j is not greater than 0, than there is no number to the left of  it and it should be inserted at index 0
            //Test whether the number at index j is less than the number at index i, if it is, leaving the loop, else swap the values
            if(arr[j - 1] < arr[j]){
                PointFound = 1;
            }
            else {
                int temp = arr[j];
                arr[j] = arr[j - 1];
                arr[j - 1] = temp;
            }
        }
    }
}

//A function to implement quick sort without counting swaps and comparisons
void quickSort(int arr[], int size){
    Partition(arr, 0, ArrayCapacity - 1);
}

void Partition(int arr[], int LowerIndex, int UpperIndex){
    int i, j, pivot;
    if(LowerIndex < UpperIndex){
      pivot = LowerIndex;
      i = LowerIndex;
      j = UpperIndex;

        while(i<j){
            while(arr[i] <= arr[pivot] && i < UpperIndex){
                i++;
            }
            while(arr[j] > arr[pivot])
                j--;
            if(i<j){
                Swap(&arr[i], &arr[j] );
            }
        }
        Swap(&arr[pivot], &arr[j]);
        Partition(arr ,LowerIndex ,j-1);
        Partition(arr,j+1,UpperIndex);
   }
}

const int intSize = 8;
void * address;
void * mallocedQuickSort(void * dataAddress){
    int * ptr = (int*)dataAddress;
    int k, j, pivot, thread;
    for(int i = 0; i < THREAD_NUM; i++){
        if(pthread_self() == argArray[i].ID){
            printf("Thread %i is in use\n", i);
            thread = i;
        }
        else{
            //printf("Thread is not %li\n",argArray[i].ID);
        }
    }
    //int * array[ArrayCapacity + 2];
    int ** temp = address;

    int UpperIndex = *(ptr + sizeof(int));
    int LowerIndex = *(ptr);
    if(LowerIndex < UpperIndex){
      pivot = LowerIndex;
      k = LowerIndex;
      j = UpperIndex;

        while(k < j){
            while(*(*temp + (k * intSize) + intSize) <= *(*temp + (pivot * intSize) + intSize) && k < UpperIndex){
                k++;
            }
            while(*(*temp + (j * intSize) + intSize) > *(*temp + (pivot * intSize) + intSize))
                j--;
            if(k < j){
                Swap((*temp + (k * intSize) + intSize), (*temp + (j * intSize) + intSize));
            }
        }
        Swap((*temp + (pivot * intSize) + intSize), (*temp + (j * intSize) + intSize));
        Task * lowerTask = (Task*)malloc(sizeof(Task));
        int * lowerBounds = (int*)malloc(sizeof(int) * 2);
        *lowerBounds = LowerIndex;
        *(lowerBounds + sizeof(int)) = j - 1;
        lowerTask->dataAddress = lowerBounds;
        lowerTask->taskFunction = &mallocedQuickSort;
        insertQueue(lowerTask);

        Task * upperTask = (Task*)malloc(sizeof(Task));
        int * upperBounds = (int*)malloc(sizeof(int) * 2);
        *upperBounds = j + 1;
        *(upperBounds + sizeof(int)) = UpperIndex;
        upperTask->dataAddress = upperBounds;
        upperTask->taskFunction = &mallocedQuickSort;
        insertQueue(upperTask);
        //Partition(dataAddress , LowerIndex ,j-1);
        //Partition(dataAddress , j+1 ,UpperIndex);
   }
    
    //printf("current thread is %li \n", pthread_self());
    //printMallocedArray(address, ArrayCapacity); 
    free(dataAddress);
    
    return NULL;
}

//A function to swap the values that the pointer arguments are pointing too
void Swap(int *Value1, int *Value2){
    int Temp = *Value1;
    *Value1 = *Value2;
    *Value2 = Temp;
    return;
}

void printMallocedArray(int * array[], int size){
    for(int i = 0; i < size; i++){
        printf("%i\n", *array[i]);
    }
}