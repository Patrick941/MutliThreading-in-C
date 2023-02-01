#include <stdio.h>
#include <string.h>
#include <pthread.h>
#include <stdlib.h>
#include <unistd.h>
#include <time.h>
#include <semaphore.h>
#include "quicksort.c"
#include "arrays.h"

int value = 0;
void incrementValue(void * arg){
    pthread_mutex_lock(&incrementMutex);
    value++;
    pthread_mutex_unlock(&incrementMutex);
}

void * routine(void * arg){
    
}

int *arrayPtr = NULL;

int main(){
    pthread_t threads[THREAD_NUM];
    for(int i = 0; i < THREAD_NUM; i++){
        int * index = (int*)malloc(sizeof(int));
        *index = i;
        pthread_create(&threads[i], NULL, &routine, index);
    }  

    for(int i = 0; i < THREAD_NUM; i++){
        pthread_join(threads[i], NULL);
    }
}