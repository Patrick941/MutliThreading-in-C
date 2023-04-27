int pathTaken;

init{
    atomic{
        run P1();
    }
}

proctype P1(){
    do
    :: true -> pathTaken = 1; break;
    :: true -> pathTaken = 2; break;
    :: true -> pathTaken = 3; break;
    :: true -> pathTaken = 4; break;
    od;
    if
    :: pathTaken == 1 -> printf("The value for pathTaken is: 1\n"); assert(pathTaken != 3); 
    :: pathTaken == 2 -> printf("The value for pathTaken is: 2\n"); assert(pathTaken != 3);
    :: pathTaken == 3 -> printf("The value for pathTaken is: 3\n"); assert(pathTaken != 3);
    :: pathTaken == 4 -> printf("The value for pathTaken is: 4\n"); assert(pathTaken != 3);
    fi

    
}