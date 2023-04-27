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

		 /* PROC move */
	case 3: // STATE 1 - main.pml:27 - [((id>=3))] (0:0:0 - 1)
		IfNotBlocked
		reached[1][1] = 1;
		if (!((((P1 *)_this)->id>=3)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 4: // STATE 2 - main.pml:27 - [printf('\\nFROG%d (LEFT) STARTS AT %d',id,frogs[id])] (0:0:0 - 1)
		IfNotBlocked
		reached[1][2] = 1;
		Printf("\nFROG%d (LEFT) STARTS AT %d", ((P1 *)_this)->id, now.frogs[ Index(((P1 *)_this)->id, 5) ]);
		_m = 3; goto P999; /* 0 */
	case 5: // STATE 3 - main.pml:28 - [((id<3))] (0:0:0 - 1)
		IfNotBlocked
		reached[1][3] = 1;
		if (!((((P1 *)_this)->id<3)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 6: // STATE 4 - main.pml:28 - [printf('\\nFROG%d (RIGHT) STARTS AT %d',id,frogs[id])] (0:0:0 - 1)
		IfNotBlocked
		reached[1][4] = 1;
		Printf("\nFROG%d (RIGHT) STARTS AT %d", ((P1 *)_this)->id, now.frogs[ Index(((P1 *)_this)->id, 5) ]);
		_m = 3; goto P999; /* 0 */
	case 7: // STATE 7 - main.pml:33 - [(((id<3)&&(((frogs[0]-frogs[id])==2)||((frogs[0]-frogs[id])==1))))] (13:0:3 - 1)
		IfNotBlocked
		reached[1][7] = 1;
		if (!(((((P1 *)_this)->id<3)&&(((now.frogs[0]-now.frogs[ Index(((P1 *)_this)->id, 5) ])==2)||((now.frogs[0]-now.frogs[ Index(((P1 *)_this)->id, 5) ])==1)))))
			continue;
		/* merge: temp = frogs[0](13, 8, 13) */
		reached[1][8] = 1;
		(trpt+1)->bup.ovals = grab_ints(3);
		(trpt+1)->bup.ovals[0] = ((P1 *)_this)->temp;
		((P1 *)_this)->temp = now.frogs[0];
#ifdef VAR_RANGES
		logval("move:temp", ((P1 *)_this)->temp);
#endif
		;
		/* merge: frogs[0] = frogs[id](13, 9, 13) */
		reached[1][9] = 1;
		(trpt+1)->bup.ovals[1] = now.frogs[0];
		now.frogs[0] = now.frogs[ Index(((P1 *)_this)->id, 5) ];
#ifdef VAR_RANGES
		logval("frogs[0]", now.frogs[0]);
#endif
		;
		/* merge: frogs[id] = temp(13, 10, 13) */
		reached[1][10] = 1;
		(trpt+1)->bup.ovals[2] = now.frogs[ Index(((P1 *)_this)->id, 5) ];
		now.frogs[ Index(((P1 *)_this)->id, 5) ] = ((P1 *)_this)->temp;
#ifdef VAR_RANGES
		logval("frogs[move:id]", now.frogs[ Index(((P1 *)_this)->id, 5) ]);
#endif
		;
		/* merge: printf('\\nFROG%d FROM %d TO %d',id,frogs[0],frogs[id])(13, 11, 13) */
		reached[1][11] = 1;
		Printf("\nFROG%d FROM %d TO %d", ((P1 *)_this)->id, now.frogs[0], now.frogs[ Index(((P1 *)_this)->id, 5) ]);
		_m = 3; goto P999; /* 4 */
	case 8: // STATE 12 - main.pml:5 - [printf('\\nEMPTY %d, FROG1@%d, FROG2@%d, FROG3@%d, FROG4@%d',frogs[0],frogs[1],frogs[2],frogs[3],frogs[4])] (0:27:0 - 1)
		IfNotBlocked
		reached[1][12] = 1;
		Printf("\nEMPTY %d, FROG1@%d, FROG2@%d, FROG3@%d, FROG4@%d", now.frogs[0], now.frogs[1], now.frogs[2], now.frogs[3], now.frogs[4]);
		/* merge: .(goto)(27, 22, 27) */
		reached[1][22] = 1;
		;
		/* merge: .(goto)(0, 28, 27) */
		reached[1][28] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 9: // STATE 22 - main.pml:46 - [.(goto)] (0:27:0 - 2)
		IfNotBlocked
		reached[1][22] = 1;
		;
		/* merge: .(goto)(0, 28, 27) */
		reached[1][28] = 1;
		;
		_m = 3; goto P999; /* 1 */
	case 10: // STATE 14 - main.pml:39 - [(((id>=3)&&(((frogs[id]-frogs[0])==2)||((frogs[id]-frogs[0])==1))))] (20:0:3 - 1)
		IfNotBlocked
		reached[1][14] = 1;
		if (!(((((P1 *)_this)->id>=3)&&(((now.frogs[ Index(((P1 *)_this)->id, 5) ]-now.frogs[0])==2)||((now.frogs[ Index(((P1 *)_this)->id, 5) ]-now.frogs[0])==1)))))
			continue;
		/* merge: temp = frogs[0](20, 15, 20) */
		reached[1][15] = 1;
		(trpt+1)->bup.ovals = grab_ints(3);
		(trpt+1)->bup.ovals[0] = ((P1 *)_this)->temp;
		((P1 *)_this)->temp = now.frogs[0];
#ifdef VAR_RANGES
		logval("move:temp", ((P1 *)_this)->temp);
#endif
		;
		/* merge: frogs[0] = frogs[id](20, 16, 20) */
		reached[1][16] = 1;
		(trpt+1)->bup.ovals[1] = now.frogs[0];
		now.frogs[0] = now.frogs[ Index(((P1 *)_this)->id, 5) ];
#ifdef VAR_RANGES
		logval("frogs[0]", now.frogs[0]);
#endif
		;
		/* merge: frogs[id] = temp(20, 17, 20) */
		reached[1][17] = 1;
		(trpt+1)->bup.ovals[2] = now.frogs[ Index(((P1 *)_this)->id, 5) ];
		now.frogs[ Index(((P1 *)_this)->id, 5) ] = ((P1 *)_this)->temp;
#ifdef VAR_RANGES
		logval("frogs[move:id]", now.frogs[ Index(((P1 *)_this)->id, 5) ]);
#endif
		;
		/* merge: printf('\\nFROG%d FROM %d TO %d',id,frogs[0],frogs[id])(20, 18, 20) */
		reached[1][18] = 1;
		Printf("\nFROG%d FROM %d TO %d", ((P1 *)_this)->id, now.frogs[0], now.frogs[ Index(((P1 *)_this)->id, 5) ]);
		_m = 3; goto P999; /* 4 */
	case 11: // STATE 19 - main.pml:5 - [printf('\\nEMPTY %d, FROG1@%d, FROG2@%d, FROG3@%d, FROG4@%d',frogs[0],frogs[1],frogs[2],frogs[3],frogs[4])] (0:27:0 - 1)
		IfNotBlocked
		reached[1][19] = 1;
		Printf("\nEMPTY %d, FROG1@%d, FROG2@%d, FROG3@%d, FROG4@%d", now.frogs[0], now.frogs[1], now.frogs[2], now.frogs[3], now.frogs[4]);
		/* merge: .(goto)(27, 22, 27) */
		reached[1][22] = 1;
		;
		/* merge: .(goto)(0, 28, 27) */
		reached[1][28] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 12: // STATE 24 - main.pml:48 - [((((frogs[3]+frogs[4])==3)&&((frogs[1]+frogs[2])==9)))] (30:0:0 - 1)
		IfNotBlocked
		reached[1][24] = 1;
		if (!((((now.frogs[3]+now.frogs[4])==3)&&((now.frogs[1]+now.frogs[2])==9))))
			continue;
		/* merge: goto :b0(0, 25, 30) */
		reached[1][25] = 1;
		;
		_m = 3; goto P999; /* 1 */
	case 13: // STATE 30 - main.pml:52 - [-end-] (0:0:0 - 2)
		IfNotBlocked
		reached[1][30] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC :init: */
	case 14: // STATE 1 - main.pml:9 - [frogs[0] = 3] (0:0:1 - 1)
		IfNotBlocked
		reached[0][1] = 1;
		(trpt+1)->bup.oval = now.frogs[0];
		now.frogs[0] = 3;
#ifdef VAR_RANGES
		logval("frogs[0]", now.frogs[0]);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 15: // STATE 2 - main.pml:10 - [frogs[1] = 1] (0:0:1 - 1)
		IfNotBlocked
		reached[0][2] = 1;
		(trpt+1)->bup.oval = now.frogs[1];
		now.frogs[1] = 1;
#ifdef VAR_RANGES
		logval("frogs[1]", now.frogs[1]);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 16: // STATE 3 - main.pml:11 - [frogs[2] = 2] (0:0:1 - 1)
		IfNotBlocked
		reached[0][3] = 1;
		(trpt+1)->bup.oval = now.frogs[2];
		now.frogs[2] = 2;
#ifdef VAR_RANGES
		logval("frogs[2]", now.frogs[2]);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 17: // STATE 4 - main.pml:12 - [frogs[3] = 4] (0:0:1 - 1)
		IfNotBlocked
		reached[0][4] = 1;
		(trpt+1)->bup.oval = now.frogs[3];
		now.frogs[3] = 4;
#ifdef VAR_RANGES
		logval("frogs[3]", now.frogs[3]);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 18: // STATE 5 - main.pml:13 - [frogs[4] = 5] (0:0:1 - 1)
		IfNotBlocked
		reached[0][5] = 1;
		(trpt+1)->bup.oval = now.frogs[4];
		now.frogs[4] = 5;
#ifdef VAR_RANGES
		logval("frogs[4]", now.frogs[4]);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 19: // STATE 6 - main.pml:5 - [printf('\\nEMPTY %d, FROG1@%d, FROG2@%d, FROG3@%d, FROG4@%d',frogs[0],frogs[1],frogs[2],frogs[3],frogs[4])] (0:0:0 - 1)
		IfNotBlocked
		reached[0][6] = 1;
		Printf("\nEMPTY %d, FROG1@%d, FROG2@%d, FROG3@%d, FROG4@%d", now.frogs[0], now.frogs[1], now.frogs[2], now.frogs[3], now.frogs[4]);
		_m = 3; goto P999; /* 0 */
	case 20: // STATE 8 - main.pml:15 - [(run move(1))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][8] = 1;
		if (!(addproc(II, 1, 1, 1)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 21: // STATE 9 - main.pml:16 - [(run move(2))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][9] = 1;
		if (!(addproc(II, 1, 1, 2)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 22: // STATE 10 - main.pml:17 - [(run move(3))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][10] = 1;
		if (!(addproc(II, 1, 1, 3)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 23: // STATE 11 - main.pml:18 - [(run move(4))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][11] = 1;
		if (!(addproc(II, 1, 1, 4)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 24: // STATE 12 - main.pml:19 - [((_nr_pr==1))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][12] = 1;
		if (!((((int)now._nr_pr)==1)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 25: // STATE 13 - main.pml:20 - [printf('\\n')] (0:0:0 - 1)
		IfNotBlocked
		reached[0][13] = 1;
		Printf("\n");
		_m = 3; goto P999; /* 0 */
	case 26: // STATE 14 - main.pml:21 - [assert(!((((frogs[3]+frogs[4])==3)&&((frogs[1]+frogs[2])==9))))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][14] = 1;
		spin_assert( !((((now.frogs[3]+now.frogs[4])==3)&&((now.frogs[1]+now.frogs[2])==9))), " !((((frogs[3]+frogs[4])==3)&&((frogs[1]+frogs[2])==9)))", II, tt, t);
		_m = 3; goto P999; /* 0 */
	case 27: // STATE 15 - main.pml:22 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[0][15] = 1;
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

