bool wantP = false, wantQ = false;

init{
    atomic{
        run P();
        run Q();
        wantP = true;
    }
}

#define mutex !(P@cs && Q^cs)

proctype P(){
    do
    ::  wantP = true && wantQ == false ->
        printf("Executing cs of P\n");
    cs: wantP = false;
        break;
    od;
}

proctype Q(){
    do
    ::  wantQ = true && wantP == false ->
        printf("Executing cs of Q\n");
    cs: wantQ = false;
        break;
    od;
}