int value = 5;


init{
    atomic{
        run P1();
    }
}

proctype P1(){
    atomic{
        int temp = value;
        printf("The value in memory was %d\n", temp);
        value = 1;
        printf("The value in memory is now %d\n", value);
    }
}