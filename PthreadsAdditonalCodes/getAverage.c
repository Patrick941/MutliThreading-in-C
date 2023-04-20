#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>

#define SAMPLES 600000
#define THREAD_NUM  6

pthread_mutex_t lock;
pthread_t threads[THREAD_NUM];

double average = 0;
double inputData[SAMPLES];

void * getAverageSegment(void * arg);

void getInputData();

int main(){

    pthread_mutex_init(&lock, NULL);
    getInputData();

    for(int i = 0; i < THREAD_NUM; i++){
        int * index = (int*)malloc(sizeof(int));
        *index = i;
        int result = pthread_create(&threads[i], NULL, &getAverageSegment, (void*)index);
        if (result == -1){
            exit(1);
        }
    }

    for(int i = 0; i < THREAD_NUM; i++){
        int result = pthread_join(threads[i], NULL);
        if (result == -1){
            exit(1);
        }
    }

    printf("The final output for average is %f", average);

    pthread_mutex_destroy(&lock);
}

void getInputData(){
    for(int i = 0; i < SAMPLES; i++){
        inputData[i] = i;
    }
}

void * getAverageSegment(void * arg){
    int index = *((int*)arg);
    double localSum = 0;
    //printf("This thread has index %i\n", index);
    //printf("This thread has lowerBound %i\n", (index * (SAMPLES/THREAD_NUM)));
    //printf("This thread has upperBounds %i\n", ((index + 1) * (SAMPLES/THREAD_NUM)));
    for(int i = (index * (SAMPLES/THREAD_NUM)); i < ((index + 1) * (SAMPLES/THREAD_NUM)); i++){
        localSum += inputData[i];
    }
    free(arg);
    localSum = localSum / (SAMPLES/THREAD_NUM);
    double weightedAverage = localSum / THREAD_NUM;
    pthread_mutex_lock(&lock);
    average += weightedAverage;
    pthread_mutex_unlock(&lock);
}