int mem1 = 5;
int mem2 = 9;


init{
    atomic{
        run P1();
    }
}

proctype P1(){
    atomic{
        int localReg;
        localReg = mem1;
        localReg = 1;
        mem1 = localReg;

        printf("After reading and writing the value in mem1 is %d\n", mem1);

        localReg = mem2;
        int localReg1 = mem1;
        mem1 = localReg;
        mem2 = localReg1;
        
        printf("After swapping the value in mem1 is %d, the value in mem2 is %d\n", mem1, mem2);
    }
}