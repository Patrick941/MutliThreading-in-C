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

		 /* PROC P1 */
	case 3: // STATE 2 - pathingTest.pml:11 - [pathTaken = 1] (0:0:1 - 1)
		IfNotBlocked
		reached[1][2] = 1;
		(trpt+1)->bup.oval = now.pathTaken;
		now.pathTaken = 1;
#ifdef VAR_RANGES
		logval("pathTaken", now.pathTaken);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 4: // STATE 5 - pathingTest.pml:12 - [pathTaken = 2] (0:0:1 - 1)
		IfNotBlocked
		reached[1][5] = 1;
		(trpt+1)->bup.oval = now.pathTaken;
		now.pathTaken = 2;
#ifdef VAR_RANGES
		logval("pathTaken", now.pathTaken);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 5: // STATE 8 - pathingTest.pml:13 - [pathTaken = 3] (0:0:1 - 1)
		IfNotBlocked
		reached[1][8] = 1;
		(trpt+1)->bup.oval = now.pathTaken;
		now.pathTaken = 3;
#ifdef VAR_RANGES
		logval("pathTaken", now.pathTaken);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 6: // STATE 11 - pathingTest.pml:14 - [pathTaken = 4] (0:0:1 - 1)
		IfNotBlocked
		reached[1][11] = 1;
		(trpt+1)->bup.oval = now.pathTaken;
		now.pathTaken = 4;
#ifdef VAR_RANGES
		logval("pathTaken", now.pathTaken);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 7: // STATE 16 - pathingTest.pml:17 - [((pathTaken==1))] (0:0:0 - 1)
		IfNotBlocked
		reached[1][16] = 1;
		if (!((now.pathTaken==1)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 8: // STATE 17 - pathingTest.pml:17 - [printf('The value for pathTaken is: 1\\n')] (0:0:0 - 1)
		IfNotBlocked
		reached[1][17] = 1;
		Printf("The value for pathTaken is: 1\n");
		_m = 3; goto P999; /* 0 */
	case 9: // STATE 18 - pathingTest.pml:18 - [((pathTaken==2))] (0:0:0 - 1)
		IfNotBlocked
		reached[1][18] = 1;
		if (!((now.pathTaken==2)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 10: // STATE 19 - pathingTest.pml:18 - [printf('The value for pathTaken is: 2\\n')] (0:0:0 - 1)
		IfNotBlocked
		reached[1][19] = 1;
		Printf("The value for pathTaken is: 2\n");
		_m = 3; goto P999; /* 0 */
	case 11: // STATE 20 - pathingTest.pml:19 - [((pathTaken==3))] (0:0:0 - 1)
		IfNotBlocked
		reached[1][20] = 1;
		if (!((now.pathTaken==3)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 12: // STATE 21 - pathingTest.pml:19 - [printf('The value for pathTaken is: 3\\n')] (0:0:0 - 1)
		IfNotBlocked
		reached[1][21] = 1;
		Printf("The value for pathTaken is: 3\n");
		_m = 3; goto P999; /* 0 */
	case 13: // STATE 22 - pathingTest.pml:20 - [((pathTaken==4))] (0:0:0 - 1)
		IfNotBlocked
		reached[1][22] = 1;
		if (!((now.pathTaken==4)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 14: // STATE 23 - pathingTest.pml:20 - [printf('The value for pathTaken is: 4\\n')] (0:0:0 - 1)
		IfNotBlocked
		reached[1][23] = 1;
		Printf("The value for pathTaken is: 4\n");
		_m = 3; goto P999; /* 0 */
	case 15: // STATE 26 - pathingTest.pml:24 - [-end-] (0:0:0 - 5)
		IfNotBlocked
		reached[1][26] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC :init: */
	case 16: // STATE 1 - pathingTest.pml:5 - [(run P1())] (0:0:0 - 1)
		IfNotBlocked
		reached[0][1] = 1;
		if (!(addproc(II, 1, 1)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 17: // STATE 3 - pathingTest.pml:7 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[0][3] = 1;
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

