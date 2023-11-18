1 '             TF, Vers. 2.2

100 '               Supervisor
110 GOSUB 190       ' Initialization
120 GOSUB 250       ' First LE inputs from player
130 GOSUB 310       ' Input
140 GOSUB 550       ' Printing and scorekeeping
150 GOSUB 380       ' Location update
160 GOSUB 490       ' Match-pattern update
170 GOSUB 420       ' Location calculation
180 GOTO 130

190 '               Initialization
200 RANDOM
210 DIM Q(1111, 2)
220 LE = 4
230 CLS
240 RETURN

250 '               First LE inputs from player
260 FOR I = 1 TO LE
270 GOSUB 310
280 MP(I) = checkerboard
290 NEXT I
300 RETURN

310 '               Input
320 PRINT @ 625, "READY";
330 IP$ = INKEY$: IF IP$ = "T" OR IP$ = "F" THEN 340 ELSE 330
340 IF IP$ = "T" THEN CD = 1: GOTO 360
350 IF IP$ = "F" THEN CD = 0: GOTO 360
360 CLS
370 RETURN

380 '               Location update
390 IF CD = 1 THEN Q(LO, 1) = Q(LO, 1) + 1: GOTO 410
400 IF CD = 0 THEN Q(LO, 2) = Q(LO, 2) + 1
410 RETURN

420 '               Location calculation
430 A$ = ""
440 FOR I = 1 TO LE
450 A$ = A$ + MID$(STR$(MP(I)), 2)
460 NEXT I
470 LO = VAL(A$)
480 RETURN

490 '               Match-pattern update
500 FOR I = 1 TO LE - 1
510 MP(I) = MP(I + 1)
520 NEXT I
530 MP(LE) = CD
540 RETURN

550 '               Printing and scorekeeping
560 PRINT @ 384, "YOU TYPED:                        " IP$
570 PRINT @ 448, "COMPUTER WAS PREDICTING:"
580 IF Q(LO, 1) > Q(LO, 2) THEN TF$ = "T": T = T + 1: PRINT @ 480, TF$: GOTO 630
590 IF Q(LO, 2) > Q(LO, 1) THEN TF$ = "F": F = F + 1: PRINT @ 480, TF$: GOTO 630
600 RAN = RND(2)
610 IF RAN = 1 THEN TF$ = "T": T = T + 1: PRINT @ 480, TF$
620 IF RAN = 2 THEN TF$ = "F": F = F + 1: PRINT @ 480, TF$
630 IF TF$ = IP$ THEN NC = NC + 1
640 PRINT @ 512, "TOTAL NUMBER OF ENTRIES:      " T + F
650 PRINT @ 576, "NUMBER OF CORRECT PRE-"
660 PRINT @ 641, "DICTIONS BY THE COMPUTER:     " NC
670 PRINT @ 704, "PERCENT OF CORRECT PRE-"
680 PRINT @ 769, "DICTIONS BY THE COMPUTER:     " INT(((NC / (T + F)) * 100) * 10 + .5) / 10; "%"
690 RETURN