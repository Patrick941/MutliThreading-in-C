# **Promela Spin:**
## Command Line:

    spin main.pml                   // Run program
    spin -uN main.pml               // Run program for N steps
    spin -a main.pml                // Run program and generate the verifier source code
    gcc -o pan pan.c                // Compile verifier source code
    spin -e main.pml                // Run program an create trails for all errors
    spin -cN main.pml               // Run program at stop at error N, ignore errors with c0
    spin -p main.pml                // Run program and display statements
    spin -g main.pml                // Run program and display global data
    spin -l main.pml                // Run program and display local data
    spin -s main.pml                // Run program and display sent data
    spin -r main.pml                // Run program and display received data
    spin -T main.pml                // Run program without automatic threading indentation
    spin -i main.pml                // Run program in interactive mode (select order)
## Basics:
### Data Types:
The valid data types are bit, bool, byte, short, int and unsigned. Floats are not a valid date type but can be used in embedded C programs which can be used if assumed to be true by spin.
### 'do' 
This is the same as while C (not sure if it can only contain conditions as instructions), it is formatted as such:

    do
    :: // Instruction 1
    :: // Instruction 2
    :: // Instruction 3
    od
### 'if' 
If statements are not functionally identical to C, only one instruction inside the statement can be executed meaning that it two are true then there is no garauntee which of the instructions will execute, the if statement can be formatted as such: (The '->' can be replaced with a ';')

    if
    :: // Condition 1 -> // Instruction
    :: // Condition 2 -> // Instruction
    :: else -> // Instruction
    fi;
### Conditional assignments
This will assign to the first value if true and the second value if false, this can be formatted as such:

    max = (a > b -> a : b)
### 'for'
For loops can be implemented using the "for.h" library, the syntax is as such:

    for (i, 1, 10)
        sum = sum + i;
    rof(i)
### 'goto' 
Can be used to go to a specific line and can be used to go to specific labels also which are created much like arm assembly. They are formatted as such:

    do
    :: if something -> repeat
    :: else -> goto end
    od;
    end:
## Assertions: 
Assertions are statements which are given and will need to be true for the program to continue to execture, an assertion line will have to be run in order for it to be able to terminate a program. When we make an assertion, spin will look to find counter examples to our assertions, It is formatted as such:
    assert(value <= 10)
### Preconditions 
Preconditions are not often used in spin as their is rarely an input that is non-deterministic
## Concurrency
### Processes 
In promela processes can be defined using: (active means that the process is always active and runs continuously)

    active proctype() {
        //some code
    }
### Atomicity
Statements in promela are atomic which is the same as C, each instruction will be executed to its entirety before the next line in this process is executed.
### Set of processes
Processes which are identical can be declared as sets. They can then be destinguished when in their sets using the _pid variable, the syntax is as such:

    byte n = 0;

    active [2] proctype P() {
        byte temp;
        temp++;
        n = temp;
        printf("Process P%d, n = %d\n", _pid, n)
    }
### 'init' 
This is a process which is executed before other processes in promela, it is also able to 'run' and 'stop' other processes. It is also able to wait for other processes using nr_pr. This can all be shown in the code block below:

    init{
        atomic{
            run P();
            run P()
        }
        (_nr_pr == 1) -> //code
    }
### 'd_step' 
This can be used to execute in deterministic step, this means that all the instructions inside this block will be allowed to execute as the same time.

    d_step{
        //code
    }
## Synchronization:
This is the managing of flow control where in C we would use conditions, mutex, semaphores and barriers
### Blocking
This can by done by simply setting a variable when a process is in a critical section and just having any other process read this variable and only enter the critical section when the other variable is not in it.
### States
A state of a promela program represents all the variables and current location of each variable. Not all these states will be possible as there may be blocking statements at points of the code forcing a specific order of execution.
### Semaphores
This is a variable of type byte, it is not a functional variable as it is in C, we must manipulate the variable to create the same functionality as C. Semaphores can wait and signal, they act the same as they do in C, they can be implemented as shown below:

    process 1:
    do
        //non-critical section
        atomic{
            sem > 0
            sem --
        }
        //critical section
        sem++
    od
    //Same thing for process 2
### Generation of number in range
This following code will generate a number between LOW and HIGH. It is worth noting that the number generated from this code is by no means a random number generation and heavily favours numbers on the lower end

    #define LOW 0
    #define HIGH 9
    byte numbeer = LOW;
    do
    ::  number < HIGH -> number++
    ::  break
    od;

## Linear temporal logic
Some issues cannot always be identified with assertion, the issue will either not be detected or the program may not finish and may not reach the line with the assertion before timeout.
#### Critical zone
Only 1 process should be in the critical zone at the same time which cannot be easily garaunteed with assertions.
#### Deadlocks
This will prevent the program from reaching whatever assertions it may have done
#### Array Bounds
This is the accessing of data outside of array bounds, this is very inconvenient to have to assert every time the array is accessed although it is possible.
### Implementation of LTL
#### Syntax:
The following operators can be combined to create conditions such as would be found inside an 'if' statement.
Operators:

    not         !=
    and         && 
    or          ||
    implies     ->
    equivalent  <->

Temporal operators:

    always      []
    eventually  <>
    until       U 

#### Use in code:
To implement LTL into code we use the above syntax inside if and do statements as shown in the following code snippet:

    active proctype P() {
        do
        ::  wantP = true;
            !wantQ;
            critical++;
            //critical section code
            critical--;
            wantP = false;
    }

### Safety properties
This is a property which is given using the never statement, the condition inside this never statement should never become true at any point in the code and if this conditon were to become true the program would teminate.
### Remote references
A code snippet for this is given below:

    #define mutex !(P@cs && Q^cs)

    active proctype P(){
        do
        ::  wantP = true;
            !wantQ;
        cs: wantP = false;
        od;
    }

    active proctype Q(){
        do
        ::  wantQ = true;
            !wantP;
        cs: wantQ = false;
        od;
    }

## Data and program structures
### Arrays
Arrays are a data structure with the same purpose as C and with a syntax the same as C.
### Structs
Structs exist the same as they do in C and also with a syntax the same as C.
### Pre-processor
Serves the same purpose as C, performs the same operations as C, is interacted with using the same syntax as C. 
### Inline
Inline constructs have similar functionality to functions in C but are lacking some key features. Inline constructs do not return values or local scope. An example of an inline construct is as follows:

    inline initEntry(I, R, C, V){
        a[I].row = R;
        a[I].col = C;
        a[I].value = V;
    }

## Channels
A channel is a method of allowing processes to communicate with one another, it is modelled after channels that exist in computer networks. However, one channel can have multiple receivers and multiple senders which is unlike computer networks channels.
### Implementation
### Syntax
The syntax of a channel is as follows:

    chan ch = [capacity] of {typename, ..., typename}

    ch ! open(data1, data2);

    ch ! (data1, data2);
### Example
To create a channel of capacity 5 where each message can include an integer, Byte and bool. The following code shows the create of the channel, the opening of the channel with some starting data and then the sending of the data along the channel.

    chan channel = [4] of {integer, Byte, bool}
    channel ! open(48, 5, false);
    channel ! (56, 3, false);

### Rendezvous channel
This is a channel with capacity 0, there is one sender and one receiver. There is an integer to track the message count. It is not often used.

### Reply channels
This is a two channel set up where one channel is dedicated for senciding and one is dedicated to receiving (in a local scope). By creating channels locally we can ensure that the channels are deleted after the client dies.

### Buffered channels
This is a solution where a queue is created for the messages to be sent across a channel. This can be represented in promela with a positive channel capacity such as in the above code snippet.
When using buffered channels it is possible to query the current amount of messages waiting in the buffer. The two available querying functions are nfull, full, nempty and empty, they will all return a true or false value. An example of them in use is below:
    
    empty(channel);
    nempty(channel);
    full(channel);
    nfull(channel);

### Random receive
This allows messages to be received from any part of the queue, not just the head. Using random receive it is also possible only to receive messages that are meant for the receiver. This is implemented in the code snippet below:

    reply ?? server, eval(_pid)
    
### Sorted send
This is a send statement which is used for buffered channels and acts as the corresponding send to the random receive. The format is the same as normal send but [] is used instead of ()

    channel ! [data1, data2]

### Copying message data
This is useful when we want to read the data from a message but not remove it from the channel. This can be done like this:

    ch ? <colour, time, flash>      //This is for a normal receive
    ch ?? <colour, time, flash>     //This is for a random receive

### Polling
This is the method of the receiver polling the channel after a specified time (or as often as it can sometimes) and reading if data is present.