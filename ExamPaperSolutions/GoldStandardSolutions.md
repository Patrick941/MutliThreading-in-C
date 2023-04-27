# Gold Standard Solutions
## Question 1:
#### a: What is the main difference between a process and a thread?
The main difference between a process and a thread is how they manage resources, i.e. scope, a number of threads in the same program share a scope which in practices means they share memory. On the other hand each process has its own scope meaning that they have their own segment of memory attached to them and they cannot access a shared global variable. Somewhat related to this is the fact that a process can contain multiple threads but a thread cannot contain multiples processes.
#### a: Different processes do not share global memory, while different threads in a process all share that processes memory. What advantage do processes have over threads? What advantage do threads have over processes?
#### a: How do processes differ from threads in typical UNIX-like operating systems? What advantage do processes have over threads? What advantage do threads have over processes.
The advantage of a thread is that it is lightweight in comparison to a process. Another advantage is the fact that multiple threads can share the same memory as this can mean faster memory sharing. Both of these facts combine can lead to improved performance.
It could also be said that the distinct seperation between processes and their individual scope is an advantage as it means that a program can be easier to debug as a failure in one process does not necessairly cause other processes to fail. This means that processes can be combined to create larger and more scaleable programs with less difficulty.

#### b: Explain the operation of the following pthread library functions: pthread_mutex_lock; pthread_mutex_unlock; pthread_cond_wait; pthread_cond_signal; pthread_mutex_create; pthread_cond_join;
pthread_mutex_lock is the function called to lock a mutex, its argument is the address of the mutex object. When a thread calls the mutex lock function it usually just before it enters the critical section of the program, after it has been called any other thread that calls the mutex lock for the same mutex object will be held at the function call and forced to wait until the thread that posses the lock releases it with the pthread_mutex_unlock call.

pthread_mutex_unlock is used in conjuction with pthread_mutex_lock it has one argument that is the address of the mutex object. This function is called once a thread has finished operating in the critical section, this function will allow any other thread that is waiting at the mutex lock call to acquire the mutex and enter the critical section, if mutex unlock is called for a mutex that isn't locked the behaviour is undefined so this should be avoided.

pthread_cond_wait is the function callled to make a thread wait for a signal, it has two arguments, the first the address of the condition variable and the second the address of the mutex variable. Once the function has been called the thread that called it will unlock the mutex if it wasn't already unlocked and wait inside the function, it will wait for a signal call. It is important to ensure that this signal call will eventually arrive otherwise the thread will wait forever, it is also important to ensure that we avoid a scenario called deadlock where every thread is waiting for a signal that will never come. 

pthread_cond_signal is the function to wake any thread waiting on a given conditional variable. It's one argument is the address of the condition variable. One of the threads that was waiting with the condition variable continues execution and whatever the state of the mutex passed into cond_wait before the function call is restored. In order to wake all of the threads waiting on the given condition variable broadcast should be used. This function does not cause any issue when a condition is not currently waiting as the signal is called, the function simply does nothing. 

#### c: Function is_perfect returns true if a number is perfect (the sum of all its factors), with signature: int is_perfect(int n); It return 1 if n is perfect and 0 otherwise. Using this function write a multi-threaded C program to count the number of perfect numbers in the interval 1...N
```c
#include <pthread.h>
#include <stdio.h>
#include <stdlib.h>

#define THREAD_COUNT 8
#define N 10000

pthread_t threads[THREAD_COUNT];
pthread_mutex_t lock;

int perfectCount = 0;

void * inputDivider(void * arg);

int isPerfect(int n);

int main(){
    pthread_mutex_init(&lock, NULL);

    for(int i = 0; i < THREAD_COUNT; i++){
        int * index = (int*)malloc(sizeof(int));
        *index = i;
        int result = pthread_create(&threads[i], NULL, &inputDivider, (void*)index);
        if(result == -1){
            exit(1);
        }
    }

    for(int i = 0; i < THREAD_COUNT; i++){
        int result = pthread_join(threads[i], NULL);
        if (result == -1){
            exit(1);
        }
    }

    printf("The amount of perfect numbers was %i\n", perfectCount);

    pthread_mutex_destroy(&lock);
}


void * inputDivider(void * arg){
    int index = *((int*)arg);
    int stepSize = N / THREAD_COUNT;
    int upperBounds, lowerBounds;
    int localSum = 0;
    if(index == THREAD_COUNT - 1){
        lowerBounds = (index) * stepSize;
        upperBounds = N;
    } else {
        lowerBounds = index * stepSize;
        upperBounds = (index + 1) * stepSize;
    }
    //printf("For thread %i the lowerBounds are %i and the upper bounds %i\n", index, lowerBounds, upperBounds);
    for(int i = lowerBounds; i < upperBounds; i++){
        if(isPerfect(i) == 1){
            localSum++;
        }
    }
    pthread_mutex_lock(&lock);
    perfectCount =+ localSum;
    pthread_mutex_unlock(&lock);
    return NULL;
}

int isPerfect(int n){
    return ( 2 * (((double)n / 2.0) - (n / 2)));
}
```
#### c: Function trapezoid computes the area of a trapezoid, for use in a numerical integration algorithm.a is the current x-value, while h is the width of the thin vertical strip whos area is being approximated. Assuming that trapezoid has been provided, as well as a function double f(double x), write a C pthreads program that uses 100 threads to numerically integrate f between 0 and 10.
```c
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
```
#### c: The average of a list of n numbers x1, ..... xi, .....xn is given by x hat = sumof(x (from 1 to n))/n. Given n = 600000, and the xi and C double stored in an array of that size, write a C pthreads program that uses 6 threads to compute the average, storing the result in a global variable called average.
```c
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

```
#### d:What does the phrase embarassingly prallel or massively parallel mean in relation to a prallel program? Would you consider the program in Q1(c) above to be embarassingly parallel? Explain your answer.
Embarassingly parallel refers to a program that can be very easily implemented as a parallel system. This means that there is little or no communication between seperate threads such as the above example where each thread does its own independant section and then once at the end the thread adds its local sum to the shared global sum.
Massively parallel refers to a type of computing which means using a large number of processing cores to work together to perform a specific task by distributing sections of the problem between multiple processes.

#### d: Consider two threads running concurrently, where global is a global variable, while local is local to each thread, each of which does the following: local = global; local = local+1; global = local; Assuming that global is initialised to 0 initially, describe how the execution could result in global having a final value of 1;
This code snippet will result in a 1 in all scenarios except where one thread executes the entire code before the other begins. Consider the following possibility, Thread 1 reads global as 0 and stores it in local, Thread 1 increments local, Thread 2 reads global as 0 and stores it in local, Thread 2 increments local, Thread 1 stores local with value 1 into global, Thread 2 stores local with value 1 into global. This is an example of how the above code execution can result in a value that is 1. This can be prevented using a mutex, this code can be wrapped in a call to mutex_lock and mutex_unlock.

## Question 2:
#### a: Explain the concepts of statement executability and blocking in Promela, using the following two statements as examples: ok = hi > lo; hi > lo; Your asnwer should explain how each of the above statements change the model state when they do execute.
In promela a statement can be either executeable or blocking, an executable statement will execute the line and the program will move on. A blocking statement will stop the program at the current line. A statement will be block in a couple of different scenarios, a statement will block if any of the contents are undefined. A statement will also block if it is a condition that is false and is not assigned, i.e. 0 > 1; will block forever and return an error while 1 > 0 will just be an executable statement. If is false but will become true eventually the program will block at this line until the condition becomes true.
In the context of the above statements ok = hi > lo; will be executable provided that hi and lo are both defined, if they are undefined the program will wait until they are defined.
In the context of the statements hi > lo; this statement will also block for any undefined values but it will also block when the statement is false i.e. if hi <= lo;

#### a: SPIN is described as a model checker. What does that mean, precisely? Why might such a checker be useful?
To define a model checker we will first define a model, a model in the context of this question and a concurrent program is a 'plan' for a concurrent system. Spin is able to verify or 'check' the model that we have for a concurrent system. it is able to do this through verification and interpretation, verification is where SPIN will go through every single possible path of a model and determine whether it reaches a valid end state in all paths while also not violated any assertions or LTL logic. Interpretation will take one random path that can be manipulated by the developer to test a given path. This is useful as it means we can begin writing our code in a language such as C and know that our model is absolutely correct, this makes the troubleshooting process much simpler as it means that we can narrow down our problem to the C code itself. Another benefit is that it will check every single possible scenario, this is beneficial as some errors will only occur under very niche circumstances which may not get caught in development which may mean it reaches the final product.

#### b: Write a model in promela for the following hardware atomic instruction, known as Compare-and-Swap: it compares a CPU register reg to a first memory location mem1, storing the result in another register variable res; if they are the same then it overwrites mem1 with the contents of another memory location mem2; if they are not the same, then it loads mem1 into register reg. Your models should clearly show the use of any temporary storage in the CPU.
```pm
int mem1 = 5;
int mem2 = 9;


init{
    atomic{
        run P1();
    }
}

proctype P1(){
    atomic{
        int localReg = 5;
        int res = mem1 == localReg;
        do
        :: res == 1 ->  mem1 = mem2; 
                        printf("Values were equal\n");
                        break;
        :: else     ->  localReg = mem1;
                        printf("Values were not equal\n");
                        break;
        od;
        
    }
}
```
#### b: Write a model in Promela for each of the folliwing hardware atomic instructinos: a) Test and set: read a value from memory; write 1 to that memory location b) Swap the content of two distinct memory locations. Your models should clearly show the use of any temporary storage in the CPU.
```pm
int mem1 = 5;
int mem2 = 9;


init{
    atomic{
        run P1();
    }
}

proctype P1(){
    atomic{
        int localReg;
        localReg = mem1;
        localReg = 1;
        mem1 = localReg;

        printf("After reading and writing the value in mem1 is %d\n", mem1);

        localReg = mem2;
        int localReg1 = mem1;
        mem1 = localReg;
        mem2 = localReg1;
        
        printf("After swapping the value in mem1 is %d, the value in mem2 is %d\n", mem1, mem2);
    }
}
```

#### b: Explain the terms deadlock, livelock, starvation and fairness
deadlock is the scenario that occurs when two threads are waiitng for eachother and doing nothing. This can occur in the following scenario, thread 1 begins execution, it calls pthread_wait and is waiting until it receives a signal from thread 2. Before thread 2 sends the signal it calls pthread_wait also for either the same or a different variable. In this scenario both threads will be waiting forever unless there is another thread there also which is able to wake up these threads.

livelock is similar in the result to deadlock that it occurs when two threads are not progressing but a livelock in active lock which is to say both threads are still executing lines of code. A livelock occurs when both threads are waiting for a condition to be met which never is or atleast never is at the right time. This can occur in the following scenario where thread 1 and 2 are both in while loops where they have conditions val==1 and val==2 respectively. Thread 1 begins execution, it signals thread 2 which is already executing, thread 1 sets val = 2 and then it calls the wait, thread 2 now sets val to be 1, signals thread 1 and waits. Thread 1 now begins execution again but since val == 1 stays in the while loop, it returns to the top of the code where it will set val = 1, signal thread 2 and wait. This is back where we started and the infinite loop is clear.

Starvation is concurrency issue where threads are not being allocated resources evenly, the starving thread or threads can be receiving very little or no resources often due to another thread being greedy. This can occur as follows. Three threads exist, thread1, thread2 and thread3. All contain a string, thread1 contains a massive string while thread2 and 3 just contain normal size strings, each thread wants to print their string to stdout but must acquire the mutex to do this. Take the following scenario, the code is layed out so that there is a critical section and surrounding it there is a mutex lock and unlock, however thread3 is running a slightly altered loop, instead of a mutex lock it is running a mutex trylock and checking the result to see whether it obtained the lock or not. Thread1 begins execution acquires the lock and takes a long time to print to stdout, it then releases the lock. While thread1 was doing this thread2 began waited at the mutex while thread3 was simply trying over and over to obtain the lock. Since the mutex is now unlocked and thread2 is in the queue it will obtain the lock and execute its critical section and then unlock the lock. During this time thread1 was able to loop back round and begin waiting for the lock itself, now since again thread1 is actually in the queue while thread 3 is just using trylock thread1 will acquire the mutex and this process could loop forever although it is technically possible that thread3 obtains the lock at some points. In the given example we have 3 threads, thread1 is being greedy and taking more resources than all the other threads, thread2 is being starved as it is receiving much less than a third of the resources while thread1 is being starved and receiving no resources whatsoever.

Fairness is the measure of how evenly resources are being shared amongst threads. A program is fair if every thread is given adequate time to make progress and execute its tasks. An example of a program that is not fair is given above. This program could be made more fair by decreasing the size of the thread 1 string and by changing the thread3 function to operate the same as the thread 1 and 2 functions.

#### c: Consider a model of a proposed solution to the mutual exclusion problem, where the critical region can be viewed for simplicity as the following Promela statement. critical_stuff; Describe how to add a variable and extra statements involving that variables that check that at most one process is ever doing critical_stuff at any one time:
```pm
int mutex = 0;

init{
    atomic{
        assert(mutex == 0 || mutex == 1);
        run P1();
        run P1();
        run P1();
        run P1();
        run P1();
        run P1();
        run P1();
        run P1();
        run P1();
    }
}

proctype P1(){
    int tickCounter = 0;
    do
    :: tickCounter <= 100 -> atomic{
                                do
                                :: mutex = 0 -> mutex = mutex + 1;
                                                printf("%d Entering Critical section\n", _pid);
                                                printf("%d doing critical stuff with mutex value %d \n", _pid, mutex);
                                                tickCounter = tickCounter + 1;
                                                printf("%d Leaving critical section and unlocking mutex\n", _pid);
                                                mutex = mutex - 1;
                                                break;
                                :: else ->      ;
                                od
                            }
    :: else -> break;
    od
}
```


#### c: SPIN has two main modes of operation -- interpretation and verification. Explain the difference between them, and the imporatance of that difference.
Interpretation is the method of testing a model where one path will be taken, this path is chosen at random but can be manipulated by the developer to test a given path, this can be useful as the location of the bug is already known this is a much faster way to test a program than verfication.
Verification is the method of fully verifying that a model is correct, it will simulate the program for every single path and ensure that the program will reach a valid end state in every run while also not violating any assertions or LTL logic.

#### d: Promela, like C, allow "labels" to be attached to statements. These can then be used as targets for the goto statements. In addition, labels with certain prefixes have special meaning for the spin model-checker. What properties are meant to be verified using: i) Labels that begin with end? ii) labels that begin with progess?
A label that begins with end is used to go to the end of a specific portion of a system or in some cases might just be the end of the system. This can be used to prevent the system from reaching a specific part of code that it is not meant to, this can also just be used to go straight to the end of the program when the program has nothing left to do.
A label that begins with progress is used to mark progress points in a code. They can have print statements attached to indicate the state of the program when it reaches this progress point. They can be branched to similarly to the end labels, when a section of code has finished or reached an undesired state it can branch to what the appropriate progress point would be. The spin model checker will also check these progress labels to ensure that a future state is being reached and the program is not getting stuck in a livelock. This can be tested with the -l flag.

#### d: Model checkers are usually used to see if all desired properties hold of a model, if they find a property violation, they report an error and return a counter-example that shows a sequence of steps that leads to a property failure. GIven a model known to be correct, with a number of valid end-states, explain how to use the SPIN model-checker to generate a path through the model that leads to a given valid end-state.
Maybe use assertions, maybe use never, maybe use something else.

## Question 3:
#### a: What is the difference between a physical address and a virtaul address?
A physical address is a physical location in memory where data is stored. A physical address can be accesses by assembly language but is not used in higher level languages such as C. In normal programs physical addresses are accessed through the memory managaement unit.
A virutal address is an address that a developer uses in a program. These addresses are much simpler as the developer can use any address without having to worry about memory management. When a program is run and a piece of data is stored in a virtual address that address gets handed to the MMU translation layer which will translate the address to a logical physical address.
The advantage of a physical address is in some applications where assured real time response is critical the reliable timings of physical addressing is useful.
For almost all other applications virtual memory is used. This is much more predominant as it will lead to better performance, this is due to the memory management unit being able to map memory logically and also being able to use advanced memory management techniques such as CPU caching.

#### a: Explain the lifetime of a typical programme on a typical computer. What aspect of its behaviour has the most influence on the design of both hardware and operating system software?
* Loading: In the first stage of the execution of a program, the program is loaded onto RAM from a SSD or HDD.
* Initiliasation: Next the program initializes all the variables and objects by allocating memory and setting up data structures
* Execution: Next is the main stage of the program, the execution stage. The execution stage itself alternates between two different mdoes, one mode is the computation state, this is where it performance computation where there is fast traffic between the CPU and RAM. The other mode is the IO mode where input and output traffic passes between the CPU and DEV.
* Shutdown: The last stage is the shutdown stage where all memory is deallocated and connections to the program such as a camera are terminated.

#### b: Describe two hardware features that have been provided to facilitate the implementation of modern operating systems.
One hardware feature that has helped the implementation of modern operating systems is the introduction of multi-threaded processors. This greatly increases the speed at which operating systems can operate. This allows more processes to be opened at once and the processes that are opened have more resources available to them.
Another hardware feature that has helped the implementation of modern operating systems is the memory management unit, the memory management unit is able to improve performance by implementing advanced memory management techniques using virtual addresses including but not limited to the logical arrangement of memory and the ability to utilize CPU cache. This also makes development easier which will make it easier to build more complex programs.
Another hardware feature that has helped the implementation of modern operating systems is interrupts. Interrupts can as their name may suggest can interrupt execution when a interrupt is triggered. An example of this is on a raspberry pi pico maker board when the buttons connected to the GPIO pins can be programmed to interrupt the code when the button is pressed and handle this event before returning to the normal execution of the program.

#### b: Given a demand-paged virtual memory system with the following parameters:
##### Page Fault Probability (p)          |   0.000001
##### Memory access time                  |   5nS
##### Average time to reada page from disk|   10mS
##### i) Calculate the effective access time.
A~et ~ = (A~t~(1 - p)) + (R~t~ * p)
##### ii) What is the slowdown due to the use of demand paging (as a factor of memory access time)?
##### iii) What would the page fault probability have to be to have an overheads of less than 50% (i.e. so that the average access time would not be more than 150% of the memory access time)?

#### c: Given a hard Disk with the following parameter:
#### Rotational speed                    |   5400 RPM
#### Seek time between adjacent tracks   |   1mS
#### Average Seek Time                   |   10mS
#### Sector Size                         |   512 bytes
#### Sectors per Track                   |   100
#### i) Explain the terms "Track", "Sector" and "Seek time" 
#### ii) Calculate the time to read 100kbytes if all the sectors are randomly mixed across the disk.
#### iii) Calculate the time to read 100kbytes if all the sectors are in order on two adjacent tracks

#### c: Given a hard disk with the following parameters: 
#### Rotational Speed                    |   7200 RPM
#### Seek time between adjacent tracks   |   0.5ms
#### Average seek time                   |   8ms
#### Sector size                         |   1kB
#### Sectors per track                   |   100
#### i) Explain the terms "Track", "Relational Delay" and "seek Time"
#### ii) Calculate the time to read 1000 sectors if all the sectors are randomly mixed across the disk.
#### iii) Calculate the time to read 1000 sectors if all the sectors are in order on ten adjacent tracks.

#### c: Virtual memory is normally not used in applications where assured real-tim response is required. Why is that?

#### d: Explain the File-system concepts of "Inode", "filename", and the distinction between "Open" and "Closed" files.

#### d: Explain the file-system concepts of "inode", "Directory", and the distinction between 'open" and "Closed" files, with an emphasis on the relevant data-structures.

#### d: Explain with diagrams, the operation of the scheduler in a conventional operating system. In your answer, exaplin the concept of fairness and explain how it might be managed in a scheduler