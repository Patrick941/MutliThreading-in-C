int x, y;
bool myBool;


init{
    atomic{
        run P1();
        run P4();
        run P3();
    }
}

proctype P1(){
    printf("Setting variables to block\n");
    x = 2;
    printf("x has been set\n");
    y = 1;
    printf("y has been set\n");
}

/*proctype P2(){
    atomic{
        printf("About to make comparison\n");
        myBool = y > x;
        1 > 0;
        do
        :: myBool == 0 ->   printf("Bool is false\n");
                            break;
        :: else ->          printf("Bool is true\n");
                            break;
        od
    }
}*/

proctype P3(){
    printf("Waiting for comparison to become true\n");
    myBool = y > x;
    printf("Comparison became true\n");
}

proctype P4(){
    int i = 0;
    int tickDelay = 10000000;
    do
    ::  i < tickDelay -> i++
    ::  else -> printf("~~~~~");
                break;
    od
    printf("Setting variables so they don't block\n");
    y = 3;
    printf("Variables have been set so they don't block\n");
}