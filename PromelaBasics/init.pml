init{
    atomic{
        run P();

        //Demonstration of the functionality of waiting, this will wait until init is the only process executing
        printf("There is no garauntee that processes have finished execution\n");
        (_nr_pr == 1) -> printf("All processes have finished execution\n");
    }
}

active [10] proctype P() {
    printf("Process P%d has begun execution \n", _pid);
    
    // A code block to implement the functionality of sleep
    atomic {
        int i = 0;
        int tickDelay = 100000;
        do
        ::  i < tickDelay -> i++
        ::  else -> break;
        od
    }


    printf("Process P%d has finished execution\n", _pid);
}