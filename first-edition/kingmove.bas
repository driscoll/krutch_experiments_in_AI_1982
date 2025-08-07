1 '            KINGMOVE
2 CLEAR 600

10 '            Supervisor
20 GOSUB 90  ' Initialization
30 GOSUB 150 ' Set array to initial piece arrangement
40 GOSUB 190 ' Draw board
50 GOSUB 410 ' Print current king position
60 GOSUB 290 ' King's move
70 GOSUB 410
80 GOTO 60

90 '            Initialization
100 CLS
110 RANDOM
120 CU = 1
130 K$ = CHR$(174) + CHR$(157) + STRING$(5, 32) + CHR$(26) + STRING$(12, 24) + STRING$(3, 32) + CHR$(188) + STRING$(4, 131) + CHR$(188) + CHR$(26) + STRING$(6, 24) + CHR$(191) + STRING$(4, 176) + CHR$(191)
140 E$ = STRING$(4, 8) + STRING$(10, 32) + CHR$(26) + STRING$(10, 8) + CHR$(26) + STRING$(10, 32)
145 RETURN

150 '            Set array to initial piece arrangement
160 A$(1) = K$: A$(2) = E$: A$(3) = E$: A$(4) = E$: A$(5) = E$
170 A$(6) = E$: A$(7) = E$: A$(8) = E$: A$(9) = E$
180 RETURN

190 '            Draw board
200 V$ = CHR$(195) + CHR$(191) + CHR$(208) + CHR$(191) + CHR$(209) + CHR$(191) + CHR$(208) + CHR$(191) + CHR$(200)
210 PRINT: PRINT V$ V$ V$ V$ V$ V$ V$ V$ V$ V$ V$ V$ V$ V$;
220 PRINT @ 3, STRING$(53, 176);
230 PRINT @ 324, STRING$(51, 140);
240 PRINT @ 644, STRING$(51, 140);
250 PRINT @ 963, STRING$(53, 131);
260 POKE 15700, 191: POKE 15718, 191
270 POKE 16020, 191: POKE 16038, 191
280 RETURN

290 '            King's move
300 ST$ = "1"
310 R2 = RND(4): IF R2 = 2 THEN 310
320 IF R2 = 1 THEN IF CU = 3 OR CU = 6 THEN 310
330 IF R2 = 4 THEN IF CU = 3 OR CU = 7 THEN 310
340 IF CU + R2 > 9 THEN 310
350 OC = CU: CU = CU + R2
360 ST$ = ST$ + MID$(STR$(CU), 2, 1)
370 GOSUB 410
380 IF CU = 9 THEN OC = CU: CU = 1: ELSE 310
390 IF LEN(ST$) = 3 THEN PRINT @ 442, "SHORT-";: PRINT @ 506, "EST";: PRINT @ 570, "PATH:";: PRINT @ 634, ST$;: GOTO 390
400 RETURN

410 '            Print current king position
420 A$(OC) = E$: A$(CU) = K$
430 FOR I = 1 TO 75: NEXT I
440 PRINT @ 138, A$(1);: PRINT @ 156, A$(2);
450 PRINT @ 173, A$(3);: PRINT @ 457, A$(4);
460 PRINT @ 475, A$(5);: PRINT @ 492, A$(6);
470 PRINT @ 777, A$(7);: PRINT @ 795, A$(8);
480 PRINT @ 813, A$(9);
490 RETURN