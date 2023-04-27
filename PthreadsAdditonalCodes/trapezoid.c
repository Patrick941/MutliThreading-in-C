// Trapezoid 
#include <pthread.h>
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

#define THREAD_NUM 100
#define RANGE 10

pthread_t threads[THREAD_NUM];

pthread_mutex_t lock;

double stepSize, sum;

void * tempFunc(void * arg);
double trapezoid(double a, double h);
double f(double x);

int main(){

    pthread_mutex_init(&lock, NULL);

    stepSize = (double)RANGE / (double)THREAD_NUM;

    for(int i = 0; i < THREAD_NUM; i++){
        int * startIndex = (int*)malloc(sizeof(int));
        *startIndex = i;
        int result = pthread_create(&threads[i], NULL, &tempFunc, (void*)startIndex);
        if(result == -1){
            exit(1);
        }
    }

    for(int i = 0; i < THREAD_NUM; i++){
        int result = pthread_join(threads[i], NULL);
        if(result == -1){
            exit(1);
        }
    }

    printf("Area is: %lf\n", sum);

    pthread_mutex_destroy(&lock);
}

double trapezoid(double a, double h) {
    return h*(f(a)+f(a+h))/2.0;
}

double f(double x) {
    return (16.0 - (x*x));
}

void * tempFunc(void * arg){
    int index = *(int*)arg;
    double a = (double)index * stepSize;
    double result = trapezoid(a, stepSize);
    printf("Result is %lf, a was %lf, stepSize was %lf, index was %i\n", result, a, stepSize, index);
    pthread_mutex_lock(&lock);
    sum += abs(result);
    pthread_mutex_unlock(&lock);
    free(arg);
}
