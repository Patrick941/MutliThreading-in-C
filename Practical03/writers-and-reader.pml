// Below here is (c) 2022 Andrew Butterfield, Trinity College Dublin.

#include "pthreads.pml"

// Code below here is a correct model of producer-consumer behaviour.
// DO NOT MODIFY

// ====== Buffer Model ========================================================

#define BUFSIZE 4
byte buffer[BUFSIZE];
byte in,out;
bool bfull,bempty;

inline zerobuffer() {
  in = 0;
  do
  :: in < BUFSIZE -> buffer[in] = 0; in++
  :: else -> in = 0; break
  od
  out = BUFSIZE-1;
  bfull = false; bempty = true;
  printf("buffer zeroed\n")
}

byte six;

inline showbuffer(){
  atomic{
    printf("@@@ %d BUFFER in:%d, out:%d, empty:%d, full:%d [|",_pid,in,out,bempty,bfull);
    six = 0;
    do
      :: six < BUFSIZE -> printf(" %d |",buffer[six]); six++;
      :: else -> printf("]\n"); break;
    od
  }
}

#define NEXT(i) ((i+1) % BUFSIZE)

inline insert(x) {
  assert(!bfull);
  buffer[in] = x;
  printf("@@@ %d INSERT buf[%d] := %d\n",_pid,in,x);
  bempty = false;
  bfull = (in == out);
  in = NEXT(in);
  showbuffer();
}

byte cout;

inline extract() {
  assert(!bempty);
  out = NEXT(out);
  cout = buffer[out]; buffer[out] = 0;
  printf("@@@ %d **** EXTRACT cout := buf[%d] is %d\n",_pid,out,cout);
  bfull = false;
  bempty = (NEXT(out) == in)
  showbuffer();
}


// ====== Producer Model ======================================================

inline produce(p) {
  lock(mtx);
  assert(mtx.mid == _pid);
  do
  :: !bfull -> break;
  :: else -> wait(PRODCONDVAR,mtx);
  od
  assert(mtx.mid == _pid);
  insert(p);
  progress_prod:
  signal(CONSCONDVAR);
  assert(mtx.mid == _pid);
  unlock(mtx);
}


#define REPEAT 8
proctype producer(int pno) {
  int p=0;
  do
  :: produce(p+pno); p = p % REPEAT + 2
  // pno=1 generates 1,3,5,7,1,3,5,7,...
  // pno=2 generates 2,4,6,8,2,4,6,8,...
  od
}

// ====== Consumer Model ======================================================

inline consume() {
  lock(mtx);
  assert(mtx.mid == _pid);
  do
  :: !bempty -> break;
  :: else -> wait(CONSCONDVAR,mtx);
  od
  assert(mtx.mid == _pid);
  extract();
  progress_cons:
  signal(PRODCONDVAR);
  assert(mtx.mid == _pid);
  unlock(mtx);
}

proctype consumer() {
  do
  :: consume()
  od
}

// ====== MAINLINE ============================================================

init {
  int z;

  printf("A Model of pthreads\n")
  printf("\n Producer-Consumer example\n")
  zerobuffer()
  showbuffer()
  initsync()
  run producer(1)
  run producer(2)
  run consumer()
}
