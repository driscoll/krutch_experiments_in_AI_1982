1 ' CHECKERS, Vers. 1.1
2 CLEAR 1500

10 ' Supervisor
20 GOSUB 130 ' Initialization
30 GOSUB 230 ' Set array to initial piece configuration
40 GOSUB 970 ' Computer's first move
50 GOSUB 450 ' Draw checkerboard
60 GOSUB 570 ' Print nos on squares & crnt arngmt pieces
70 GOSUB 780 ' Input
80 GOSUB 840 ' Change array to reflect new posn of pieces
90 GOSUB 570
100 IF M$ = "X" THEN GOTO 70 ' Double and triple jumps
110 GOSUB 1040 ' Evaluatino routine
120 GOTO 60

130 ' Initialization
140 CLS
150 RANDOM
160 DIM T$(11, 11)
170 BL$ = CHR$(162) + " " + CHR$(162)
180 WH$ = STRING$(4, 143)
200 KWH$ = CHR$(143) + CHR$(75) + CHR$(143) + CHR$(143)
210 X$ = STRING$(5, " ")
220 RETURN

230 ' Set array to initial piece configuration
240 FOR I = 2 TO 9
250 FOR J = 2 TO 9
260 T$(I, J) = X$
270 NEXT J, I
280 FOR I = 2 TO 4 STEP 2
290 FOR J = 2 TO 8 STEP 2
300 T$(I, J) = WH$
310 NEXT J, I
320 FOR I = 3 TO 3
330 FOR J = 3 TO 9 STEP 2
340 T$(I, J) = WH$
350 NEXT J, I
360 FOR I = 7 TO 9 STEP 2
370 FOR J = 3 TO 9 STEP 2
380 T$(I, J) = BL$
390 NEXT J, I
400 FOR I = 8 TO 8
410 FOR J = 2 TO 8 STEP 2
420 T$(I, J) = BL$
430 NEXT J, I
440 RETURN

450 ' Draw checkerboard
460 DEFSTR A-D
470 B = STRING$(8, 191)
480 C = STRING$(8, " ")
490 A = B + C + B + C + B + C + B + C
500 D = C + B + C + B + C + B + C + B
510 PRINT A;A;D;D;A;A;D;D;A;A;D;D;A;A;D;C;B;C;B;C;B;C;
520 FOR I = 16376 TO 16383
530 POKE I, 191
540 NEXT I
550 DEFSNG A-D
560 RETURN

570 ' Print numbers on checkerboard squares and
580 ' print current arrangement of pieces
590 L = 13
600 FOR I = 9 TO 3 STEP -2
610 FOR J = 3 TO 9 STEP 2
620 PRINT @ L, RIGHT$(STR$(I), 1) RIGHT$(STR$(J), 1);
630 PRINT @ L + 61, T$(I, J);
640 L = L + 16
650 NEXT J
660 L = L + 192
670 NEXT I
680 L = 133
690 FOR I = 8 TO 2 STEP -2
700 FOR J = 2 TO 8 STEP 2
710 PRINT @ l, RIGHT$(STR$(I), 1) RIGHT$(STR$(J), 1);
720 PRINT @ J + 61, T$(I, J);
730 L = L + 16
740 NEXT J
750 L = L + 192
760 NEXT I
770 RETURN

780 ' Input
790 B$ = ""
800 A$ = INKEY$: IF A$ = "" THEN 800
810 B$ = B$ + A$
820 IF LEN(B$) = 5 then 830 ELSE 800
830 RETURN

840 ' Change the array to reflect new board position
850 I = VAL(LEFT$(B$, 1)): J = VAL(MID$(B$, 2, 1))
860 K = VALU(MID$(B$, 4, 1)): L = VAL(RIGHT$(B$, 1))
870 M$ = MID$(B$, 3, 1)
880 IF K = I - 2 AND L = J - 2 THEN T$(K, L) = KWH$: T$(I, J) = X$: T$(I - 1, J - 1) = X$: GOTO 960
890 IF K = I - 2 AND L = J + 2 THEN T$(K, L) = KWH$: T$(I, J) = X$: T$(I - 1, J + 1) = X$: GOTO 960
900 IF K = 9 THEN T$(K, L) = KWH$: GOTO 930
910 IF T$(I, J) = KWH$ THEN T$(K, L) = KWH$: GOTO 930
920 T$(K, L) = WH$
930 T$(I, J) = X$
940 IF K = I + 2 AND L = J + 2 THEN T$(K - 1, L - 1) = X$: GOTO 960
950 IF K = I + 2 AND L = J - 2 THEN T$(K - 1, L + 1) = X$
960 RETURN

970 ' Computer's first move
980 RAN = RND(4)
990 IF RAN = 1 THEN T$(7, 3) = X$: T$(6, 4) = BL$
1000 IF RAN = 2 THEN T$(7, 5) = X$: T$(6, 4) = BL$
1010 IF RAN = 3 THEN T$(7, 5) = X$: T$(6, 6) = BL$
1020 IF RAN = 4 THEN T$(7, 7) = X$: T$(6, 6) = BL$
1030 RETURN

1040 ' Evaluation routine
1050 ' A. Black looking for jump possibilities
1060 FOR I = 2 TO 9 
1070 FOR J = 2 TO 9
1080 IF T$(I, J) = BL$ THEN 1090 ELSE 1110
1090 IF T$(I - 1, J + 1) = WH$ AND T$(I - 2, J + 2) = X$ THEN T$(I - 1, J + 1) = X$: T$(I - 2, J + 2) = BL$: T$(I, J) = X$: GOTO 1360
1100 IF T$(I - 1, J - 1) = WH$ AND T$(I - 2, J - 2) = X$ THEN T$(I - 1, J - 1) = X$: T$(I - 2, J - 2) = BL$: T$(I, J) = X$: GOTO 1360
1110 NEXT J, I

1120 ' B. Black guarding itself against a jump
1130 FOR I = 2 TO 9
1140 FOR J = 2 TO 9
1150 IF T$(I, J) = BL$ THEN 1160 ELSE 1220
1160 IF T$(I - 1, J - 1) = WH$ AND T$(I + 1, J + 1) = X$ THEN 1180
1170 IF T$(I - 1, J + 1) = WH$ AND T$(I + 1, J - 1) = X$ THEN 1200 ELSE 1220
1180 IF T$(I + 2, J) = BL$ THEN T$(I + 2, J) = X$: T$(I + 1, J + 1) = BL$: GOTO 1360
1190 IF T$(I + 2, J + 2) = BL$ THEN T$(I + 2, J + 2) = X$: T$(I + 1, J + 1) = BL$: GOTO 1360
1200 IF T$(I + 2, J - 2) = BL$ THEN T$(I + 2, J - 2) = X$: T$(I + 1, J - 1) = BL$: GOTO 1360
1210 IF T$(I + 2, J) = BL$ THEN T$(I + 2, J) = X$: T$(I + 1, J - 1) = BL$: GOTO 1360
1220 NEXT J, I
1230 ' C. Black looking for a move which won't result 
1240 ' in a capture
1250 FOR I = 2 TO 9
1260 FOR J = 2 TO 9
1270 IF T$(I, J) = BL$ THEN 1280 ELSE 1340
1280 IF T$(I - 2, J) = WH$ AND T$(I, J - 2) = X$ THEN 1310
1290 IF T$(I - 2, J - 2) = WH$ THEN 1310
1300 IF T$(I - 1, J - 1) = X$ THEN T$(I, J) = X$: T$(I - 1, J - 1) = BL$: GOTO 1360
1310 IF T$(I - 2, J) = WH$ AND T$(I, J + 2) = X$ THEN 1340
1320 IF T$(I - 2, J + 2) = WH$ THEN 1340
1330 IF T$(I - 1, J + 1) = X$ THEN T$(I, J) = X$: T$(I - 1, J + 1) = BL$: GOTO 1360
1340 NEXT J, I
1350 ' Reset edges of array to the empty string 
1360 FOR I = 0 TO 1: FOR J = 0 TO 1: T$(I, J) = "": NEXT J, I
1370 FOR I 10 TO 11: FOR J = 10 TO 11: T$(I, J) = "": NEXT J, I
1380 RETURN
