#define N 10

/* A "Hello World" Promela model for SPIN. */
active proctype Hello() {
    int value = 1;
    assert(value < N);
    do
    ::  value < (N * 2) ; value++;
        printf("Current value is %d\n", value);
        assert(value < N);
    :: else ; break;
    od;  
    
}