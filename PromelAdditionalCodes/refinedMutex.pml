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