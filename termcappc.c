/* Copyright (c) Stichting Mathematisch Centrum, Amsterdam, 1985. */
/* hack.termcap.c - version 1.0.3 */

#include <stdio.h>
#include "config.h"	/* for ROWNO and COLNO */
#include "flag.h"	/* for flags.nonull */
extern char *tgetstr(), *tgoto(), *getenv();
extern long *alloc();

#ifndef lint
extern			/* it is defined in libtermlib (libtermcap) */
#endif lint
	short ospeed;		/* terminal baudrate; used by tputs */
static char tbuf[512];
static char *HO, *CL, *CE, *UP, *CM, *ND, *XD, *BC, *SO, *SE, *TI, *TE;
static char *VS, *VE;
static int SG;
static char PC = '\0';
char *CD;		/* tested in pri.c: docorner() */
int CO, LI;		/* used in pri.c and whatis.c */

startup()
{
	register char *term;
	register char *tptr;
	char *tbufptr, *pc;

	tptr = (char *) alloc(1024);

#if 0
	tbufptr = tbuf;
	if(!(term = getenv("TERM")))
		error("Can't get TERM.");
	if(!strncmp(term, "5620", 4))
		flags.nonull = 1;	/* this should be a termcap flag */
	if(tgetent(tptr, term) < 1)
		error("Unknown terminal type: %s.", term);
	if(pc = tgetstr("pc", &tbufptr))
		PC = *pc;
	if(!(BC = tgetstr("bc", &tbufptr))) {	
		if(!tgetflag("bs"))
			error("Terminal must backspace.");
		BC = tbufptr;
		tbufptr += 2;
		*BC = '\b';
	}
#endif
/*
mono|ANSI.SYS mono:\
        :co#80:li#25:bs:pt:bl=^G:le=^H:do=^J:\
        :cl=\E[H\E[2J:ce=\E[K:\
        :ho=\E[H:cm=\E[%i%d;%dH:\
        :up=\E[A:do=\E[B:le=\E[C:ri=\E[D:nd=\E[C:\
        :ti=\E[0m\E[=7l:te=\E[0m\E[=7h:\
        :so=\E[1m:se=\E[m:us=\E[4m:ue=\E[m:\
        :mb=\E[5m:md=\E[1m:mr=\E[7m:me=\E[m:
*/
	HO = "\E[H";
	CO = 80;
	LI = 25;
	if(CO < COLNO || LI < ROWNO+2)
		setclipped();
	CL = "\E[H\E[2J";
	ND = "\E[C";
	CE = "\E[K";
	UP = "\E[A";
	XD = "";
	CM = "\E[%i%d";
	SO = "\E[1m";
	SE = "\E[m";
	SG = "";
	if(!SO || !SE || (SG > 0)) SO = SE = 0;
	CD = "";
	set_whole_screen();		/* uses LI and CD */
	free(tptr);
}

start_screen()
{
	xputs(TI);
	xputs(VS);
}

end_screen()
{
	xputs(VE);
	xputs(TE);
}

/* Cursor movements */
extern xchar curx, cury;

curs(x, y)
register int x, y;	/* not xchar: perhaps xchar is unsigned and
			   curx-x would be unsigned as well */
{

	if (y == cury && x == curx)
		return;
	if(!ND && (curx != x || x <= 3)) {	/* Extremely primitive */
		cmov(x, y);			/* bunker!wtm */
		return;
	}
	if(abs(cury-y) <= 3 && abs(curx-x) <= 3)
		nocmov(x, y);
	else if((x <= 3 && abs(cury-y)<= 3) || (!CM && x<abs(curx-x))) {
		(void) putchar('\r');
		curx = 1;
		nocmov(x, y);
	} else if(!CM) {
		nocmov(x, y);
	} else
		cmov(x, y);
}

nocmov(x, y)
{
	if (cury > y) {
		if(UP) {
			while (cury > y) {	/* Go up. */
				xputs(UP);
				cury--;
			}
		} else if(CM) {
			cmov(x, y);
		} else if(HO) {
			home();
			curs(x, y);
		} /* else impossible("..."); */
	} else if (cury < y) {
		if(XD) {
			while(cury < y) {
				xputs(XD);
				cury++;
			}
		} else if(CM) {
			cmov(x, y);
		} else {
			while(cury < y) {
				xputc('\n');
				curx = 1;
				cury++;
			}
		}
	}
	if (curx < x) {		/* Go to the right. */
		if(!ND) cmov(x, y); else	/* bah */
			/* should instead print what is there already */
		while (curx < x) {
			xputs(ND);
			curx++;
		}
	} else if (curx > x) {
		while (curx > x) {	/* Go to the left. */
			xputs(BC);
			curx--;
		}
	}
}

cmov(x, y)
register x, y;
{
	xputs(tgoto(CM, x-1, y-1));
	cury = y;
	curx = x;
}

xputc(c) char c; {
	(void) fputc(c, stdout);
}

xputs(s) char *s; {
	tputs(s, 1, xputc);
}

cl_end() {
	if(CE)
		xputs(CE);
	else {	/* no-CE fix - free after Harold Rynes */
		/* this looks terrible, especially on a slow terminal
		   but is better than nothing */
		register cx = curx, cy = cury;

		while(curx < COLNO) {
			xputc(' ');
			curx++;
		}
		curs(cx, cy);
	}
}

clear_screen() {
	xputs(CL);
	curx = cury = 1;
}

home()
{
	if(HO)
		xputs(HO);
	else if(CM)
		xputs(tgoto(CM, 0, 0));
	else
		curs(1, 1);	/* using UP ... */
	curx = cury = 1;
}

standoutbeg()
{
	if(SO) xputs(SO);
}

standoutend()
{
	if(SE) xputs(SE);
}

backsp()
{
	xputs(BC);
	curx--;
}

bell()
{
	(void) putchar('\007');		/* curx does not change */
	(void) fflush(stdout);
}

static short tmspc10[] = {		/* from termcap */
	0, 2000, 1333, 909, 743, 666, 500, 333, 166, 83, 55, 41, 20, 10, 5
};

delay_output() {
	/* delay 50 ms - could also use a 'nap'-system call */
	/* BUG: if the padding character is visible, as it is on the 5620
	   then this looks terrible. */
	if(!flags.nonull)
		tputs("50", 1, xputc);

		/* cbosgd!cbcephus!pds for SYS V R2 */
		/* is this terminfo, or what? */
		/* tputs("$<50>", 1, xputc); */

	else if(ospeed > 0 || ospeed < SIZE(tmspc10)) if(CM) {
		/* delay by sending cm(here) an appropriate number of times */
		register int cmlen = strlen(tgoto(CM, curx-1, cury-1));
		register int i = 500 + tmspc10[ospeed]/2;

		while(i > 0) {
			cmov(curx, cury);
			i -= cmlen*tmspc10[ospeed];
		}
	}
}

cl_eos()			/* free after Robert Viduya */
{				/* must only be called with curx = 1 */

	if(CD)
		xputs(CD);
	else {
		register int cx = curx, cy = cury;
		while(cury <= LI-2) {
			cl_end();
			xputc('\n');
			curx = 1;
			cury++;
		}
		cl_end();
		curs(cx, cy);
	}
}
