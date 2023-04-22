# Exam Questions
## Question 1
### a: Explain the differences between user-level threads and kernel-level threads in terms of their management and performance implications. [3 marks]
A kernel-level thread is a much more heavy weight thread than user level, each kernel-level thread has its own resources allocated to it and it operates very much seperately from other knerl-level-threads. Kernel -Level threads are scheduled and managed by the oeprating system's kernel hence the name.
A user-level thread is a lightweight thread that is called and used from inside user applications using libraries. An example of this type of thread is pthreads. They are lightweight threads and they all share one scope (unless running from inside different processes).
### b: Describe the purpose and functionality of the following pthread library functions: pthread_create, pthread_detach, and pthread_cond_signal. [6 marks]

### c: Given an array of integers with length n, write a C pthreads program that uses 4 threads to find the maximum value in the array, storing the result in a global variable called max_value. [8 marks]

### d: Explain how race conditions can occur in multi-threaded programs and provide an example of such a situation. [3 marks]

## Question 2
### a: What is the purpose of a model checker like SPIN, and what kinds of issues can it detect? [6 marks]

### b: Define and provide examples of the following terms in the context of concurrent systems: deadlock, livelock, and starvation. [4 marks]

### c: Describe the Dining Philosophers Problem and its significance in the study of concurrent systems. [4 marks]

### d: Write a Promela model of a simplified version of the Dining Philosophers Problem with three philosophers. [6 marks]

## Question 3
### a: Explain the role of the memory management unit (MMU) in a virtual memory system. [4 marks]

### b: List two hardware features that support the implementation of modern operating systems and explain their importance. [6 marks]

### c: A Hard Disk has the following parameters:

- Rotational speed: 10000 RPM
- Seek Time between adjacent Tracks: 0.8mS
- Average Seek Time: 9mS
- Sector Size: 512 bytes
- Sectors per Track: 200

  (i) Define the terms "Track," "Rotational Delay," and "Seek Time."
  (ii) Calculate the time to read 500 sectors when the sectors are randomly distributed across the disk.
  (iii) Calculate the time to read 500 sectors when the sectors are sequentially located on five consecutive tracks. [5 marks]

### d: Explain the concepts of "Superblock," "Inode," and "Directory" in the context of file systems, with an emphasis on their role in organizing and managing files. [5 marks]
