int mem1 = 5;
int mem2 = 9;


init{
    atomic{
        run P1();
    }
}

proctype P1(){
    atomic{
        int localReg = 5;
        int res = mem1 == localReg;
        do
        :: res == 1 ->  mem1 = mem2; 
                        printf("Values were equal\n");
                        break;
        :: else     ->  localReg = mem1;
                        printf("Values were not equal\n");
                        break;
        od;
        
    }
}