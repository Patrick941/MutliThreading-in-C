//A function that will make threads wait at a barrier until there is a certain amount of threads at the
//barrier. It is used with a pthread_barrier_t variable which is started with the pthread_barrier_init(
//&barrier, NULL, 3); A thread can be made wait at the barrier using pthread_barrier_wait(&variable);

#include <stdlib.h>
#include <stdio.h>
#include <pthread.h>
#include <unistd.h>

int value = 0;
int threadCount = 4;
pthread_mutex_t lock;
pthread_barrier_t barrierVar;
void simpleIncrement(int * val);
void * increment();

int main(int argc, char* argv[]){
    const int threadAmount = threadCount;
    pthread_t threads[threadAmount];
    pthread_barrier_init(&barrierVar, NULL, threadCount);
    for(int i = 0; i < threadAmount; i++){
        pthread_create(&threads[i], NULL, &increment, NULL);
    }
    for(int i = 0; i < threadAmount; i++){
        pthread_join(threads[i], NULL);
    }
    return 0;
    pthread_mutex_destroy(&lock);
    pthread_barrier_destroy(&barrierVar);
}

void * increment(){
    pthread_mutex_lock(&lock);
    for(int i = 0; i < 10000000; i++){
        simpleIncrement(&value);
    }
    sleep(1);
    printf("Program teminated with value equals %i \n", value);
    pthread_mutex_unlock(&lock);
    pthread_barrier_wait(&barrierVar);
    printf("thread terminated\n");
}

void simpleIncrement(int * val){
    *val += 1;
}