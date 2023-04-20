// Trapezoid 
#include <pthread.h>
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

#define THREAD_NUM 100

pthread_t threads[THREAD_NUM];

pthread_mutex_t lock;

int stepSize, sum;

void * tempFunc(void * arg);
double trapezoid(double a, double h);

int main(){

    pthread_mutex_init(&lock, NULL);

    stepSize = 10 / 100;

    for(int i = 0; i < 100; i++){
        int * startIndex = (int*)malloc(sizeof(int));
        *startIndex = i;
        int result = pthread_create(&threads[i], NULL, &tempFunc, (void*)startIndex);
        if(result == -1){
            exit(1);
        }
    }

    for(int i = 0; i < 100; i++){
        int result = pthread_join(threads[i], NULL);
        if(result == -1){
            exit(1);
        }
    }

    pthread_mutex_destroy(&lock);
}

double trapezoid(double a, double h){
    return h*(f(a)+f(a+h))/2.0;
}

void * tempFunc(void * arg){
    int index = *(int*)arg;
    int a = index * stepSize;
    int result = trapezoid(a, stepSize);
    pthread_mutex_lock(&lock);
    sum += result;
    pthread_mutex_unlock(&lock);
    free(arg);
}