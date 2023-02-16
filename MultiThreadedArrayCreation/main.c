#include <stdio.h>
#include <string.h>
#include <pthread.h>
#include <stdlib.h>
#include <unistd.h>
#include <time.h>
#include <semaphore.h>
#include <math.h>

#define THREAD_NUM 2

void * routine(void * arg){
    int * ptr = (int*)arg;
    printf("The amount to print from this thread is %i\n", *ptr);
  
}

int main(){
    const float ArrayCapacity = 15;
    pthread_t threads[THREAD_NUM];
    for(int i = 0; i < THREAD_NUM; i++){
        int * size = (int*)malloc(sizeof(int));
        *size = ceilf(ArrayCapacity / THREAD_NUM);
        pthread_create(&threads[i], NULL, &routine, size);
    }

    for(int i = 0; i < THREAD_NUM; i++){
        pthread_join(threads[i], NULL);
    }
}