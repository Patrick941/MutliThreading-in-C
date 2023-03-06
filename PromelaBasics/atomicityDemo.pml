init{
    atomic{
        printf("These ");
        printf("print ");
        printf("statements ");
        printf("are ");
        printf("not ");
        run P();
    }
    printf("Some inteference");   
    atomic{
        (_nr_pr == 1);  //Acting somewhat like a mutex lock, but waits for other threads to finish instead of stopping them
        printf("These ");
        printf("print ");
        printf("statements ");
        printf("are ");
        run P();        
    } 
}

active proctype P() {
    int i = 0;
    int tickDelay = 1000000;
    do
    ::  i < tickDelay -> i++
    ::  else -> printf("~~~~~");
                break;
    od
    printf("executed ");
    printf("in ")
    printf("order\n");
}
