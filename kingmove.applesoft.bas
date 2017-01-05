1 REM KINGSMOVE 

2 REM Written in Microsoft Level II BASIC for the TRS-80 
: REM     by John Krutch in 1982
: REM Ported to Applesoft BASIC by Kevin Driscoll in 2017
: REM Tested on jsbasic by Joshua Bell
: REM https://github.com/inexorabletash/jsbasic

10 REM Supervisor
20 GOSUB 90  : REM Initialization
30 GOSUB 150 : REM Set array to initial piece arrangement
40 GOSUB 190 : REM Draw board
50 GOSUB 410 : REM Print current king position
60 GOSUB 290 : REM King's move
70 GOSUB 410
80 GOTO 30

90 REM Initialization
100 HOME: GR
110 OC = 0
120 CU = 1
130 DIM A(9)
140 SEED = -1
145 RETURN

150 REM Set array to initial piece arrangement
153 GR
155 SEED = INT(RND(1)*100)+1: R = RND(SEED)
160 FOR I = 1 TO 9: A(I) = 0: NEXT I
170 A(1) = 1
180 RETURN

190 REM Draw board
200 COLOR= 1 : REM Magenta
210 FOR N = 0 TO 3
220 HLIN 0, 39 AT N*13
230 VLIN 0, 39 AT N*13
240 NEXT N
250 RETURN

290 REM King's move
300 ST$ = "1"
310 R2 = INT(RND(R)*4)+1: REM Select random number in {1,2,3,4}
315 IF R2 = 2 THEN 310
320 IF R2 = 1 THEN IF CU = 3 OR CU = 6 THEN 310
330 IF R2 = 4 THEN IF CU = 3 OR CU = 7 THEN 310
340 IF CU + R2 > 9 THEN 310
350 OC = CU: CU = CU + R2
360 ST$ = ST$ + "->" + STR$(CU)
370 GOSUB 410
380 IF CU = 9 THEN OC = 0: CU = 1: PRINT: PRINT: PRINT ST$: GOTO 390
385 GOTO 310
390 IF LEN(ST$) <= 7 THEN FOR I = 1 TO 500: NEXT I
: PRINT "SHORTEST PATH!": END
400 RETURN

410 REM Print current king position
420 A(OC) = 1: A(CU) = 1
430 FOR I = 1 TO 250: NEXT I
440 FOR I = 1 TO 9
450 IF A(I) = 1 THEN GOSUB 510
460 NEXT I
490 RETURN

510 REM Draw king
515 COLOR= 11 : REM Pink
520 X = I-1 - INT((I-1)/3)*3
530 Y = INT((I-1)/3)
540 FOR N = 1 TO 12: HLIN (X*13)+1, (X*13)+12 AT N+(Y*13): NEXT N
560 RETURN