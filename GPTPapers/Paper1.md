# Exam Questions

## Question 1

### a: Explain the differences between user-level threads and kernel-level threads. What are the advantages and disadvantages of each? [4 marks]

### b: Describe the operation of the following pthread library functions: pthread_create, pthread_exit, and pthread_mutex_init. [6 marks]

### c: Write a C pthreads program that calculates the factorial of a given number N using multiple threads. Each thread calculates the product of a portion of the range from 1 to N. [8 marks]

### d: Consider a scenario where two threads are running concurrently, and they both access a shared global variable called "counter". Describe a possible race condition that could occur and suggest a way to prevent it. [4 marks]

## Question 2

### a: Explain the concept of model checking and its importance in verifying concurrent systems. [4 marks]

### b: Define the terms deadlock, livelock, and starvation in the context of concurrent systems. Provide an example for each. [6 marks]

### c: Describe the difference between safety and liveness properties in concurrent systems. Provide an example of each. [4 marks]

### d: Write a Promela model for a simple concurrent system with three processes that use semaphores for synchronization. Explain how the model ensures mutual exclusion. [6 marks]

## Question 3

### a: Describe the role of a memory management unit (MMU) in a virtual memory system. [4 marks]

### b: Explain the concept of paging in virtual memory systems and how it helps in efficient memory management. [4 marks]

### c: Consider a virtual memory system with the following parameters:

- Page size: 4096 bytes
- Virtual address space: 32 bits
- Physical address space: 28 bits

Calculate the number of entries in the page table and the size of each entry. [4 marks]

### d: Explain the concepts of demand paging and page replacement algorithms in the context of virtual memory systems. Provide an example of a widely-used page replacement algorithm and describe how it works. [6 marks]

## Question 4

### a: Explain the role of a file system in an operating system and describe the basic operations performed by a file system. [4 marks]

### b: Describe the concepts of "File Allocation Table (FAT)" and "Inode" in the context of file systems. Explain the differences between them. [6 marks]

### c: Explain the concept of process scheduling in operating systems. Describe the differences between preemptive and non-preemptive scheduling. [4 marks]

### d: Provide an example of a scheduling algorithm used in operating systems and explain how it works. Discuss its advantages and disadvantages. [6 marks]

Standard C Startup
