#include <stdio.h>
#include <string.h>
#include <pthread.h>
#include <stdlib.h>
#include <unistd.h>
#include <time.h>
#include <semaphore.h>
#include "quicksort.c"

Queue * head;
Queue * tail;

pthread_mutex_t queueMutex;
pthread_mutex_t incrementMutex;
pthread_cond_t taskStart;

int value = 0;
void incrementValue(void * arg){
    pthread_mutex_lock(&incrementMutex);
    value++;
    pthread_mutex_unlock(&incrementMutex);
}

void * routine(void * arg){
    while(1){
        int * indexPtr = (int*)arg;
        pthread_mutex_lock(&queueMutex);
        Task * nextTask = popQueue();
        pthread_mutex_unlock(&queueMutex);
        if(nextTask != NULL){
            printf("Task with ID: %i was execute by thread %i\n", nextTask->testing, *indexPtr);
            nextTask->taskFunction(arg);
            free(nextTask);
        }
        usleep(50000);
    }
    free(arg);
}

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


    pthread_cond_destroy(&taskStart);
    pthread_mutex_destroy(&queueMutex);
    pthread_mutex_destroy(&incrementMutex);
}