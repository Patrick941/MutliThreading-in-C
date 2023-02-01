#include <stdio.h>
#include <string.h>
#include <pthread.h>
#include <stdlib.h>
#include <unistd.h>
#include <time.h>
#include <semaphore.h>

#define THREAD_NUM 1

typedef struct Task Task;
struct Task{
    void (*taskFunction)(void *);
    void * dataAddress;
    int testing;
};

typedef struct Queue Queue;
struct Queue{
    Task * task;
    Queue * prev;
    Queue * next;
};

Queue * head;
Queue * tail;

pthread_mutex_t queueMutex;
pthread_mutex_t incrementMutex;
pthread_cond_t taskStart;

void insertQueue(Task * newTask){
    Queue * newNode = (Queue *)malloc(sizeof(Queue));
    if (tail == NULL){
        tail = newNode;
        tail->task = newTask;
        tail->next = NULL;
        tail->prev = NULL;
        head = newNode;
        return;
    }
    Queue * temp = tail;
    tail = newNode;
    temp->next = newNode;
    newNode->prev = temp;
    newNode->next = NULL;
    newNode->task = newTask;
    //printf("%i is being stored at %p it has a next of %p and a prev of %p, head has an address of %p, task has an address of %p\n", newNode->task->testing, newNode, newNode->next, newNode->prev, head, newNode->task);
}

void printQueue(){
    Queue * ptr = head;
    while(ptr != NULL){
        //printf("Value is: %i at %p it has a next of %p and a prev of %p with a head of %p, task has an address %p\n", ptr->task->testing, ptr, ptr->next, ptr->prev, head, ptr->task);
        printf("Value is %i\n", ptr->task->testing);
        if(ptr->next != NULL){
            ptr = ptr->next;
        } else{
            break;
        }
    }    
}

Task * popQueue(){
    if(head == NULL){
        return NULL;
    }
    Task * outputTask = head->task;
    Queue * nextHead = head->next;
    free(head);
    head = nextHead;
    return outputTask;
}

int value = 0;
void incrementValue(void * arg){
    pthread_mutex_lock(&incrementMutex);
    value++;
    pthread_mutex_unlock(&incrementMutex);
}

void * routine(void * arg){
    while(1){
        int * indexPtr = (int*)arg;
        pthread_mutex_lock(&queueMutex);
        Task * nextTask = popQueue();
        pthread_mutex_unlock(&queueMutex);
        if(nextTask != NULL){
            printf("Task with ID: %i was execute by thread %i\n", nextTask->testing, *indexPtr);
            nextTask->taskFunction(arg);
            free(nextTask);
        }
        usleep(50000);
    }
    free(arg);
}

int main(){
    pthread_t threads[THREAD_NUM];
    for(int i = 0; i < THREAD_NUM; i++){
        int * index = (int*)malloc(sizeof(int));
        *index = i;
        pthread_create(&threads[i], NULL, &routine, index);
    }
    
    for(int i = 0; i < 100; i++) {
        Task * task = (Task*)malloc(sizeof(Task));
        task->taskFunction = &incrementValue;
        task->testing = i;
        insertQueue(task);
    }

    for(int i = 0; i < THREAD_NUM; i++){
        pthread_join(threads[i], NULL);
    }


    pthread_cond_destroy(&taskStart);
    pthread_mutex_destroy(&queueMutex);
    pthread_mutex_destroy(&incrementMutex);
}