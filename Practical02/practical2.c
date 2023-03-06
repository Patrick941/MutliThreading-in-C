
#include <pthread.h>
#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include <string.h>
#include <time.h>
#include <unistd.h>
#include "cond.c"

//Run commands
//cc -o p2 practical2.c -pthread
//./p2 < 1to20.txt


int pnum;                                   // number updated when producer runs.
int csum;                                   // sum computed using pnum when consumer runs.

int (*pred)(int);                           // predicate indicating if pnum is to be consumed

int waitingThread = 0;                      //boolean variable to prevent deadlock

//Mutex and condiition variables
pthread_mutex_t lock;
pthread_cond_t condVar1;
pthread_cond_t condVar2;

int produceT() {
  scanf("%d",&pnum);                        // read a number from stdin
  return pnum;
}

void *Produce(void *a) {
  int p;

  p=1;                                      //Ensure p has the correct initial value
  waitingThread = 1;                        //Ensure waitingThread has the correct initial value
  while (p) {

    pthread_mutex_lock(&lock);              //Lock mutex to ensure program has no threads are waiting when one of the threads has left loop

    while(waitingThread != 1){
      pthread_cond_wait(&condVar1, &lock);  //Prevent dealock by making sure both threads can't wait at once
    }

    printf("@P-READY\n");                 
    p = produceT();                         //Read from .txt and update pnum
    printf("@PRODUCED %d\n",p);
    
    waitingThread = 2;                      //Set waitingThread to indicate that the other thread has been signalled
    pthread_cond_signal(&condVar2);         //Signal otherthread to continue execution

    //waitingThread = 0;

    pthread_mutex_unlock(&lock);            //Unlock mutex

  }
  printf("@P-EXIT\n");
  pthread_exit(NULL);
}


int consumeT() {
  if ( pred(pnum) ) { csum += pnum; }
  return pnum;
}

void *Consume(void *a) {
  int p;

  p=1;                                      //Ensure p has the correct initial value
  waitingThread = 1;                        //Ensure waitingThread has the correct inital value
  while (p) {

    pthread_mutex_lock(&lock);              //Lock mutex to ensure program has no threads are waiting when one of the threads has left loop

    while(waitingThread != 2){
      pthread_cond_wait(&condVar2, &lock);  //Prevent dealock by making sure both threads can't wait at once
    }

    
    printf("@C-READY\n");
    p = consumeT();                         //Read from pnum and update csum
    printf("@CONSUMED %d\n",csum);          
    waitingThread = 1;                      //Set waitingThread to indicate that the other thread has been signalled
    pthread_cond_signal(&condVar1);         //Signal otherthread to continue execution

    pthread_mutex_unlock(&lock);            //Unlock mutex
    
  }

  printf("@C-EXIT\n");
  pthread_exit(NULL);
}


int main (int argc, const char * argv[]) {
  // the current number predicate
  static pthread_t prod,cons;
	long rc;

  pthread_cond_init(&condVar1, NULL);
  pthread_cond_init(&condVar2, NULL);
  pthread_mutex_init(&lock, NULL);

  pred = &cond1;
  if (argc>1) {
    if      (!strncmp(argv[1],"2",10)) { pred = &cond2; }
    else if (!strncmp(argv[1],"3",10)) { pred = &cond3; }
  }


  pnum = 1;
  csum=0;
  
  printf("@P-CREATE\n");
 	rc = pthread_create(&prod,NULL,Produce,(void *)0);
	if (rc) {
			printf("@P-ERROR %ld\n",rc);
			exit(-1);
		}
  printf("@C-CREATE\n");
 	rc = pthread_create(&cons,NULL,Consume,(void *)0);
	if (rc) {
			printf("@C-ERROR %ld\n",rc);
			exit(-1);
		}

  printf("@P-JOIN\n");
  pthread_join( prod, NULL);
  printf("@C-JOIN\n");
  pthread_join( cons, NULL);

  pthread_cond_destroy(&condVar1);
  pthread_cond_destroy(&condVar2);
  pthread_mutex_destroy(&lock);


  printf("@CSUM=%d.\n",csum);

  return 0;
}
