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

		 /* PROC Q */
	case 3: // STATE 1 - main.pml:9 - [n = 2] (0:0:1 - 1)
		IfNotBlocked
		reached[1][1] = 1;
		(trpt+1)->bup.oval = ((int)n);
		n = 2;
#ifdef VAR_RANGES
		logval("n", ((int)n));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 4: // STATE 2 - main.pml:10 - [printf('Process Q, n = %d\\n',n)] (0:0:0 - 1)
		IfNotBlocked
		reached[1][2] = 1;
		Printf("Process Q, n = %d\n", ((int)n));
		_m = 3; goto P999; /* 0 */
	case 5: // STATE 3 - main.pml:11 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[1][3] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC P */
	case 6: // STATE 1 - main.pml:4 - [n = 1] (0:0:1 - 1)
		IfNotBlocked
		reached[0][1] = 1;
		(trpt+1)->bup.oval = ((int)n);
		n = 1;
#ifdef VAR_RANGES
		logval("n", ((int)n));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 7: // STATE 2 - main.pml:5 - [printf('Process P, n = %d\\n',n)] (0:0:0 - 1)
		IfNotBlocked
		reached[0][2] = 1;
		Printf("Process P, n = %d\n", ((int)n));
		_m = 3; goto P999; /* 0 */
	case 8: // STATE 3 - main.pml:6 - [-end-] (0:0:0 - 1)
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

