bool mutex = 0;
int whileCounter = 0;

init{
    atomic{
        do
        ::  whileCounter < 100 ->   run P1();
                                    whileCounter ++;
        ::  else ->                 break;
        od;
    }
}

proctype P1(){
    assert(mutex == 0 || mutex == 1);
    atomic{
        do
        :: mutex == 0 ->    mutex = mutex + 1; 
                            printf("Mutex Locked\n");
                            //Critical_stuff;
                            break;
        :: else;
        od
        mutex = 0;
        printf("Mutex unLocked\n");
    }
}