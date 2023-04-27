#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <unistd.h>
#include <pthread.h>

#define RANGE 12
#define THREAD_NUM 8

pthread_t threads[THREAD_NUM];
pthread_mutex_t lock;

void * factorialSegment(void * arg);

int globalProduct = 1;

int main(){
    pthread_mutex_init(&lock, NULL);
    for(int i = 0 ; i < THREAD_NUM; i++){
        int * index = (int*)malloc(sizeof(int));
        *index = i;
        int result = pthread_create(&threads[i], NULL, &factorialSegment, (void*)index);
        if(result == -1){
            exit(1);
        }
    }
    for(int i = 0; i < THREAD_NUM; i++){
        int result = pthread_join(threads[i], NULL);
        if (result == -1){
            exit(1);
        }
    }
    printf("The factorial value for %i is %i\n", RANGE, globalProduct);
    pthread_mutex_destroy(&lock);
}

void * factorialSegment(void * arg){
    int index = *((int*)arg);
    const int stepSize = RANGE / THREAD_NUM;
    int upperBounds;
    if(index == THREAD_NUM -1){
        upperBounds = RANGE;
    } else {
        upperBounds = stepSize * (index + 1);
    }
    int lowerBounds = stepSize * index;
    int localProduct = 1;
    for(int i = lowerBounds; i <= upperBounds; i++){
        if(i == 0){
            continue;
        }
        localProduct = localProduct * i;
    }
    pthread_mutex_lock(&lock);
    globalProduct = globalProduct * localProduct;
    pthread_mutex_unlock(&lock);
}