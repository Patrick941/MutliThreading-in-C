/*Declared using sem_t, initialised using sem_init(&variable, 0, i), 0 for multithread, 1 for multi-process.
Destroy using sem_destroy(&variable). sem_wait(&variable) acts similar to mutex lock while sem_post(&variable)
acts similar to mutex unlock. It will work through the threads in order the same as mutex but as appose to
mutex instead of 1 thread working at a time, the value for i is the amount of threadas operating simultaneously
Can be used for login queues.
Two semaphores can be used together to handle the adding and removing from a buffer, where the wait and post are
used alternating in each function, func 1: wait sem1, post sem2, fun2: wait sem2, post sem1
A sem wait can be used in a thread with init of 0 to make this thread wait for the others to get to the point of 
post*/

#include <stdlib.h>
#include <stdio.h>
#include <pthread.h>
#include <unistd.h>
#include <semaphore.h>

int value = 0;
int threadCount = 8;
sem_t semVar;
void * increment(void * arg);

int main(int argc, char* argv[]){
    const int threadAmount = threadCount;
    pthread_t threads[threadAmount];
    sem_init(&semVar, 0, 2);
    for(int i = 0; i < threadAmount; i++){
        int * index = malloc(sizeof(int));
        *index = i;
        pthread_create(&threads[i], NULL, &increment, index);
    }
    for(int i = 0; i < threadAmount; i++){
        pthread_join(threads[i], NULL);
    }
    return 0;
    sem_destroy(&semVar);
}

void * increment(void * arg){
    int * indexPtr = (int*)arg;
    int index = *indexPtr;
    sem_wait(&semVar);
    printf("%i has logged on\n", index + 1);
    sleep((rand() % 5) + 1);
    printf("%i has logged off\n", index + 1);
    sem_post(&semVar);
    free(arg);
}

