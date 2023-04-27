	switch (t->back) {
	default: Uerror("bad return move");
	case  0: goto R999; /* nothing to undo */

		 /* PROC :init: */
;
		
	case 3: // STATE 1
		goto R999;

	case 4: // STATE 3
		;
		now.in = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 6: // STATE 5
		;
		now.buffer[ Index(now.in, 4) ] = trpt->bup.oval;
		;
		goto R999;

	case 7: // STATE 6
		;
		now.in = trpt->bup.oval;
		;
		goto R999;

	case 8: // STATE 8
		;
		now.in = trpt->bup.oval;
		;
		goto R999;

	case 9: // STATE 13
		;
		now.out = trpt->bup.oval;
		;
		goto R999;

	case 10: // STATE 14
		;
		now.bfull = trpt->bup.oval;
		;
		goto R999;

	case 11: // STATE 15
		;
		now.bempty = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 13: // STATE 19
		;
		now.six = trpt->bup.oval;
		;
		goto R999;

	case 14: // STATE 22
		;
		now.six = trpt->bup.oval;
		;
		goto R999;
;
		
	case 15: // STATE 24
		goto R999;

	case 16: // STATE 31
		;
		now.mtx.mstate = trpt->bup.oval;
		;
		goto R999;

	case 17: // STATE 32
		;
		now.cvars[0].cstate = trpt->bup.oval;
		;
		goto R999;

	case 18: // STATE 33
		;
		now.cvars[1].cstate = trpt->bup.oval;
		;
		goto R999;

	case 19: // STATE 35
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 20: // STATE 36
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 21: // STATE 37
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 22: // STATE 38
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC consumer */
;
		;
		
	case 24: // STATE 4
		;
		now.mtx.mstate = trpt->bup.ovals[1];
		now.mtx.mid = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;
;
		;
		;
		;
		;
		;
		;
		;
		
	case 29: // STATE 20
		;
		now.mtx.mid = trpt->bup.ovals[1];
		now.mtx.mstate = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 30: // STATE 24
		;
		now.cvars[1].cstate = trpt->bup.oval;
		;
		goto R999;
;
		;
		;
		;
		
	case 33: // STATE 29
		;
		now.mtx.mstate = trpt->bup.ovals[1];
		now.mtx.mid = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;
;
		
	case 34: // STATE 36
		goto R999;
;
		;
		;
		;
		;
		;
		
	case 38: // STATE 51
		;
		now.out = trpt->bup.oval;
		;
		goto R999;

	case 39: // STATE 52
		;
		cout = trpt->bup.oval;
		;
		goto R999;

	case 40: // STATE 53
		;
		now.buffer[ Index(now.out, 4) ] = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 42: // STATE 55
		;
		now.bfull = trpt->bup.oval;
		;
		goto R999;

	case 43: // STATE 56
		;
		now.bempty = trpt->bup.oval;
		;
		goto R999;

	case 44: // STATE 58
		;
		now.six = trpt->bup.oval;
		;
		goto R999;

	case 45: // STATE 61
		;
		now.six = trpt->bup.oval;
		;
		goto R999;
;
		
	case 46: // STATE 63
		goto R999;

	case 47: // STATE 72
		;
		now.cvars[0].cstate = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 49: // STATE 79
		;
		now.mtx.mid = trpt->bup.ovals[1];
		now.mtx.mstate = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 50: // STATE 87
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC producer */
;
		;
		
	case 52: // STATE 4
		;
		now.mtx.mstate = trpt->bup.ovals[1];
		now.mtx.mid = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;
;
		;
		;
		;
		;
		;
		;
		;
		;
		;
		
	case 58: // STATE 21
		;
		now.mtx.mid = trpt->bup.ovals[1];
		now.mtx.mstate = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 59: // STATE 25
		;
		now.cvars[0].cstate = trpt->bup.oval;
		;
		goto R999;
;
		;
		;
		;
		
	case 62: // STATE 30
		;
		now.mtx.mstate = trpt->bup.ovals[1];
		now.mtx.mid = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;
;
		
	case 63: // STATE 37
		goto R999;
;
		;
		;
		;
		;
		;
		
	case 67: // STATE 52
		;
		now.buffer[ Index(now.in, 4) ] = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 69: // STATE 54
		;
		now.bempty = trpt->bup.oval;
		;
		goto R999;

	case 70: // STATE 55
		;
		now.bfull = trpt->bup.oval;
		;
		goto R999;

	case 71: // STATE 56
		;
		now.in = trpt->bup.oval;
		;
		goto R999;

	case 72: // STATE 58
		;
		now.six = trpt->bup.oval;
		;
		goto R999;

	case 73: // STATE 61
		;
		now.six = trpt->bup.oval;
		;
		goto R999;
;
		
	case 74: // STATE 63
		goto R999;

	case 75: // STATE 72
		;
		now.cvars[1].cstate = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 77: // STATE 84
		;
		((P0 *)_this)->p = trpt->bup.ovals[2];
		now.mtx.mid = trpt->bup.ovals[1];
		now.mtx.mstate = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 3);
		goto R999;

	case 78: // STATE 88
		;
		p_restor(II);
		;
		;
		goto R999;
	}

