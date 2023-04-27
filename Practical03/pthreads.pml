// pthreads.pml

// Task: modify lock, unlock, wait and signal to do the correct thing.

mtype = { unlocked, locked } ;

typedef mutexData {
  mtype mstate;
  byte mid;
  chan lockChan;
}

typedef condvarData {
  chan cstate;
  byte waiting;
}

mutexData mtx;

condvarData cvars[2];
#define PRODCONDVAR 0
#define CONSCONDVAR 1

inline initsync() {
  mtx.mstate = unlocked;
  mtx.lockChan = chan(1);
  cvars[0].cstate = chan(1);
  cvars[0].waiting = 0;
  cvars[1].cstate = chan(1);
  cvars[1].waiting = 0;
}

// pthread_mutex_lock(&m);
inline lock(m) {
  printf("@@@ %d LOCKING : state is %e\n",_pid,m.mstate)
  m.lockChan ? 1;
  m.mid = _pid;
  m.mstate = locked;
  printf("@@@ %d LOCKED : state is %e\n",_pid,m.mstate)
}

// pthread_mutex_unlock(&m);
inline unlock(m) {
  printf("@@@ %d UNLOCKING : state is %e\n",_pid,m.mstate)
  m.mstate = unlocked;
  m.mid = 255;
  m.lockChan ! 1;
  printf("@@@ %d UNLOCKED : state is %e\n",_pid,m.mstate)
}

// pthread_cond_wait(&c,&m);
inline wait(c,m) {
  printf("@@@ %d WAIT for cond[%d] with mutex=%e\n",_pid,c,m.mstate)
  unlock(m);
  cvars[c].waiting++;
  cvars[c].cstate ? 1;
  cvars[c].waiting--;
  lock(m);
  printf("@@@ %d DONE with cond[%d] with mutex=%e\n",_pid, c,m.mstate)
}

// pthread_cond_signal(&c);
inline signal(c) {
  printf("@@@ %d SIGNAL cond[%d]\n",_pid,c)
  if
  :: cvars[c].waiting > 0 -> cvars[c].cstate ! 1;
  :: else -> skip;
  fi;
  printf("@@@ %d SIGNALLED cond[%d]\n",_pid,c)
}
