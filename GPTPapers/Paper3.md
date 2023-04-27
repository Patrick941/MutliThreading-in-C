# Exam Questions

## Question 1

### a: Describe the roles of the operating system in managing multi-threading and multi-processing. [3 marks]

### b: Explain the purpose and functionality of the following pthread library functions: pthread_attr_init, pthread_attr_destroy, and pthread_cond_broadcast. [6 marks]

### c: Write a C pthreads program that uses 5 threads to calculate the factorial of a given non-negative integer n. Store the result in a global variable called factorial_result. [8 marks]

### d: Describe the concept of a critical section in concurrent programming and explain why mutual exclusion is important. [3 marks]

## Question 2

### a: Explain the main purpose of a model checker like SPIN and its application in verifying concurrent systems. [6 marks]

### b: Define the terms atomicity, consistency, isolation, and durability (ACID) in the context of concurrent systems. [4 marks]

### c: Discuss the concept of a monitor as a synchronization mechanism in concurrent programming. [4 marks]

### d: Write a Promela model of a simplified version of the Readers-Writers Problem with two readers and one writer. [6 marks]

## Question 3

### a: Discuss the benefits and drawbacks of using virtual memory in a computer system. [4 marks]

### b: Describe two types of operating system scheduling algorithms and explain how they differ in terms of their implementation and performance. [6 marks]

### c: A Solid State Drive (SSD) has the following parameters:

- Average Read Time: 0.1mS
- Average Write Time: 0.2mS
- Sector Size: 4096 bytes (4Kbytes)
- Sectors per Block: 64

  (i) Define the terms "Block," "Page," and "Erase Time."
  (ii) Calculate the time to read 1024 sectors when the sectors are randomly distributed across the SSD.
  (iii) Calculate the time to read 1024 sectors when the sectors are sequentially located within a single block. [5 marks]

### d: Explain the concepts of "journaling" and "log-structured file systems" in the context of file systems, with an emphasis on their role in ensuring data consistency and recovery. [5 marks]
