# Exam Questions
## Question 1
### a: Explain the differences between user-level threads and kernel-level threads. What are the advantages and disadvantages of each? [4 marks]
A kernal-level is a thread that is operating at a kernel level, it has its own scope and is a much more heavyweight solution. User-Level threads are threads that operate inside a program, they are much more lightweight and are run from libraries, an example of this is pthreads.
### b: Describe the operation of the following pthread library functions: pthread_create, pthread_exit, and pthread_mutex_init. [6 marks]
pthread_create is the operation of creating a thread, the first argument is the address of the thread, the secon dargument is the the address of the desired attribute object which is often left null, the third argument is the address of the function that the thread shouls begin executing when created and the fourth and final argument is a pointer to a piece of memory on the heap which can be retrieved by the thread once executing the function passed.
pthread_exit can be called from a thread in the middle of execution to stop exection of the said thread, it may be called when an area of the code that should never be entered is entered.
pthread_mutex_init is called to initialise a mutex, this will make sure that there is memory allocated to the mutex and will intialise the mutex to its correct intial state. When this function is called there must be a corresponding mutex_destroy to avoid a memory leak. Technically a program can be written with a mutex without this function and will almost definetly funciton correctly but it is bad practice to exclude it.
### c: Write a C pthreads program that calculates the factorial of a given number N using multiple threads. Each thread calculates the product of a portion of the range from 1 to N. [8 marks]
```c
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <unistd.h>
#include <pthread.h>

#define RANGE 12
#define THREAD_NUM 8

pthread_t threads[THREAD_NUM];
pthread_mutex_t lock;

void * factorialSegment(void * arg);

int globalProduct = 1;

int main(){
    pthread_mutex_init(&lock, NULL);
    for(int i = 0 ; i < THREAD_NUM; i++){
        int * index = (int*)malloc(sizeof(int));
        *index = i;
        int result = pthread_create(&threads[i], NULL, &factorialSegment, (void*)index);
        if(result == -1){
            exit(1);
        }
    }
    for(int i = 0; i < THREAD_NUM; i++){
        int result = pthread_join(threads[i], NULL);
        if (result == -1){
            exit(1);
        }
    }
    printf("The factorial value for %i is %i\n", RANGE, globalProduct);
    pthread_mutex_destroy(&lock);
}

void * factorialSegment(void * arg){
    int index = *((int*)arg);
    const int stepSize = RANGE / THREAD_NUM;
    int upperBounds;
    if(index == THREAD_NUM -1){
        upperBounds = RANGE;
    } else {
        upperBounds = stepSize * (index + 1);
    }
    int lowerBounds = stepSize * index;
    int localProduct = 1;
    for(int i = lowerBounds; i <= upperBounds; i++){
        if(i == 0){
            continue;
        }
        localProduct = localProduct * i;
    }
    pthread_mutex_lock(&lock);
    globalProduct = globalProduct * localProduct;
    pthread_mutex_unlock(&lock);
}
```
### d: Consider a scenario where two threads are running concurrently, and they both access a shared global variable called "counter". Describe a possible race condition that could occur and suggest a way to prevent it. [4 marks]
It is possible that after accessing this global variables both of these variables then write this value to a local value, then if they alter this local value and write back to the global value the thread that writes its value will override the thread that writes its value first. While it is technically possible that this is intentional, in any well design system this is not the intention and this is what is called a race condition. 
## Question 2
### a: Explain the concept of model checking and its importance in verifying concurrent systems. [4 marks]
When writing a concurrent program in C we first decide how we are going to approach the problem which can often be given in pseudo code. This higher level view of our plan for the program is our model.
If we were to implement this model straight into C code it is likely that we will run into errors, unfortunately we do not know whether our errors lies in our model or our implemtation of our model. This will now be very difficult to troubleshoot and in addition to this the time spent to write the code was a waste.
Another issue that can occur with concurrent programs is the issue of an issue not always being apparent. Very often deadlocks in code will not occur on many iterations of the code, this means that the code might make it past the testing phase with a major bug in it because the model was created incorrectly, this is now a much more expensive issue to resolve.
Both of these above outlined issues can be resolved using a model checker. A model checker can easily be given the model which you have created, then it will explore every possible path in the model and try to 'break' it. If the model returns no errors in the model checker we can be sure that our model is correct.
### b: Define the terms deadlock, livelock, and starvation in the context of concurrent systems. Provide an example for each. [6 marks]
A deadlock is the scenario where two threads are waiting for one another. While both of these threads are waiting for eachother they are not doing anything, just waiitng. Lets show an example where this may occur. Say we have 2 threads, thead 1 and thread 2. Thread 1 begins operation and performs some calculations, now for the next step of its calculations it needs thread 2 to update a shared variable. So it will wait, it will only stop waiting when it is signalled or broadcasted, now lets say at the time that thread 1 has begun waiting, thread 2 has just passed the signal, and now thread 2 calls wait also. In this circumstance both threads have called the wait function and neither will ever be able to signal the other.
A livelock is a somewhat similar scenario where there is no progress being made, however, it differs as the threads are actively waiting. They are still performing operations, there is just no progress being made. This could occur in the following circumstance. Say we have 2 threads, thread 1 and thread 2. They are both in a while loop and share a global variable, thread 1 will only exit the loop when the shared variable is 1, thread 2 will only exit the loop when the shared variable is 2. Now this is the example order of operation, thread 1 are 2 are both executing. Thread 1 will set the shared variable to 1 to satisfy its exit condition, now the thread may wait, while thread 1 is waiting thread 2 continues operation, it sets the shared variable to be 2 to satisfy its exit condition, now it will signal thread 1 and wait. Thread 1 now reachces the end of the loop with the condition not meat so it begins the loop again. It sets the shared variable to be 1, it signals thread 2 and it waits. It is clear to see how this loop will continue forever but instructions are still being executed.
Starvation is the circumstance where one or multiple threads is receiving either very little or no time to exectute. This may occur as follows, say we have 3 threads operating. They are all in an infinite loop, in their loop they will read from stdin and then print what they read to stdout. They cannot have other threads intefferring with what they read in so they will lock a mutex whenever interacting with the stdin or stdin. Say thread 1 always has a short message to read and print, message 2 has the same but message 3 has a huge quantity of data to read and print. Lets begin our example wil thread 3 locking to mutex to read its data, it then prints it data, this all takes a huge amount of time, it eventually unlocks the mutex, this mutex is now accessed by thread 1, in the time it takes for thread 1 to execute thread 3 is back waiting for a mutex again. Now thread 3 may get to lock the mutex before thread 2 and the process begins again. If we say that this model continues forever, thread 3 would be starving both thread 1 and 2. Thread 1 is receiving very little time to communicate its signal while thread 2 is receiving no time at all.
### c: Describe the difference between safety and liveness properties in concurrent systems. Provide an example of each. [4 marks]
Safety properties outline what should never happen in a system, they can be created using the never statements inside promela. A common example of this is never(mutex.val >= 2), this combined with a mutex lock instruction of mutex.val = mutex.val + 1; can ensure that there is never more than one process operating in the critical section of the corresponding mutex.
A liveness property is a method of ensuring that progress is being made in a system, an example would be an assertion that a program will eventually reach a certain state. Progress labels can be useful to track progres of a program in conjuction with the assertion. An example of an assertion to ensure progress can be set up as follows. Inside all areas where a loop can occur create a counter to count the amount of times that loop executes. We can then add an assertion as follows. assert(loopCounter < 100000000). Depending on the program the limit for the loop can be set to something sensible.
### d: Write a Promela model for a simple concurrent system with three processes that use semaphores for synchronization. Explain how the model ensures mutual exclusion. [6 marks]
Not going to be on exam
## Question 3
### a: Describe the role of a memory management unit (MMU) in a virtual memory system. [4 marks]
It is the role of a memory management unit to convert the virtual addresses used by programs and convert them into logical and performant physical addresses. The memory management unit used a page table which maps virtual addresses to physical addresses.
The memory management unit also has a memory protection function which works by setting access permissions for each page of memory.
In more advanced types of memory such as ECC memory, the MMU also has to be able to handle errors in the storage and retrieval.
### b: Explain the concept of paging in virtual memory systems and how it helps in efficient memory management. [4 marks]
This is the proccess of translating the virtual addresses used by programs into a physical address using a page table. This page table manages a cluster of memory at a time. If a page table is requested but it is not available it will have to be called in from memory. This ability to send pages to and from memory means memory can be managed more efficiently.
### c: Consider a virtual memory system with the following parameters:
- Page size: 4096 bytes
- Virtual address space: 32 bits
- Physical address space: 28 bits

Calculate the number of entries in the page table and the size of each entry. [4 marks]

### d: Explain the concepts of demand paging and page replacement algorithms in the context of virtual memory systems. Provide an example of a widely-used page replacement algorithm and describe how it works. [6 marks]
Demand paging is the process of only loading pages into memory when they are specifically requested by a program. This allows memory to be used more efficiently.
Page replacement is the process of removed a previously loaded page with another new page. This means the new required data can be loaded without having the use any additional space in memory, this ofcourse requires that the previous page is not required or it will have to be loaded again. An example of this is in UNIX OS can be given when using nautilus. If a folder is opened, the new page required to be loaded could replace the page for all of the directories that were not selected as they are no longer needed. In a modern system this operation would only occur if the systems memory is at a very high utilisation as having the load the page back from the HDD or SDD if that directory is returned to will be the very same as the first time.
## Question 4
### a: Explain the role of a file system in an operating system and describe the basic operations performed by a file system. [4 marks]
The function of a file system is a method of storing data that is intuitive to the user. This acts as an abstraction layer between the user/ user applications and the physical storage devices. A file system also provides the ability permissions to users. 
### b: Describe the concepts of "File Allocation Table (FAT)" and "Inode" in the context of file systems. Explain the differences between them. [6 marks]
An Inode, short for index node contains the meta information pertaining to a file, it contains the name, size, created data and other properties such as that. This is useful as all the information about a file can be obtained from one location. It also contains informatin about the data blocks that make up the file which the inode is providing details for.
A File allocation table is the table used in some older file formats such as FAT32. It contains the information about the location of which clusters are allocated to which files. These sorts of file formats are rarely used in operating systems today but are useful for some external storage devices due to its cross platform capabilities.
### c: Explain the concept of process scheduling in operating systems. Describe the differences between preemptive and non-preemptive scheduling. [4 marks]
Process scheduling in operating systems is the job of allocating time to different processes running on a system, time must be given to each process so that no process is left not active. 
Pre-emptive scheduling is a scheduling method that allows the scheduler to interrupt a process in the middle of execution and take its resources and allocate them elsewhere, this can cause potential issues with reliability of code but is less likely the result in starvation of smaller processes.
non-pre-emptive scheduling is a scheduling method that does not allow the scheduler to interrupt a process in the middle of execution, what this means is that once a process has begun execution it will hold onto the resources which were allocated to it until it has finished execution and only then will it reluinquish the resources.
### d: Provide an example of a scheduling algorithm used in operating systems and explain how it works. Discuss its advantages and disadvantages. [6 marks]
An example of a scheduling algorithm in operating systems is Round Robin with Priority (RRP). To explain this I will first explain Round-Robin. Round Robin is the scheduling method which involves dividing time equally among processes so that each process has an equal size "Quantum". This results in a predictable algorithm but does not lead to the most efficient use of resources and more resource intensive processes will be slowed greatly. Round Robin with Priority is very much like the above variation howeveer the order in which the processes are allocated their resources is ranked based on priority, not only this but the size of their quantum is also allocated based on priority. Each process will still have the same size quantum but the more important processes will get faster responses. An example of this in action would be a command executed by the user from terminal to execute a c executable will be able to execute before a background task that is checking the temperature of the some external temperature sensor.
