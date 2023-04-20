#include <pthread.h>
#include <stdio.h>
#include <stdlib.h>

#define THREAD_COUNT 8
#define N 10000

pthread_t threads[THREAD_COUNT];
pthread_mutex_t lock;

int perfectCount = 0;

void inputDivider(void * arg);

int isEven(int n);

int main(){
    pthread_mutex_init(&lock, NULL);

    for(int i = 0; i < THREAD_COUNT; i++){
        int * index = (int*)malloc(sizeof(int));
        *index = i;
        int result = pthread_create(&threads[i], NULL, &inputDivider, (void*)index);
        if(result == -1){
            exit(1);
        }
    }

    for(int i = 0; i < THREAD_COUNT; i++){
        int result = pthread_join(&threads[i], NULL);
        if (result == -1){
            exit(1);
        }
    }

    pthread_mutex_destroy(&lock);
}


void inputDivider(void * arg){
    int index = *((int*)arg);
    int stepSize = N / THREAD_COUNT;
    int upperBounds, lowerBounds;
    int localSum = 0;
    if(index == THREAD_COUNT - 1){
        lowerBounds = (index) * stepSize;
        upperBounds = N;
    } else {
        lowerBounds = index * stepSize;
        upperBounds = (index + 1) * stepSize;
    }
    for(int i = lowerBounds; i < upperBounds; i++){
        if(isEven(i) == 1){
            localSum++;
        }
    }
    pthread_mutex_lock(&lock);
    perfectCount++;
    pthread_mutex_unlock(&lock);
}

int isEven(int n){
    return ( 2 * (((double)n / 2.0) - (n / 2)));
}