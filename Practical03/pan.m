#define rand	pan_rand
#define pthread_equal(a,b)	((a)==(b))
#if defined(HAS_CODE) && defined(VERBOSE)
	#ifdef BFS_PAR
		bfs_printf("Pr: %d Tr: %d\n", II, t->forw);
	#else
		cpu_printf("Pr: %d Tr: %d\n", II, t->forw);
	#endif
#endif
	switch (t->forw) {
	default: Uerror("bad forward move");
	case 0:	/* if without executable clauses */
		continue;
	case 1: /* generic 'goto' or 'skip' */
		IfNotBlocked
		_m = 3; goto P999;
	case 2: /* generic 'else' */
		IfNotBlocked
		if (trpt->o_pm&1) continue;
		_m = 3; goto P999;

		 /* PROC :init: */
	case 3: // STATE 1 - writers-and-reader.pml:121 - [printf('A Model of pthreads\\n')] (0:17:0 - 1)
		IfNotBlocked
		reached[2][1] = 1;
		Printf("A Model of pthreads\n");
		/* merge: printf('\\n Producer-Consumer example\\n')(17, 2, 17) */
		reached[2][2] = 1;
		Printf("\n Producer-Consumer example\n");
		_m = 3; goto P999; /* 1 */
	case 4: // STATE 3 - writers-and-reader.pml:16 - [in = 0] (0:0:1 - 1)
		IfNotBlocked
		reached[2][3] = 1;
		(trpt+1)->bup.oval = ((int)now.in);
		now.in = 0;
#ifdef VAR_RANGES
		logval("in", ((int)now.in));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 5: // STATE 4 - writers-and-reader.pml:18 - [((in<4))] (0:0:0 - 1)
		IfNotBlocked
		reached[2][4] = 1;
		if (!((((int)now.in)<4)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 6: // STATE 5 - writers-and-reader.pml:18 - [buffer[in] = 0] (0:0:1 - 1)
		IfNotBlocked
		reached[2][5] = 1;
		(trpt+1)->bup.oval = ((int)now.buffer[ Index(((int)now.in), 4) ]);
		now.buffer[ Index(now.in, 4) ] = 0;
#ifdef VAR_RANGES
		logval("buffer[in]", ((int)now.buffer[ Index(((int)now.in), 4) ]));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 7: // STATE 6 - writers-and-reader.pml:18 - [in = (in+1)] (0:0:1 - 1)
		IfNotBlocked
		reached[2][6] = 1;
		(trpt+1)->bup.oval = ((int)now.in);
		now.in = (((int)now.in)+1);
#ifdef VAR_RANGES
		logval("in", ((int)now.in));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 8: // STATE 8 - writers-and-reader.pml:19 - [in = 0] (0:0:1 - 1)
		IfNotBlocked
		reached[2][8] = 1;
		(trpt+1)->bup.oval = ((int)now.in);
		now.in = 0;
#ifdef VAR_RANGES
		logval("in", ((int)now.in));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 9: // STATE 13 - writers-and-reader.pml:21 - [out = (4-1)] (0:0:1 - 3)
		IfNotBlocked
		reached[2][13] = 1;
		(trpt+1)->bup.oval = ((int)now.out);
		now.out = (4-1);
#ifdef VAR_RANGES
		logval("out", ((int)now.out));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 10: // STATE 14 - writers-and-reader.pml:22 - [bfull = 0] (0:0:1 - 1)
		IfNotBlocked
		reached[2][14] = 1;
		(trpt+1)->bup.oval = ((int)now.bfull);
		now.bfull = 0;
#ifdef VAR_RANGES
		logval("bfull", ((int)now.bfull));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 11: // STATE 15 - writers-and-reader.pml:22 - [bempty = 1] (0:0:1 - 1)
		IfNotBlocked
		reached[2][15] = 1;
		(trpt+1)->bup.oval = ((int)now.bempty);
		now.bempty = 1;
#ifdef VAR_RANGES
		logval("bempty", ((int)now.bempty));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 12: // STATE 16 - writers-and-reader.pml:23 - [printf('buffer zeroed\\n')] (0:0:0 - 1)
		IfNotBlocked
		reached[2][16] = 1;
		Printf("buffer zeroed\n");
		_m = 3; goto P999; /* 0 */
	case 13: // STATE 18 - writers-and-reader.pml:30 - [printf('@@@ %d BUFFER in:%d, out:%d, empty:%d, full:%d [|',_pid,in,out,bempty,bfull)] (0:26:1 - 1)
		IfNotBlocked
		reached[2][18] = 1;
		Printf("@@@ %d BUFFER in:%d, out:%d, empty:%d, full:%d [|", ((int)((P2 *)_this)->_pid), ((int)now.in), ((int)now.out), ((int)now.bempty), ((int)now.bfull));
		/* merge: six = 0(26, 19, 26) */
		reached[2][19] = 1;
		(trpt+1)->bup.oval = ((int)now.six);
		now.six = 0;
#ifdef VAR_RANGES
		logval("six", ((int)now.six));
#endif
		;
		/* merge: .(goto)(0, 27, 26) */
		reached[2][27] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 14: // STATE 20 - writers-and-reader.pml:33 - [((six<4))] (26:0:1 - 1)
		IfNotBlocked
		reached[2][20] = 1;
		if (!((((int)now.six)<4)))
			continue;
		/* merge: printf(' %d |',buffer[six])(26, 21, 26) */
		reached[2][21] = 1;
		Printf(" %d |", ((int)now.buffer[ Index(((int)now.six), 4) ]));
		/* merge: six = (six+1)(26, 22, 26) */
		reached[2][22] = 1;
		(trpt+1)->bup.oval = ((int)now.six);
		now.six = (((int)now.six)+1);
#ifdef VAR_RANGES
		logval("six", ((int)now.six));
#endif
		;
		/* merge: .(goto)(0, 27, 26) */
		reached[2][27] = 1;
		;
		_m = 3; goto P999; /* 3 */
	case 15: // STATE 24 - writers-and-reader.pml:34 - [printf(']\\n')] (0:28:0 - 1)
		IfNotBlocked
		reached[2][24] = 1;
		Printf("]\n");
		/* merge: goto :b13(28, 25, 28) */
		reached[2][25] = 1;
		;
		_m = 3; goto P999; /* 1 */
	case 16: // STATE 31 - pthreads.pml:27 - [mtx.mstate = unlocked] (0:0:1 - 1)
		IfNotBlocked
		reached[2][31] = 1;
		(trpt+1)->bup.oval = now.mtx.mstate;
		now.mtx.mstate = 2;
#ifdef VAR_RANGES
		logval("mtx.mstate", now.mtx.mstate);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 17: // STATE 32 - pthreads.pml:28 - [cvars[0].cstate = 1] (0:0:1 - 1)
		IfNotBlocked
		reached[2][32] = 1;
		(trpt+1)->bup.oval = now.cvars[0].cstate;
		now.cvars[0].cstate = 1;
#ifdef VAR_RANGES
		logval("cvars[0].cstate", now.cvars[0].cstate);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 18: // STATE 33 - pthreads.pml:29 - [cvars[1].cstate = 1] (0:0:1 - 1)
		IfNotBlocked
		reached[2][33] = 1;
		(trpt+1)->bup.oval = now.cvars[1].cstate;
		now.cvars[1].cstate = 1;
#ifdef VAR_RANGES
		logval("cvars[1].cstate", now.cvars[1].cstate);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 19: // STATE 35 - writers-and-reader.pml:126 - [(run producer(1))] (0:0:0 - 1)
		IfNotBlocked
		reached[2][35] = 1;
		if (!(addproc(II, 1, 0, 1)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 20: // STATE 36 - writers-and-reader.pml:127 - [(run producer(2))] (0:0:0 - 1)
		IfNotBlocked
		reached[2][36] = 1;
		if (!(addproc(II, 1, 0, 2)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 21: // STATE 37 - writers-and-reader.pml:128 - [(run consumer())] (0:0:0 - 1)
		IfNotBlocked
		reached[2][37] = 1;
		if (!(addproc(II, 1, 1, 0)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 22: // STATE 38 - writers-and-reader.pml:129 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[2][38] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC consumer */
	case 23: // STATE 1 - pthreads.pml:35 - [printf('@@@ %d LOCKING : state is %e\\n',_pid,mtx.mstate)] (0:0:0 - 1)
		IfNotBlocked
		reached[1][1] = 1;
		Printf("@@@ %d LOCKING : state is %e\n", ((int)((P1 *)_this)->_pid), now.mtx.mstate);
		_m = 3; goto P999; /* 0 */
	case 24: // STATE 2 - pthreads.pml:37 - [((mtx.mstate==unlocked))] (11:0:2 - 1)
		IfNotBlocked
		reached[1][2] = 1;
		if (!((now.mtx.mstate==2)))
			continue;
		/* merge: mtx.mid = _pid(11, 3, 11) */
		reached[1][3] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((int)now.mtx.mid);
		now.mtx.mid = ((int)((P1 *)_this)->_pid);
#ifdef VAR_RANGES
		logval("mtx.mid", ((int)now.mtx.mid));
#endif
		;
		/* merge: mtx.mstate = locked(11, 4, 11) */
		reached[1][4] = 1;
		(trpt+1)->bup.ovals[1] = now.mtx.mstate;
		now.mtx.mstate = 1;
#ifdef VAR_RANGES
		logval("mtx.mstate", now.mtx.mstate);
#endif
		;
		/* merge: goto :b7(11, 5, 11) */
		reached[1][5] = 1;
		;
		_m = 3; goto P999; /* 3 */
	case 25: // STATE 11 - pthreads.pml:40 - [printf('@@@ %d LOCKED : state is %e\\n',_pid,mtx.mstate)] (0:0:0 - 2)
		IfNotBlocked
		reached[1][11] = 1;
		Printf("@@@ %d LOCKED : state is %e\n", ((int)((P1 *)_this)->_pid), now.mtx.mstate);
		_m = 3; goto P999; /* 0 */
	case 26: // STATE 13 - writers-and-reader.pml:97 - [assert((mtx.mid==_pid))] (0:0:0 - 1)
		IfNotBlocked
		reached[1][13] = 1;
		spin_assert((((int)now.mtx.mid)==((int)((P1 *)_this)->_pid)), "(mtx.mid==_pid)", II, tt, t);
		_m = 3; goto P999; /* 0 */
	case 27: // STATE 14 - writers-and-reader.pml:99 - [(!(bempty))] (0:0:0 - 1)
		IfNotBlocked
		reached[1][14] = 1;
		if (!( !(((int)now.bempty))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 28: // STATE 17 - pthreads.pml:55 - [printf('@@@ %d WAIT for cond[%d]=%d with mutex=%e\\n',_pid,1,cvars[1].cstate,mtx.mstate)] (0:0:0 - 1)
		IfNotBlocked
		reached[1][17] = 1;
		Printf("@@@ %d WAIT for cond[%d]=%d with mutex=%e\n", ((int)((P1 *)_this)->_pid), 1, now.cvars[1].cstate, now.mtx.mstate);
		_m = 3; goto P999; /* 0 */
	case 29: // STATE 18 - pthreads.pml:46 - [printf('@@@ %d UNLOCKING : state is %e\\n',_pid,mtx.mstate)] (0:24:2 - 1)
		IfNotBlocked
		reached[1][18] = 1;
		Printf("@@@ %d UNLOCKING : state is %e\n", ((int)((P1 *)_this)->_pid), now.mtx.mstate);
		/* merge: mtx.mstate = unlocked(24, 19, 24) */
		reached[1][19] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = now.mtx.mstate;
		now.mtx.mstate = 2;
#ifdef VAR_RANGES
		logval("mtx.mstate", now.mtx.mstate);
#endif
		;
		/* merge: mtx.mid = 255(24, 20, 24) */
		reached[1][20] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.mtx.mid);
		now.mtx.mid = 255;
#ifdef VAR_RANGES
		logval("mtx.mid", ((int)now.mtx.mid));
#endif
		;
		/* merge: printf('@@@ %d UNLOCKED : state is %e\\n',_pid,mtx.mstate)(24, 21, 24) */
		reached[1][21] = 1;
		Printf("@@@ %d UNLOCKED : state is %e\n", ((int)((P1 *)_this)->_pid), now.mtx.mstate);
		_m = 3; goto P999; /* 3 */
	case 30: // STATE 24 - pthreads.pml:57 - [cvars[1].cstate = locked] (0:0:1 - 1)
		IfNotBlocked
		reached[1][24] = 1;
		(trpt+1)->bup.oval = now.cvars[1].cstate;
		now.cvars[1].cstate = 1;
#ifdef VAR_RANGES
		logval("cvars[1].cstate", now.cvars[1].cstate);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 31: // STATE 25 - pthreads.pml:59 - [((cvars[1].cstate==unlocked))] (0:0:0 - 1)
		IfNotBlocked
		reached[1][25] = 1;
		if (!((now.cvars[1].cstate==2)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 32: // STATE 26 - pthreads.pml:35 - [printf('@@@ %d LOCKING : state is %e\\n',_pid,mtx.mstate)] (0:0:0 - 1)
		IfNotBlocked
		reached[1][26] = 1;
		Printf("@@@ %d LOCKING : state is %e\n", ((int)((P1 *)_this)->_pid), now.mtx.mstate);
		_m = 3; goto P999; /* 0 */
	case 33: // STATE 27 - pthreads.pml:37 - [((mtx.mstate==unlocked))] (44:0:2 - 1)
		IfNotBlocked
		reached[1][27] = 1;
		if (!((now.mtx.mstate==2)))
			continue;
		/* merge: mtx.mid = _pid(44, 28, 44) */
		reached[1][28] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((int)now.mtx.mid);
		now.mtx.mid = ((int)((P1 *)_this)->_pid);
#ifdef VAR_RANGES
		logval("mtx.mid", ((int)now.mtx.mid));
#endif
		;
		/* merge: mtx.mstate = locked(44, 29, 44) */
		reached[1][29] = 1;
		(trpt+1)->bup.ovals[1] = now.mtx.mstate;
		now.mtx.mstate = 1;
#ifdef VAR_RANGES
		logval("mtx.mstate", now.mtx.mstate);
#endif
		;
		/* merge: goto :b10(44, 30, 44) */
		reached[1][30] = 1;
		;
		/* merge: printf('@@@ %d LOCKED : state is %e\\n',_pid,mtx.mstate)(44, 36, 44) */
		reached[1][36] = 1;
		Printf("@@@ %d LOCKED : state is %e\n", ((int)((P1 *)_this)->_pid), now.mtx.mstate);
		/* merge: goto :b9(44, 38, 44) */
		reached[1][38] = 1;
		;
		_m = 3; goto P999; /* 5 */
	case 34: // STATE 36 - pthreads.pml:40 - [printf('@@@ %d LOCKED : state is %e\\n',_pid,mtx.mstate)] (0:44:0 - 3)
		IfNotBlocked
		reached[1][36] = 1;
		Printf("@@@ %d LOCKED : state is %e\n", ((int)((P1 *)_this)->_pid), now.mtx.mstate);
		/* merge: goto :b9(44, 38, 44) */
		reached[1][38] = 1;
		;
		_m = 3; goto P999; /* 1 */
	case 35: // STATE 44 - pthreads.pml:62 - [printf('@@@ %d DONE with cond[%d]=%d with mutex=%e\\n',_pid,1,cvars[1].cstate,mtx.mstate)] (0:0:0 - 2)
		IfNotBlocked
		reached[1][44] = 1;
		Printf("@@@ %d DONE with cond[%d]=%d with mutex=%e\n", ((int)((P1 *)_this)->_pid), 1, now.cvars[1].cstate, now.mtx.mstate);
		_m = 3; goto P999; /* 0 */
	case 36: // STATE 49 - writers-and-reader.pml:102 - [assert((mtx.mid==_pid))] (0:0:0 - 3)
		IfNotBlocked
		reached[1][49] = 1;
		spin_assert((((int)now.mtx.mid)==((int)((P1 *)_this)->_pid)), "(mtx.mid==_pid)", II, tt, t);
		_m = 3; goto P999; /* 0 */
	case 37: // STATE 50 - writers-and-reader.pml:54 - [assert(!(bempty))] (0:0:0 - 1)
		IfNotBlocked
		reached[1][50] = 1;
		spin_assert( !(((int)now.bempty)), " !(bempty)", II, tt, t);
		_m = 3; goto P999; /* 0 */
	case 38: // STATE 51 - writers-and-reader.pml:55 - [out = ((out+1)%4)] (0:0:1 - 1)
		IfNotBlocked
		reached[1][51] = 1;
		(trpt+1)->bup.oval = ((int)now.out);
		now.out = ((((int)now.out)+1)%4);
#ifdef VAR_RANGES
		logval("out", ((int)now.out));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 39: // STATE 52 - writers-and-reader.pml:56 - [cout = buffer[out]] (0:0:1 - 1)
		IfNotBlocked
		reached[1][52] = 1;
		(trpt+1)->bup.oval = ((int)cout);
		cout = ((int)now.buffer[ Index(((int)now.out), 4) ]);
#ifdef VAR_RANGES
		logval("cout", ((int)cout));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 40: // STATE 53 - writers-and-reader.pml:56 - [buffer[out] = 0] (0:0:1 - 1)
		IfNotBlocked
		reached[1][53] = 1;
		(trpt+1)->bup.oval = ((int)now.buffer[ Index(((int)now.out), 4) ]);
		now.buffer[ Index(now.out, 4) ] = 0;
#ifdef VAR_RANGES
		logval("buffer[out]", ((int)now.buffer[ Index(((int)now.out), 4) ]));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 41: // STATE 54 - writers-and-reader.pml:57 - [printf('@@@ %d **** EXTRACT cout := buf[%d] is %d\\n',_pid,out,cout)] (0:0:0 - 1)
		IfNotBlocked
		reached[1][54] = 1;
		Printf("@@@ %d **** EXTRACT cout := buf[%d] is %d\n", ((int)((P1 *)_this)->_pid), ((int)now.out), ((int)cout));
		_m = 3; goto P999; /* 0 */
	case 42: // STATE 55 - writers-and-reader.pml:58 - [bfull = 0] (0:0:1 - 1)
		IfNotBlocked
		reached[1][55] = 1;
		(trpt+1)->bup.oval = ((int)now.bfull);
		now.bfull = 0;
#ifdef VAR_RANGES
		logval("bfull", ((int)now.bfull));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 43: // STATE 56 - writers-and-reader.pml:59 - [bempty = (((out+1)%4)==in)] (0:0:1 - 1)
		IfNotBlocked
		reached[1][56] = 1;
		(trpt+1)->bup.oval = ((int)now.bempty);
		now.bempty = (((((int)now.out)+1)%4)==((int)now.in));
#ifdef VAR_RANGES
		logval("bempty", ((int)now.bempty));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 44: // STATE 57 - writers-and-reader.pml:30 - [printf('@@@ %d BUFFER in:%d, out:%d, empty:%d, full:%d [|',_pid,in,out,bempty,bfull)] (0:65:1 - 1)
		IfNotBlocked
		reached[1][57] = 1;
		Printf("@@@ %d BUFFER in:%d, out:%d, empty:%d, full:%d [|", ((int)((P1 *)_this)->_pid), ((int)now.in), ((int)now.out), ((int)now.bempty), ((int)now.bfull));
		/* merge: six = 0(65, 58, 65) */
		reached[1][58] = 1;
		(trpt+1)->bup.oval = ((int)now.six);
		now.six = 0;
#ifdef VAR_RANGES
		logval("six", ((int)now.six));
#endif
		;
		/* merge: .(goto)(0, 66, 65) */
		reached[1][66] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 45: // STATE 59 - writers-and-reader.pml:33 - [((six<4))] (65:0:1 - 1)
		IfNotBlocked
		reached[1][59] = 1;
		if (!((((int)now.six)<4)))
			continue;
		/* merge: printf(' %d |',buffer[six])(65, 60, 65) */
		reached[1][60] = 1;
		Printf(" %d |", ((int)now.buffer[ Index(((int)now.six), 4) ]));
		/* merge: six = (six+1)(65, 61, 65) */
		reached[1][61] = 1;
		(trpt+1)->bup.oval = ((int)now.six);
		now.six = (((int)now.six)+1);
#ifdef VAR_RANGES
		logval("six", ((int)now.six));
#endif
		;
		/* merge: .(goto)(0, 66, 65) */
		reached[1][66] = 1;
		;
		_m = 3; goto P999; /* 3 */
	case 46: // STATE 63 - writers-and-reader.pml:34 - [printf(']\\n')] (0:67:0 - 1)
		IfNotBlocked
		reached[1][63] = 1;
		Printf("]\n");
		/* merge: goto :b11(67, 64, 67) */
		reached[1][64] = 1;
		;
		_m = 3; goto P999; /* 1 */
	case 47: // STATE 71 - pthreads.pml:68 - [printf('@@@ %d SIGNAL cond[%d]=%d\\n',_pid,0,cvars[0].cstate)] (0:76:1 - 1)
		IfNotBlocked
		reached[1][71] = 1;
		Printf("@@@ %d SIGNAL cond[%d]=%d\n", ((int)((P1 *)_this)->_pid), 0, now.cvars[0].cstate);
		/* merge: cvars[0].cstate = unlocked(76, 72, 76) */
		reached[1][72] = 1;
		(trpt+1)->bup.oval = now.cvars[0].cstate;
		now.cvars[0].cstate = 2;
#ifdef VAR_RANGES
		logval("cvars[0].cstate", now.cvars[0].cstate);
#endif
		;
		/* merge: printf('@@@ %d SIGNALLED cond[%d]=%d\\n',_pid,0,cvars[0].cstate)(76, 73, 76) */
		reached[1][73] = 1;
		Printf("@@@ %d SIGNALLED cond[%d]=%d\n", ((int)((P1 *)_this)->_pid), 0, now.cvars[0].cstate);
		_m = 3; goto P999; /* 2 */
	case 48: // STATE 76 - writers-and-reader.pml:106 - [assert((mtx.mid==_pid))] (0:0:0 - 1)
		IfNotBlocked
		reached[1][76] = 1;
		spin_assert((((int)now.mtx.mid)==((int)((P1 *)_this)->_pid)), "(mtx.mid==_pid)", II, tt, t);
		_m = 3; goto P999; /* 0 */
	case 49: // STATE 77 - pthreads.pml:46 - [printf('@@@ %d UNLOCKING : state is %e\\n',_pid,mtx.mstate)] (0:84:2 - 1)
		IfNotBlocked
		reached[1][77] = 1;
		Printf("@@@ %d UNLOCKING : state is %e\n", ((int)((P1 *)_this)->_pid), now.mtx.mstate);
		/* merge: mtx.mstate = unlocked(84, 78, 84) */
		reached[1][78] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = now.mtx.mstate;
		now.mtx.mstate = 2;
#ifdef VAR_RANGES
		logval("mtx.mstate", now.mtx.mstate);
#endif
		;
		/* merge: mtx.mid = 255(84, 79, 84) */
		reached[1][79] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.mtx.mid);
		now.mtx.mid = 255;
#ifdef VAR_RANGES
		logval("mtx.mid", ((int)now.mtx.mid));
#endif
		;
		/* merge: printf('@@@ %d UNLOCKED : state is %e\\n',_pid,mtx.mstate)(84, 80, 84) */
		reached[1][80] = 1;
		Printf("@@@ %d UNLOCKED : state is %e\n", ((int)((P1 *)_this)->_pid), now.mtx.mstate);
		/* merge: .(goto)(0, 85, 84) */
		reached[1][85] = 1;
		;
		_m = 3; goto P999; /* 4 */
	case 50: // STATE 87 - writers-and-reader.pml:114 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[1][87] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC producer */
	case 51: // STATE 1 - pthreads.pml:35 - [printf('@@@ %d LOCKING : state is %e\\n',_pid,mtx.mstate)] (0:0:0 - 1)
		IfNotBlocked
		reached[0][1] = 1;
		Printf("@@@ %d LOCKING : state is %e\n", ((int)((P0 *)_this)->_pid), now.mtx.mstate);
		_m = 3; goto P999; /* 0 */
	case 52: // STATE 2 - pthreads.pml:37 - [((mtx.mstate==unlocked))] (11:0:2 - 1)
		IfNotBlocked
		reached[0][2] = 1;
		if (!((now.mtx.mstate==2)))
			continue;
		/* merge: mtx.mid = _pid(11, 3, 11) */
		reached[0][3] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((int)now.mtx.mid);
		now.mtx.mid = ((int)((P0 *)_this)->_pid);
#ifdef VAR_RANGES
		logval("mtx.mid", ((int)now.mtx.mid));
#endif
		;
		/* merge: mtx.mstate = locked(11, 4, 11) */
		reached[0][4] = 1;
		(trpt+1)->bup.ovals[1] = now.mtx.mstate;
		now.mtx.mstate = 1;
#ifdef VAR_RANGES
		logval("mtx.mstate", now.mtx.mstate);
#endif
		;
		/* merge: goto :b1(11, 5, 11) */
		reached[0][5] = 1;
		;
		_m = 3; goto P999; /* 3 */
	case 53: // STATE 11 - pthreads.pml:40 - [printf('@@@ %d LOCKED : state is %e\\n',_pid,mtx.mstate)] (0:0:0 - 2)
		IfNotBlocked
		reached[0][11] = 1;
		Printf("@@@ %d LOCKED : state is %e\n", ((int)((P0 *)_this)->_pid), now.mtx.mstate);
		_m = 3; goto P999; /* 0 */
	case 54: // STATE 13 - writers-and-reader.pml:68 - [printf('Lock was exited by process %d\\n',_pid)] (0:0:0 - 1)
		IfNotBlocked
		reached[0][13] = 1;
		Printf("Lock was exited by process %d\n", ((int)((P0 *)_this)->_pid));
		_m = 3; goto P999; /* 0 */
	case 55: // STATE 14 - writers-and-reader.pml:69 - [assert((mtx.mid==_pid))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][14] = 1;
		spin_assert((((int)now.mtx.mid)==((int)((P0 *)_this)->_pid)), "(mtx.mid==_pid)", II, tt, t);
		_m = 3; goto P999; /* 0 */
	case 56: // STATE 15 - writers-and-reader.pml:71 - [(!(bfull))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][15] = 1;
		if (!( !(((int)now.bfull))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 57: // STATE 18 - pthreads.pml:55 - [printf('@@@ %d WAIT for cond[%d]=%d with mutex=%e\\n',_pid,0,cvars[0].cstate,mtx.mstate)] (0:0:0 - 1)
		IfNotBlocked
		reached[0][18] = 1;
		Printf("@@@ %d WAIT for cond[%d]=%d with mutex=%e\n", ((int)((P0 *)_this)->_pid), 0, now.cvars[0].cstate, now.mtx.mstate);
		_m = 3; goto P999; /* 0 */
	case 58: // STATE 19 - pthreads.pml:46 - [printf('@@@ %d UNLOCKING : state is %e\\n',_pid,mtx.mstate)] (0:25:2 - 1)
		IfNotBlocked
		reached[0][19] = 1;
		Printf("@@@ %d UNLOCKING : state is %e\n", ((int)((P0 *)_this)->_pid), now.mtx.mstate);
		/* merge: mtx.mstate = unlocked(25, 20, 25) */
		reached[0][20] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = now.mtx.mstate;
		now.mtx.mstate = 2;
#ifdef VAR_RANGES
		logval("mtx.mstate", now.mtx.mstate);
#endif
		;
		/* merge: mtx.mid = 255(25, 21, 25) */
		reached[0][21] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.mtx.mid);
		now.mtx.mid = 255;
#ifdef VAR_RANGES
		logval("mtx.mid", ((int)now.mtx.mid));
#endif
		;
		/* merge: printf('@@@ %d UNLOCKED : state is %e\\n',_pid,mtx.mstate)(25, 22, 25) */
		reached[0][22] = 1;
		Printf("@@@ %d UNLOCKED : state is %e\n", ((int)((P0 *)_this)->_pid), now.mtx.mstate);
		_m = 3; goto P999; /* 3 */
	case 59: // STATE 25 - pthreads.pml:57 - [cvars[0].cstate = locked] (0:0:1 - 1)
		IfNotBlocked
		reached[0][25] = 1;
		(trpt+1)->bup.oval = now.cvars[0].cstate;
		now.cvars[0].cstate = 1;
#ifdef VAR_RANGES
		logval("cvars[0].cstate", now.cvars[0].cstate);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 60: // STATE 26 - pthreads.pml:59 - [((cvars[0].cstate==unlocked))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][26] = 1;
		if (!((now.cvars[0].cstate==2)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 61: // STATE 27 - pthreads.pml:35 - [printf('@@@ %d LOCKING : state is %e\\n',_pid,mtx.mstate)] (0:0:0 - 1)
		IfNotBlocked
		reached[0][27] = 1;
		Printf("@@@ %d LOCKING : state is %e\n", ((int)((P0 *)_this)->_pid), now.mtx.mstate);
		_m = 3; goto P999; /* 0 */
	case 62: // STATE 28 - pthreads.pml:37 - [((mtx.mstate==unlocked))] (45:0:2 - 1)
		IfNotBlocked
		reached[0][28] = 1;
		if (!((now.mtx.mstate==2)))
			continue;
		/* merge: mtx.mid = _pid(45, 29, 45) */
		reached[0][29] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((int)now.mtx.mid);
		now.mtx.mid = ((int)((P0 *)_this)->_pid);
#ifdef VAR_RANGES
		logval("mtx.mid", ((int)now.mtx.mid));
#endif
		;
		/* merge: mtx.mstate = locked(45, 30, 45) */
		reached[0][30] = 1;
		(trpt+1)->bup.ovals[1] = now.mtx.mstate;
		now.mtx.mstate = 1;
#ifdef VAR_RANGES
		logval("mtx.mstate", now.mtx.mstate);
#endif
		;
		/* merge: goto :b4(45, 31, 45) */
		reached[0][31] = 1;
		;
		/* merge: printf('@@@ %d LOCKED : state is %e\\n',_pid,mtx.mstate)(45, 37, 45) */
		reached[0][37] = 1;
		Printf("@@@ %d LOCKED : state is %e\n", ((int)((P0 *)_this)->_pid), now.mtx.mstate);
		/* merge: goto :b3(45, 39, 45) */
		reached[0][39] = 1;
		;
		_m = 3; goto P999; /* 5 */
	case 63: // STATE 37 - pthreads.pml:40 - [printf('@@@ %d LOCKED : state is %e\\n',_pid,mtx.mstate)] (0:45:0 - 3)
		IfNotBlocked
		reached[0][37] = 1;
		Printf("@@@ %d LOCKED : state is %e\n", ((int)((P0 *)_this)->_pid), now.mtx.mstate);
		/* merge: goto :b3(45, 39, 45) */
		reached[0][39] = 1;
		;
		_m = 3; goto P999; /* 1 */
	case 64: // STATE 45 - pthreads.pml:62 - [printf('@@@ %d DONE with cond[%d]=%d with mutex=%e\\n',_pid,0,cvars[0].cstate,mtx.mstate)] (0:0:0 - 2)
		IfNotBlocked
		reached[0][45] = 1;
		Printf("@@@ %d DONE with cond[%d]=%d with mutex=%e\n", ((int)((P0 *)_this)->_pid), 0, now.cvars[0].cstate, now.mtx.mstate);
		_m = 3; goto P999; /* 0 */
	case 65: // STATE 50 - writers-and-reader.pml:74 - [assert((mtx.mid==_pid))] (0:0:0 - 3)
		IfNotBlocked
		reached[0][50] = 1;
		spin_assert((((int)now.mtx.mid)==((int)((P0 *)_this)->_pid)), "(mtx.mid==_pid)", II, tt, t);
		_m = 3; goto P999; /* 0 */
	case 66: // STATE 51 - writers-and-reader.pml:42 - [assert(!(bfull))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][51] = 1;
		spin_assert( !(((int)now.bfull)), " !(bfull)", II, tt, t);
		_m = 3; goto P999; /* 0 */
	case 67: // STATE 52 - writers-and-reader.pml:43 - [buffer[in] = (p+pno)] (0:0:1 - 1)
		IfNotBlocked
		reached[0][52] = 1;
		(trpt+1)->bup.oval = ((int)now.buffer[ Index(((int)now.in), 4) ]);
		now.buffer[ Index(now.in, 4) ] = (((P0 *)_this)->p+((P0 *)_this)->pno);
#ifdef VAR_RANGES
		logval("buffer[in]", ((int)now.buffer[ Index(((int)now.in), 4) ]));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 68: // STATE 53 - writers-and-reader.pml:44 - [printf('@@@ %d INSERT buf[%d] := %d\\n',_pid,in,(p+pno))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][53] = 1;
		Printf("@@@ %d INSERT buf[%d] := %d\n", ((int)((P0 *)_this)->_pid), ((int)now.in), (((P0 *)_this)->p+((P0 *)_this)->pno));
		_m = 3; goto P999; /* 0 */
	case 69: // STATE 54 - writers-and-reader.pml:45 - [bempty = 0] (0:0:1 - 1)
		IfNotBlocked
		reached[0][54] = 1;
		(trpt+1)->bup.oval = ((int)now.bempty);
		now.bempty = 0;
#ifdef VAR_RANGES
		logval("bempty", ((int)now.bempty));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 70: // STATE 55 - writers-and-reader.pml:46 - [bfull = (in==out)] (0:0:1 - 1)
		IfNotBlocked
		reached[0][55] = 1;
		(trpt+1)->bup.oval = ((int)now.bfull);
		now.bfull = (((int)now.in)==((int)now.out));
#ifdef VAR_RANGES
		logval("bfull", ((int)now.bfull));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 71: // STATE 56 - writers-and-reader.pml:47 - [in = ((in+1)%4)] (0:0:1 - 1)
		IfNotBlocked
		reached[0][56] = 1;
		(trpt+1)->bup.oval = ((int)now.in);
		now.in = ((((int)now.in)+1)%4);
#ifdef VAR_RANGES
		logval("in", ((int)now.in));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 72: // STATE 57 - writers-and-reader.pml:30 - [printf('@@@ %d BUFFER in:%d, out:%d, empty:%d, full:%d [|',_pid,in,out,bempty,bfull)] (0:65:1 - 1)
		IfNotBlocked
		reached[0][57] = 1;
		Printf("@@@ %d BUFFER in:%d, out:%d, empty:%d, full:%d [|", ((int)((P0 *)_this)->_pid), ((int)now.in), ((int)now.out), ((int)now.bempty), ((int)now.bfull));
		/* merge: six = 0(65, 58, 65) */
		reached[0][58] = 1;
		(trpt+1)->bup.oval = ((int)now.six);
		now.six = 0;
#ifdef VAR_RANGES
		logval("six", ((int)now.six));
#endif
		;
		/* merge: .(goto)(0, 66, 65) */
		reached[0][66] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 73: // STATE 59 - writers-and-reader.pml:33 - [((six<4))] (65:0:1 - 1)
		IfNotBlocked
		reached[0][59] = 1;
		if (!((((int)now.six)<4)))
			continue;
		/* merge: printf(' %d |',buffer[six])(65, 60, 65) */
		reached[0][60] = 1;
		Printf(" %d |", ((int)now.buffer[ Index(((int)now.six), 4) ]));
		/* merge: six = (six+1)(65, 61, 65) */
		reached[0][61] = 1;
		(trpt+1)->bup.oval = ((int)now.six);
		now.six = (((int)now.six)+1);
#ifdef VAR_RANGES
		logval("six", ((int)now.six));
#endif
		;
		/* merge: .(goto)(0, 66, 65) */
		reached[0][66] = 1;
		;
		_m = 3; goto P999; /* 3 */
	case 74: // STATE 63 - writers-and-reader.pml:34 - [printf(']\\n')] (0:67:0 - 1)
		IfNotBlocked
		reached[0][63] = 1;
		Printf("]\n");
		/* merge: goto :b5(67, 64, 67) */
		reached[0][64] = 1;
		;
		_m = 3; goto P999; /* 1 */
	case 75: // STATE 71 - pthreads.pml:68 - [printf('@@@ %d SIGNAL cond[%d]=%d\\n',_pid,1,cvars[1].cstate)] (0:76:1 - 1)
		IfNotBlocked
		reached[0][71] = 1;
		Printf("@@@ %d SIGNAL cond[%d]=%d\n", ((int)((P0 *)_this)->_pid), 1, now.cvars[1].cstate);
		/* merge: cvars[1].cstate = unlocked(76, 72, 76) */
		reached[0][72] = 1;
		(trpt+1)->bup.oval = now.cvars[1].cstate;
		now.cvars[1].cstate = 2;
#ifdef VAR_RANGES
		logval("cvars[1].cstate", now.cvars[1].cstate);
#endif
		;
		/* merge: printf('@@@ %d SIGNALLED cond[%d]=%d\\n',_pid,1,cvars[1].cstate)(76, 73, 76) */
		reached[0][73] = 1;
		Printf("@@@ %d SIGNALLED cond[%d]=%d\n", ((int)((P0 *)_this)->_pid), 1, now.cvars[1].cstate);
		_m = 3; goto P999; /* 2 */
	case 76: // STATE 76 - writers-and-reader.pml:78 - [assert((mtx.mid==_pid))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][76] = 1;
		spin_assert((((int)now.mtx.mid)==((int)((P0 *)_this)->_pid)), "(mtx.mid==_pid)", II, tt, t);
		_m = 3; goto P999; /* 0 */
	case 77: // STATE 77 - pthreads.pml:46 - [printf('@@@ %d UNLOCKING : state is %e\\n',_pid,mtx.mstate)] (0:85:3 - 1)
		IfNotBlocked
		reached[0][77] = 1;
		Printf("@@@ %d UNLOCKING : state is %e\n", ((int)((P0 *)_this)->_pid), now.mtx.mstate);
		/* merge: mtx.mstate = unlocked(85, 78, 85) */
		reached[0][78] = 1;
		(trpt+1)->bup.ovals = grab_ints(3);
		(trpt+1)->bup.ovals[0] = now.mtx.mstate;
		now.mtx.mstate = 2;
#ifdef VAR_RANGES
		logval("mtx.mstate", now.mtx.mstate);
#endif
		;
		/* merge: mtx.mid = 255(85, 79, 85) */
		reached[0][79] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.mtx.mid);
		now.mtx.mid = 255;
#ifdef VAR_RANGES
		logval("mtx.mid", ((int)now.mtx.mid));
#endif
		;
		/* merge: printf('@@@ %d UNLOCKED : state is %e\\n',_pid,mtx.mstate)(85, 80, 85) */
		reached[0][80] = 1;
		Printf("@@@ %d UNLOCKED : state is %e\n", ((int)((P0 *)_this)->_pid), now.mtx.mstate);
		/* merge: p = ((p+2)%8)(85, 84, 85) */
		reached[0][84] = 1;
		(trpt+1)->bup.ovals[2] = ((P0 *)_this)->p;
		((P0 *)_this)->p = ((((P0 *)_this)->p+2)%8);
#ifdef VAR_RANGES
		logval("producer:p", ((P0 *)_this)->p);
#endif
		;
		/* merge: .(goto)(0, 86, 85) */
		reached[0][86] = 1;
		;
		_m = 3; goto P999; /* 5 */
	case 78: // STATE 88 - writers-and-reader.pml:91 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[0][88] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */
	case  _T5:	/* np_ */
		if (!((!(trpt->o_pm&4) && !(trpt->tau&128))))
			continue;
		/* else fall through */
	case  _T2:	/* true */
		_m = 3; goto P999;
#undef rand
	}

