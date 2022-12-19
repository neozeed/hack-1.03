CC=wcc386

# on some systems the termcap library is in -ltermcap
TERMLIB =

default: hack.exe

# make hack
GAME = hack.exe
GAMEDIR = /usr/games/lib/hackdir
# -DMULTIUSER_LOCK for systems that can respect this old locking schema
#
CFLAGS = -i=c:\watcom\h;c:\watcom\h\nt -w0 -e25 -dMSDOS -zp1 -zq -od -d3 -db -en -fpi -r -zm -zc -mf -3r -bt=nt -ri -ei -hc

OBJ = decl.obj,apply.obj,bones.obj,hack.obj,cmd.obj,do.obj,&
	do_name.obj,do_wear.obj,dog.obj,eat.obj,end.obj,&
	engrave.obj,fight.obj,invent.obj,pcioctl.obj,&
	lev.obj,makemon.obj,mhitu.obj,mklev.obj,&
	mkmaze.obj,mkobj.obj,mkshop.obj,mon.obj,&
	monst.obj,o_init.obj,objnam.obj,options.obj,&
	pager.obj,potion.obj,pri.obj,&
	read.obj,rip.obj,rumors.obj,save.obj,&
	search.obj,shk.obj,shknam.obj,steal.obj,&
	termpc.obj,timeout.obj,topl.obj,&
	track.obj,trap.obj,pctty.obj,unix.obj,&
	u_init.obj,vault.obj,wield.obj,&
	wizard.obj,worm.obj,worn.obj,zap.obj,&
	version.obj,rnd.obj,alloc.obj,msdos.obj


.c.obj: *.c
        $(CC) $(CFLAGS) -fo=$*.obj $*.c 

$(GAME): $(OBJ) main.obj
	@echo "Loading ..."
	wlink SYS nt op st=8192 op maxe=25 op d NAME hack.exe FIL main.obj,$(OBJ)
#	@$(CC) -o $(GAME) $(HOBJ) $(TERMLIB) 

all:	$(GAME) lint
	@echo "Done."

makedefs.exe:	makedefs.c
	$(CC) $(CFLAGS) makedefs.c
	wlink SYS nt op st=8192 op maxe=25 op d NAME makedefs.exe FIL makedefs.obj
	


onames.h:	makedefs.exe objects.h
	makedefs > onames.h



clean:
	del /F $(OBJ) makedefs.obj makedefs.exe onames.h h hack.exe main.obj *.mbr



# DO NOT DELETE THIS LINE

decl.obj: onames.h 
apply.obj: onames.h
bones.obj: onames.h
hack.obj: onames.h
cmd.obj: onames.h 
do.obj: onames.h
do_name.obj: onames.h
do_wear.obj: onames.h
dog.obj: onames.h mfndpos.h edog.h mkroom.h
eat.obj: onames.h
end.obj: onames.h
engrave.obj: onames.h
fight.obj: onames.h
invent.obj: onames.h wseg.h
ioctl.obj:  config.h
lev.obj: onames.h mkroom.h wseg.h
main.obj: onames.h
makemon.obj: onames.h
mhitu.obj: onames.h
mklev.obj: onames.h mkroom.h
mkmaze.obj: onames.h mkroom.h
mkobj.obj: onames.h
mkshop.obj: onames.h mkroom.h eshk.h
mon.obj: onames.h mfndpos.h
monst.obj: onames.h eshk.h
o_init.obj:  config.h objects.h onames.h
objnam.obj: onames.h
options.obj:  config.h
pager.obj: onames.h
potion.obj: onames.h
pri.obj: onames.h wseg.h
read.obj: onames.h
rip.obj: onames.h
rumors.obj: onames.h
save.obj: onames.h
search.obj: onames.h
shk.obj: onames.h mfndpos.h mkroom.h eshk.h
shknam.obj: onames.h
steal.obj: onames.h
termpc.obj:  config.h flag.h
timeout.obj: onames.h
topl.obj: onames.h
track.obj: onames.h
trap.obj: onames.h mkroom.h
tty.obj: onames.h
unix.obj: onames.h mkroom.h
u_init.obj: onames.h
vault.obj: onames.h mkroom.h
wield.obj: onames.h
wizard.obj: onames.h
worm.obj: onames.h wseg.h
worn.obj: onames.h
zap.obj: onames.h
version.obj:  date.h
x68k.obj: onames.h
#h:  config.h objclass.h monst.h gold.h trap.h obj.h flag.h rm.h permonst.h onames.h
#	copy /Y blank h
#objects.h:  config.h objclass.h
#			touch objects.h
# DEPENDENCIES MUST END AT END OF FILE
# IF YOU PUT STUFF HERE IT WILL GO AWAY
# see make depend above
