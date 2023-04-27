	switch (t->back) {
	default: Uerror("bad return move");
	case  0: goto R999; /* nothing to undo */

		 /* PROC move */
;
		;
		;
		;
		;
		;
		;
		;
		
	case 7: // STATE 10
		;
		now.frogs[ Index(((P1 *)_this)->id, 5) ] = trpt->bup.ovals[2];
		now.frogs[0] = trpt->bup.ovals[1];
		((P1 *)_this)->temp = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 3);
		goto R999;
;
		
	case 8: // STATE 12
		goto R999;
;
		
	case 9: // STATE 22
		goto R999;

	case 10: // STATE 17
		;
		now.frogs[ Index(((P1 *)_this)->id, 5) ] = trpt->bup.ovals[2];
		now.frogs[0] = trpt->bup.ovals[1];
		((P1 *)_this)->temp = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 3);
		goto R999;
;
		
	case 11: // STATE 19
		goto R999;
;
		
	case 12: // STATE 24
		goto R999;

	case 13: // STATE 30
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC :init: */

	case 14: // STATE 1
		;
		now.frogs[0] = trpt->bup.oval;
		;
		goto R999;

	case 15: // STATE 2
		;
		now.frogs[1] = trpt->bup.oval;
		;
		goto R999;

	case 16: // STATE 3
		;
		now.frogs[2] = trpt->bup.oval;
		;
		goto R999;

	case 17: // STATE 4
		;
		now.frogs[3] = trpt->bup.oval;
		;
		goto R999;

	case 18: // STATE 5
		;
		now.frogs[4] = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 20: // STATE 8
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 21: // STATE 9
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 22: // STATE 10
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 23: // STATE 11
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;
;
		;
		;
		;
		;
		;
		
	case 27: // STATE 15
		;
		p_restor(II);
		;
		;
		goto R999;
	}

