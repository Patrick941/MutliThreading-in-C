#include <stdlib.h>
#include <stdio.h>
#include <pthread.h>
#include <unistd.h>

int value = 0;
pthread_mutex_t lock;
void simpleIncrement(int * val);
void * increment();

int main(int argc, char* argv[]){
    const int threadAmount = 16;
    pthread_t threads[threadAmount];
    for(int i = 0; i < threadAmount; i++){
        pthread_create(&threads[i], NULL, &increment, NULL);
    }
    for(int i = 0; i < threadAmount; i++){
        pthread_join(threads[i], NULL);
    }
    return 0;
}

void * increment(){
    printf("Beggining increment\n");
    pthread_mutex_lock(&lock);
    for(int i = 0; i < 10000000; i++){
        simpleIncrement(&value);
    }
    pthread_mutex_unlock(&lock);
    printf("Program teminated with value equals %i \n", value);
}

void simpleIncrement(int * val){
    *val += 1;
}