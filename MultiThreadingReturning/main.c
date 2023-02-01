#include <stdlib.h>
#include <stdio.h>
#include <pthread.h>
#include <unistd.h>

int value = 0;
pthread_mutex_t lock;
void * increment();

int main(int argc, char* argv[]){
    const int threadAmount = 4;
    pthread_t threads[threadAmount];
    for(int i = 0; i < threadAmount; i++){
        pthread_create(&threads[i], NULL, &increment, NULL);
    }
    for(int i = 0; i < threadAmount; i++){
        int * ptr = NULL;
        pthread_join(threads[i], (void**) &ptr);
        if (ptr != NULL){
            int returnedVal = *ptr;
            printf("Program teminated with value equals %i \n", returnedVal);
            free(ptr);
        } else {
            printf("Pointer is NULL\n");
        }
    }
    return 0;
}

void * increment(){
    printf("Beggining increment\n");
    pthread_mutex_lock(&lock);
    for(int i = 0; i < 10000000; i++){
        value++;
    }
    int * output = malloc(sizeof(int));
    *output = value;
    pthread_mutex_unlock(&lock);
    //printf("Address of pointer: %p \nValue at pointer: %i\n", output, *output);
    return output;
}