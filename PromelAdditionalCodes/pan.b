	switch (t->back) {
	default: Uerror("bad return move");
	case  0: goto R999; /* nothing to undo */

		 /* PROC P1 */

	case 3: // STATE 2
		;
		now.pathTaken = trpt->bup.oval;
		;
		goto R999;

	case 4: // STATE 5
		;
		now.pathTaken = trpt->bup.oval;
		;
		goto R999;

	case 5: // STATE 8
		;
		now.pathTaken = trpt->bup.oval;
		;
		goto R999;

	case 6: // STATE 11
		;
		now.pathTaken = trpt->bup.oval;
		;
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
		;
		;
		;
		;
		;
		;
		
	case 15: // STATE 26
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC :init: */

	case 16: // STATE 1
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 17: // STATE 3
		;
		p_restor(II);
		;
		;
		goto R999;
	}

