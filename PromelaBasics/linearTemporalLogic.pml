bool wantP = true;
int critical = 0;
int totalThread = 1;

never {critical > 1}; ///Don't know how to get this to work, have to do some weird terminal stuff

init{
    atomic{
        run P();
        (_nr_pr == 1) -> printf("The total process count is %d\n", totalThread);
    }
}

active [25] proctype P() {
    printf("Process P%d has begun execution \n", _pid);
    
    // A code block to implement the functionality of sleep
    atomic {
        int i = 0;
        int majorDelay = 100000;
        int minorDelay = 10000;
        do
        ::  wantP = true -> critical++;
                            wantP = false;
                            printf("Process %d is entering critical section\n", _pid);
                            critical++;
                            totalThread++;
                            do
                            ::  i < majorDelay -> i++
                            ::  else -> break;
                            od;
                            critical--;
                            printf("Process %d is exiting critical section\n", _pid);
                            wantP = true;
                            break;
        ::  else    ->  do
                        ::  i < minorDelay -> i++
                        ::  else -> break;
                        od;
                        printf("Procces %d is waiting for other mutex to unlock\n", _pid);
        od;
    }


    printf("Process P%d has finished execution\n", _pid);
}
