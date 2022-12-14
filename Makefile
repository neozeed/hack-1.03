# Hack or Quest Makefile.
CC=gcc -m32

# on some systems the termcap library is in -ltermcap
TERMLIB = -lcurses #-ltermlib


# make hack
GAME = hack
GAMEDIR = /usr/games/lib/hackdir
# -DMULTIUSER_LOCK for systems that can respect this old locking schema
#
CFLAGS = -fgnu89-inline -g -O0
HACKCSRC = decl.c\
	apply.c bones.c c cmd.c do.c\
	do_name.c do_wear.c dog.c eat.c end.c\
	engrave.c fight.c invent.c ioctl.c\
	lev.c main.c makemon.c mhitu.c\
	mklev.c mkmaze.c mkobj.c mkshop.c\
	mon.c monst.c o_init.c objnam.c\
	options.c pager.c potion.c pri.c\
	read.c rip.c rumors.c save.c\
	search.c shk.c shknam.c steal.c\
	termcap.c timeout.c topl.c\
	track.c trap.c tty.c unix.c\
	u_init.c vault.c\
	wield.c wizard.c worm.c worn.c zap.c\
	version.c rnd.c alloc.c

CSOURCES = $(HACKCSRC) makedefs.c

HSOURCES = h mfndpos.h config.h\
	edog.h eshk.h flag.h func_tab.h gold.h\
	mkroom.h\
	monst.h obj.h objclass.h objects.h\
	permonst.h rm.h trap.h wseg.h

SOURCES = $(CSOURCES) $(HSOURCES)

AUX = data help hh rumors 6 sh

DISTR = $(SOURCES) $(AUX) READ_ME Makefile date.h onames.h

HOBJ = decl.o apply.o bones.o hack.o cmd.o do.o\
	do_name.o do_wear.o dog.o eat.o end.o\
	engrave.o fight.o invent.o ioctl.o\
	lev.o main.o makemon.o mhitu.o mklev.o\
	mkmaze.o mkobj.o mkshop.o mon.o\
	monst.o o_init.o objnam.o options.o\
	pager.o potion.o pri.o\
	read.o rip.o rumors.o save.o\
	search.o shk.o shknam.o steal.o\
	termcap.o timeout.o topl.o\
	track.o trap.o\
	tty.o unix.o u_init.o vault.o wield.o\
	wizard.o worm.o worn.o zap.o\
	version.o rnd.o alloc.o

$(GAME):	$(HOBJ) Makefile
	@echo "Loading ..."
	@$(CC) -o $(GAME) $(HOBJ) $(TERMLIB) 

all:	$(GAME) lint
	@echo "Done."

makedefs:	makedefs.c
	$(CC) -o makedefs makedefs.c


onames.h:	makedefs objects.h
	./makedefs > onames.h

lint:
# lint cannot have -p here because (i) capitals are meaningful:
# [Ww]izard, (ii) identifiers may coincide in the first six places:
# doweararm() versus dowearring().
# _flsbuf comes from <stdio.h>, a bug in the system libraries.
	@echo lint -axbh -DLINT ...
	@lint -axbh -DLINT $(HACKCSRC) | sed '/_flsbuf/d'


diff:
	@- for i in $(SOURCES) $(AUX) ; do \
		cmp -s $$i $D/$$i || \
		( echo diff $D/$$i $$i ; diff $D/$$i $$i ; echo ) ; done

distribution: Makefile
	@- for i in READ_ME $(SOURCES) $(AUX) Makefile date.h onames.h\
		; do \
		cmp -s $$i $D/$$i || \
		( echo cp $$i $D ; cp $$i $D ) ; done
# the distribution directory also contains the empty files perm and record.


install:
	rm -f $(GAMEDIR)/$(GAME)
	cp $(GAME) $(GAMEDIR)/$(GAME)
	chmod 04511 $(GAMEDIR)/$(GAME)
	rm -f $(GAMEDIR)/bones*
#	cp 6 /usr/man/man6

clean:
	rm -f *.o makedefs onames.h h hack


depend:
# For the moment we are lazy and disregard /usr/include files because
# the sources contain them conditionally. Perhaps we should use cpp.
#		( /bin/grep '^#[ 	]*include' $$i | sed -n \
#			-e 's,<\(.*\)>,"/usr/include/\1",' \
#
	for i in ${CSOURCES}; do \
		( /bin/grep '^#[ 	]*include[ 	]*"' $$i | sed -n \
			-e 's/[^"]*"\([^"]*\)".*/\1/' \
			-e H -e '$$g' -e '$$s/\n/ /g' \
			-e '$$s/.*/'$$i': &/' -e '$$s/\.c:/.o:/p' \
			>> makedep); done
	for i in ${HSOURCES}; do \
		( /bin/grep '^#[ 	]*include[ 	]*"' $$i | sed -n \
			-e 's/[^"]*"\([^"]*\)".*/\1/' \
			-e H -e '$$g' -e '$$s/\n/ /g' \
			-e '$$s/.*/'$$i': &\
				touch '$$i/p \
			>> makedep); done
	@echo '/^# DO NOT DELETE THIS LINE/+2,$$d' >eddep
	@echo '$$r makedep' >>eddep
	@echo 'w' >>eddep
	@cp Makefile Makefile.bak
	ed - Makefile < eddep
	@rm -f eddep makedep
	@echo '# DEPENDENCIES MUST END AT END OF FILE' >> Makefile
	@echo '# IF YOU PUT STUFF HERE IT WILL GO AWAY' >> Makefile
	@echo '# see make depend above' >> Makefile
	- diff Makefile Makefile.bak
	@rm -f Makefile.bak

# DO NOT DELETE THIS LINE

decl.o:  h mkroom.h
apply.o:  h edog.h mkroom.h
bones.o:  h
hack.o:  h
cmd.o:  h func_tab.h
do.o:  h
do_name.o:  h
do_wear.o:  h
dog.o:  h mfndpos.h edog.h mkroom.h
eat.o:  h
end.o:  h
engrave.o:  h
fight.o:  h
invent.o:  h wseg.h
ioctl.o:  config.h
lev.o:  h mkroom.h wseg.h
main.o:  h
makemon.o:  h
mhitu.o:  h
mklev.o:  h mkroom.h
mkmaze.o:  h mkroom.h
mkobj.o:  h
mkshop.o:  h mkroom.h eshk.h
mon.o:  h mfndpos.h
monst.o:  h eshk.h
o_init.o:  config.h objects.h onames.h
objnam.o:  h
options.o:  config.h h
pager.o:  h
potion.o:  h
pri.o:  h wseg.h
read.o:  h
rip.o:  h
rumors.o:  h
save.o:  h
search.o:  h
shk.o:  h mfndpos.h mkroom.h eshk.h
shknam.o:  h
steal.o:  h
termcap.o:  config.h flag.h
timeout.o:  h
topl.o:  h
track.o:  h
trap.o:  h mkroom.h
tty.o:  h
unix.o:  h mkroom.h
u_init.o:  h
vault.o:  h mkroom.h
wield.o:  h
wizard.o:  h
worm.o:  h wseg.h
worn.o:  h
zap.o:  h
version.o:  date.h
h:  config.h objclass.h monst.h gold.h trap.h obj.h flag.h rm.h permonst.h onames.h
			touch h
objects.h:  config.h objclass.h
			touch objects.h
# DEPENDENCIES MUST END AT END OF FILE
# IF YOU PUT STUFF HERE IT WILL GO AWAY
# see make depend above
