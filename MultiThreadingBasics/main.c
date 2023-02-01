#include <stdlib.h>
#include <stdio.h>
#include <pthread.h>
#include <unistd.h>

int value = 0;
pthread_mutex_t lock;

void * increment(){
    printf("Beggining increment\n");
    pthread_mutex_lock(&lock);
    for(int i = 0; i < 1000000; i++){
        value++;
    }
    pthread_mutex_unlock(&lock);
    printf("Program teminated with value equals %i \n", value);
}

int main(int argc, char* argv[]){
    pthread_t thread1;
    pthread_t thread2;
    pthread_create(&thread1, NULL, &increment, NULL);
    pthread_create(&thread2, NULL, &increment, NULL);
    pthread_join(thread1, NULL);
    pthread_join(thread2, NULL);
    return 0;
}