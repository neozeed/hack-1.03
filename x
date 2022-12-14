In file included from hack.h:4,
                 from end.c:4:
config.h:67:8: warning: extra tokens at end of #endif directive [-Wendif-labels]
   67 | #endif BSD
      |        ^~~
config.h:68:8: warning: extra tokens at end of #endif directive [-Wendif-labels]
   68 | #endif UNIX
      |        ^~~~
config.h:91:8: warning: extra tokens at end of #endif directive [-Wendif-labels]
   91 | #endif CHDIR
      |        ^~~~~
config.h:135:8: warning: extra tokens at end of #endif directive [-Wendif-labels]
  135 | #endif CONFIG
      |        ^~~~~~
In file included from end.c:4:
hack.h:12:8: warning: extra tokens at end of #endif directive [-Wendif-labels]
   12 | #endif BSD
      |        ^~~
In file included from hack.h:22,
                 from end.c:4:
monst.h:37:8: warning: extra tokens at end of #endif directive [-Wendif-labels]
   37 | #endif NOWORM
      |        ^~~~~~
In file included from hack.h:34,
                 from end.c:4:
rm.h:35:8: warning: extra tokens at end of #endif directive [-Wendif-labels]
   35 | #endif QUEST
      |        ^~~~~
In file included from end.c:4:
hack.h:72:8: warning: extra tokens at end of #endif directive [-Wendif-labels]
   72 | #endif QUEST
      |        ^~~~~
hack.h:84:8: warning: extra tokens at end of #endif directive [-Wendif-labels]
   84 | #endif QUEST
      |        ^~~~~
end.c:13:1: warning: return type defaults to ‘int’ [-Wimplicit-int]
   13 | done1()
      | ^~~~~
end.c: In function ‘done1’:
end.c:16:9: warning: implicit declaration of function ‘pline’ [-Wimplicit-function-declaration]
   16 |         pline("Really quit?");
      |         ^~~~~
end.c:18:38: warning: passing argument 2 of ‘signal’ from incompatible pointer type [-Wincompatible-pointer-types]
   18 |                 (void) signal(SIGINT,done1);
      |                                      ^~~~~
      |                                      |
      |                                      int (*)()
In file included from end.c:6:
/usr/include/signal.h:88:57: note: expected ‘__sighandler_t’ {aka ‘void (*)(int)’} but argument is of type ‘int (*)()’
   88 | extern __sighandler_t signal (int __sig, __sighandler_t __handler)
      |                                          ~~~~~~~~~~~~~~~^~~~~~~~~
end.c:19:17: warning: implicit declaration of function ‘clrlin’ [-Wimplicit-function-declaration]
   19 |                 clrlin();
      |                 ^~~~~~
end.c:21:31: warning: implicit declaration of function ‘nomul’ [-Wimplicit-function-declaration]
   21 |                 if(multi > 0) nomul(0);
      |                               ^~~~~
end.c:24:9: warning: implicit declaration of function ‘done’; did you mean ‘done1’? [-Wimplicit-function-declaration]
   24 |         done("quit");
      |         ^~~~
      |         done1
end.c: At top level:
end.c:31:1: warning: return type defaults to ‘int’ [-Wimplicit-int]
   31 | done_intr(){
      | ^~~~~~~~~
end.c:37:1: warning: return type defaults to ‘int’ [-Wimplicit-int]
   37 | done_hangup(){
      | ^~~~~~~~~~~
end.c:43:1: warning: return type defaults to ‘int’ [-Wimplicit-int]
   43 | done_in_by(mtmp) register struct monst *mtmp; {
      | ^~~~~~~~~~
end.c:63:1: warning: return type defaults to ‘int’ [-Wimplicit-int]
   63 | done(st1)
      | ^~~~
end.c: In function ‘done’:
end.c:76:17: warning: ‘return’ with no value, in function returning non-void
   76 |                 return;
      |                 ^~~~~~
end.c:63:1: note: declared here
   63 | done(st1)
      | ^~~~
end.c:78:8: warning: extra tokens at end of #endif directive [-Wendif-labels]
   78 | #endif WIZARD
      |        ^~~~~~
end.c:79:31: warning: passing argument 2 of ‘signal’ from incompatible pointer type [-Wincompatible-pointer-types]
   79 |         (void) signal(SIGINT, done_intr);
      |                               ^~~~~~~~~
      |                               |
      |                               int (*)()
In file included from end.c:6:
/usr/include/signal.h:88:57: note: expected ‘__sighandler_t’ {aka ‘void (*)(int)’} but argument is of type ‘int (*)()’
   88 | extern __sighandler_t signal (int __sig, __sighandler_t __handler)
      |                                          ~~~~~~~~~~~~~~~^~~~~~~~~
end.c:80:32: warning: passing argument 2 of ‘signal’ from incompatible pointer type [-Wincompatible-pointer-types]
   80 |         (void) signal(SIGQUIT, done_intr);
      |                                ^~~~~~~~~
      |                                |
      |                                int (*)()
In file included from end.c:6:
/usr/include/signal.h:88:57: note: expected ‘__sighandler_t’ {aka ‘void (*)(int)’} but argument is of type ‘int (*)()’
   88 | extern __sighandler_t signal (int __sig, __sighandler_t __handler)
      |                                          ~~~~~~~~~~~~~~~^~~~~~~~~
end.c:81:31: warning: passing argument 2 of ‘signal’ from incompatible pointer type [-Wincompatible-pointer-types]
   81 |         (void) signal(SIGHUP, done_hangup);
      |                               ^~~~~~~~~~~
      |                               |
      |                               int (*)()
In file included from end.c:6:
/usr/include/signal.h:88:57: note: expected ‘__sighandler_t’ {aka ‘void (*)(int)’} but argument is of type ‘int (*)()’
   88 | extern __sighandler_t signal (int __sig, __sighandler_t __handler)
      |                                          ~~~~~~~~~~~~~~~^~~~~~~~~
end.c:91:9: warning: implicit declaration of function ‘paybill’ [-Wimplicit-function-declaration]
   91 |         paybill();
      |         ^~~~~~~
end.c:92:9: warning: implicit declaration of function ‘clearlocks’ [-Wimplicit-function-declaration]
   92 |         clearlocks();
      |         ^~~~~~~~~~
end.c:93:31: warning: implicit declaration of function ‘more’ [-Wimplicit-function-declaration]
   93 |         if(flags.toplin == 1) more();
      |                               ^~~~
end.c:97:8: warning: extra tokens at end of #endif directive [-Wendif-labels]
   97 | #endif WIZARD
      |        ^~~~~~
end.c:98:17: warning: implicit declaration of function ‘savebones’ [-Wimplicit-function-declaration]
   98 |                 savebones();
      |                 ^~~~~~~~~
end.c:100:25: warning: implicit declaration of function ‘outrip’ [-Wimplicit-function-declaration]
  100 |                         outrip();
      |                         ^~~~~~
end.c:103:9: warning: implicit declaration of function ‘settty’ [-Wimplicit-function-declaration]
  103 |         settty((char *) 0);     /* does a clear_screen() */
      |         ^~~~~~
end.c:126:17: warning: implicit declaration of function ‘keepdogs’ [-Wimplicit-function-declaration]
  126 |                 keepdogs();
      |                 ^~~~~~~~
end.c:184:17: warning: implicit declaration of function ‘getret’ [-Wimplicit-function-declaration]
  184 |                 getret();       /* all those pieces of coloured glass ... */
      |                 ^~~~~~
end.c:185:17: warning: implicit declaration of function ‘cls’ [-Wimplicit-function-declaration]
  185 |                 cls();
      |                 ^~~
end.c:189:8: warning: extra tokens at end of #endif directive [-Wendif-labels]
  189 | #endif WIZARD
      |        ^~~~~~
end.c:190:17: warning: implicit declaration of function ‘topten’; did you mean ‘popen’? [-Wimplicit-function-declaration]
  190 |                 topten();
      |                 ^~~~~~
      |                 popen
end.c:192:9: warning: implicit declaration of function ‘exit’ [-Wimplicit-function-declaration]
  192 |         exit(0);
      |         ^~~~
end.c:7:1: note: include ‘<stdlib.h>’ or provide a declaration of ‘exit’
    6 | #include <signal.h>
  +++ |+#include <stdlib.h>
    7 | #define Sprintf (void) sprintf
end.c:192:9: warning: incompatible implicit declaration of built-in function ‘exit’ [-Wbuiltin-declaration-mismatch]
  192 |         exit(0);
      |         ^~~~
end.c:192:9: note: include ‘<stdlib.h>’ or provide a declaration of ‘exit’
end.c: At top level:
end.c:214:1: warning: return type defaults to ‘int’ [-Wimplicit-int]
  214 | topten(){
      | ^~~~~~
end.c: In function ‘topten’:
end.c:215:19: warning: implicit declaration of function ‘getuid’ [-Wimplicit-function-declaration]
  215 |         int uid = getuid();
      |                   ^~~~~~
end.c:223:18: warning: type defaults to ‘int’ in declaration of ‘flg’ [-Wimplicit-int]
  223 |         register flg = 0;
      |                  ^~~
end.c:245:17: error: unknown type name ‘HUP’
  245 |                 HUP puts("Cannot open record file!");
      |                 ^~~
end.c:245:26: error: expected declaration specifiers or ‘...’ before string constant
  245 |                 HUP puts("Cannot open record file!");
      |                          ^~~~~~~~~~~~~~~~~~~~~~~~~~
end.c:248:9: warning: implicit declaration of function ‘HUP’ [-Wimplicit-function-declaration]
  248 |         HUP (void) putchar('\n');
      |         ^~~
end.c:248:14: error: expected expression before ‘void’
  248 |         HUP (void) putchar('\n');
      |              ^~~~
end.c:248:19: error: expected ‘;’ before ‘putchar’
  248 |         HUP (void) putchar('\n');
      |                   ^~~~~~~~
      |                   ;
end.c:298:8: warning: extra tokens at end of #endif directive [-Wendif-labels]
  298 | #endif PERS_IS_UID
      |        ^~~~~~~~~~~
end.c:303:12: error: expected ‘;’ before ‘printf’
  303 |         HUP printf("You didn't beat your previous score of %ld points.\n\n",
      |            ^~~~~~~
      |            ;
end.c:323:28: error: expected ‘;’ before ‘puts’
  323 |                         HUP puts("Cannot write record file\n");
      |                            ^~~~~
      |                            ;
end.c:337:29: warning: implicit declaration of function ‘outheader’ [-Wimplicit-function-declaration]
  337 |         if(!done_stopprint) outheader();
      |                             ^~~~~~~~~
end.c:353:8: warning: extra tokens at end of #endif directive [-Wendif-labels]
  353 | #endif PERS_IS_UID
      |        ^~~~~~~~~~~
end.c:360:24: warning: implicit declaration of function ‘outentry’; did you mean ‘newttentry’? [-Wimplicit-function-declaration]
  360 |                 (void) outentry(rank, t1, 0);
      |                        ^~~~~~~~
      |                        newttentry
end.c:374:16: warning: implicit declaration of function ‘unlink’ [-Wimplicit-function-declaration]
  374 |         (void) unlink(reclock);
      |                ^~~~~~
end.c: At top level:
end.c:377:1: warning: return type defaults to ‘int’ [-Wimplicit-int]
  377 | outheader() {
      | ^~~~~~~~~
end.c: In function ‘outentry’:
end.c:389:1: warning: type of ‘rank’ defaults to ‘int’ [-Wimplicit-int]
  389 | outentry(rank,t1,so) register struct toptenentry *t1; {
      | ^~~~~~~~
end.c:389:1: warning: type of ‘so’ defaults to ‘int’ [-Wimplicit-int]
end.c:422:58: warning: format not a string literal and no format arguments [-Wformat-security]
  422 |           if(quit && t1->death[4]) Sprintf(eos(linebuf), t1->death + 4);
      |                                                          ^~
end.c:434:56: warning: format not a string literal and no format arguments [-Wformat-security]
  434 |           Sprintf(hpbuf, (t1->hp > 0) ? itoa(t1->hp) : "-");
      |                                                        ^~~
end.c:448:11: warning: implicit declaration of function ‘standoutbeg’ [-Wimplicit-function-declaration]
  448 |           standoutbeg();
      |           ^~~~~~~~~~~
end.c:450:11: warning: implicit declaration of function ‘standoutend’ [-Wimplicit-function-declaration]
  450 |           standoutend();
      |           ^~~~~~~~~~~
end.c: At top level:
end.c:470:1: warning: return type defaults to ‘int’ [-Wimplicit-int]
  470 | clearlocks(){
      | ^~~~~~~~~~
end.c: In function ‘clearlocks’:
end.c:471:10: warning: type defaults to ‘int’ in declaration of ‘x’ [-Wimplicit-int]
  471 | register x;
      |          ^
end.c:474:17: warning: implicit declaration of function ‘glo’ [-Wimplicit-function-declaration]
  474 |                 glo(x);
      |                 ^~~
end.c: At top level:
end.c:486:8: warning: extra tokens at end of #endif directive [-Wendif-labels]
  486 | #endif NOSAVEONHANGUP
      |        ^~~~~~~~~~~~~~
end.c:497:1: warning: return type defaults to ‘int’ [-Wimplicit-int]
  497 | charcat(s,c) register char *s, c; {
      | ^~~~~~~
end.c:508:1: warning: return type defaults to ‘int’ [-Wimplicit-int]
  508 | prscore(argc,argv) int argc; char **argv; {
      | ^~~~~~~
end.c: In function ‘prscore’:
end.c:516:18: warning: type defaults to ‘int’ in declaration of ‘flg’ [-Wimplicit-int]
  516 |         register flg = 0;
      |                  ^~~
end.c:522:8: warning: extra tokens at end of #endif directive [-Wendif-labels]
  522 | #endif nonsense
      |        ^~~~~~~~
end.c:528:8: warning: extra tokens at end of #endif directive [-Wendif-labels]
  528 | #endif PERS_IS_UID
      |        ^~~~~~~~~~~
end.c:532:17: warning: ‘return’ with no value, in function returning non-void
  532 |                 return;
      |                 ^~~~~~
end.c:508:1: note: declared here
  508 | prscore(argc,argv) int argc; char **argv; {
      | ^~~~~~~
end.c:554:8: warning: extra tokens at end of #endif directive [-Wendif-labels]
  554 | #endif PERS_IS_UID
      |        ^~~~~~~~~~~
end.c:574:8: warning: extra tokens at end of #endif directive [-Wendif-labels]
  574 | #endif PERS_IS_UID
      |        ^~~~~~~~~~~
end.c:581:20: warning: implicit declaration of function ‘digit’; did you mean ‘sigwait’? [-Wimplicit-function-declaration]
  581 |                   (digit(players[i][0]) && rank <= atoi(players[i])))
      |                    ^~~~~
      |                    sigwait
end.c:581:52: warning: implicit declaration of function ‘atoi’ [-Wimplicit-function-declaration]
  581 |                   (digit(players[i][0]) && rank <= atoi(players[i])))
      |                                                    ^~~~
end.c:598:13: warning: ‘return’ with no value, in function returning non-void
  598 |             return;
      |             ^~~~~~
end.c:508:1: note: declared here
  508 | prscore(argc,argv) int argc; char **argv; {
      | ^~~~~~~
end.c:609:8: warning: extra tokens at end of #endif directive [-Wendif-labels]
  609 | #endif PERS_IS_UID
      |        ^~~~~~~~~~~
end.c:624:8: warning: extra tokens at end of #endif directive [-Wendif-labels]
  624 | #endif nonsense
      |        ^~~~~~~~
end.c:628:17: warning: implicit declaration of function ‘free’ [-Wimplicit-function-declaration]
  628 |                 free((char *) t1);
      |                 ^~~~
end.c:628:17: note: include ‘<stdlib.h>’ or provide a declaration of ‘free’
end.c:628:17: warning: incompatible implicit declaration of built-in function ‘free’ [-Wbuiltin-declaration-mismatch]
end.c:628:17: note: include ‘<stdlib.h>’ or provide a declaration of ‘free’
end.c:644:8: warning: extra tokens at end of #endif directive [-Wendif-labels]
  644 | #endif nonsense
      |        ^~~~~~~~
make: *** [<builtin>: end.o] Error 1
