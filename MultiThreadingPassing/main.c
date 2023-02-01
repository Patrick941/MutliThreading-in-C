#include <stdlib.h>
#include <stdio.h>
#include <pthread.h>
#include <unistd.h>

int value = 0;
pthread_mutex_t lock;
void * increment(void * argv);

int main(int argc, char* argv[]){
    const int threadAmount = 4;
    pthread_t threads[threadAmount];
    for(int i = 0; i < threadAmount; i++){
        int * ptr = malloc(sizeof(int));
        *ptr = i;
        pthread_create(&threads[i], NULL, &increment, ptr);
    }
    for(int i = 0; i < threadAmount; i++){
        pthread_join(threads[i], NULL);
    }
    return 0;
}

void * increment(void * argv){
    int thread = *(int*)argv;
    free(argv);
    printf("Beggining increment\n");
    pthread_mutex_lock(&lock);
    for(int i = 0; i < 10000000; i++){
        value++;
    }
    pthread_mutex_unlock(&lock);
    printf("Value at thread %i is %i\n", thread, value);
    return 0;
}