// pthreads.pml

// Task: modify lock, unlock, wait and signal to do the correct thing.

mtype = { unlocked, locked } ;


typedef mutexData {
  mtype mstate;
  byte mid;
  // may need more fields here
}


typedef condvarData {
  mtype cstate;
  // may need different fields here
}

mutexData mtx;

condvarData cvars[2];
#define PRODCONDVAR 0
#define CONSCONDVAR 1

inline initsync() {
  mtx.mstate = unlocked;
  cvars[0].cstate = true;
  cvars[1].cstate = true;
  // may need more/different code to initialise fields here
}

// pthread_mutex_lock(&m);
inline lock(m) {
  printf("@@@ %d LOCKING : state is %e\n",_pid,m.mstate)
    do
    ::    atomic{m.mstate == unlocked -> m.mid = _pid; m.mstate = locked; break;}
    ::    else;
    od;
  printf("@@@ %d LOCKED : state is %e\n",_pid,m.mstate)
}

// pthread_mutex_unlock(&m);
inline unlock(m) {
  atomic{
    printf("@@@ %d UNLOCKING : state is %e\n",_pid,m.mstate)
    m.mstate = unlocked;
    m.mid = 255;
    printf("@@@ %d UNLOCKED : state is %e\n",_pid,m.mstate)
  }
}

// pthread_cond_wait(&c,&m);
inline wait(c,m) {
  printf("@@@ %d WAIT for cond[%d]=%d with mutex=%e\n",_pid,c, cvars[c].cstate,m.mstate)
  unlock(m);
  cvars[c].cstate = locked;
  do
  ::  atomic{cvars[c].cstate == unlocked -> lock(m); break;}
  ::  else;
  od;
  printf("@@@ %d DONE with cond[%d]=%d with mutex=%e\n",_pid, c,cvars[c].cstate,m.mstate)
}

// pthread_cond_signal(&c);
inline signal(c) {
  atomic{
    printf("@@@ %d SIGNAL cond[%d]=%d\n",_pid,c,cvars[c].cstate)
    cvars[c].cstate = unlocked;
    printf("@@@ %d SIGNALLED cond[%d]=%d\n",_pid,c,cvars[c].cstate)
  }
}
