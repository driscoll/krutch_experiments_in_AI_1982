1 '             FETCH, Vers. 3.1
2 CLEAR 500

10 '            Supervisor
20 GOSUB 100    ' Initialization
30 GOSUB 160    ' Input
40 GOSUB 200    ' Determine where to send control
50 IF X = 1 THEN GOSUB 550  ' Interrogative sentences
60 IF X = 2 THEN GOSUB 830  ' Requests
70 IF X = 3 THEN GOSUB 290  ' Declarative sentences
80 GOTO 30

100 '           Initialization
110 CLS
120 FOR I = 0 TO 9
130 A$(0, I) = "X"
140 NEXT I
150 RETURN

160 '           Input
170 X = 0
180 INPUT DA$
190 RETURN

200 '           Determine where to send control
210 DA$ = LEFT$(DA$, LEN(DA$) - 1)
220 IF MID$(DA$, 1, 3) = "IS " THEN X = 1: GOTO 280
230 IF MID$(DA$, 1, 8) = "REQUEST " THEN X = 2: GOTO 280
240 FOR I = 1 TO LEN(DA$)
250 IF MID$(DA$, I, 4) = " IS " THEN X = 3: GOTO 280
260 NEXT I
270 X = 4
280 RETURN

290 '           Declarative sentences
300 '           A. Parser
310 DL$ = LEFT$(DA$, I - 1): DR$ = MID$(DA$, I + 4)
320 FOR I = 1 TO 6
330 READ AR$
340 IF MID$(DL$, 1, LEN(AR$)) = AR$ THEN DL$ = MID$(DL$, LEN(AR$) + 1)
350 NEXT I
360 RESTORE 
370 FOR I = 1 TO 6
380 READ AR$
390 IF MID$(DR$, 1, LEN(AR$)) = AR$ THEN DR$ = MID$(DR$, LEN(AR$) + 1)
400 NEXT I
410 RESTORE

420 DATA " A ", " AN ", " THE ", "A ", "AN ", "THE "
430 '           B. Data storage
440 FOR I = 0 TO 9
450 IF A$(0, I) = DL$ THEN 500
460 NEXT I
470 FOR I = 0 TO 9
480 IF A$(0, I) = "X" THEN A$(0, I) = DL$: A$(0, I + 1) = "X": A$(1, I) = DR$: A$(2, I) = "X": GOTO 530
490 NEXT I
500 FOR J = 1 TO 9
510 IF A$(J, I) = "X" THEN A$(J, I) = DR$: A$(J + 1, I) = "X": GOTO 530
520 NEXT J
530 PRINT "OKAY."
540 RETURN

550 '           Interrogative sentences
560 '           A. Parser
570 DA$ = MID$(DA$, 4)
572 IF MID$(DA$, 1, 2) = "A " THEN DA$ = MID$(DA$, 3)
574 IF MID$(DA$, 1, 3) = "AN " THEN DA$ = MID$(DA$, 4)
576 IF MID$(DA$, 1, 4) = "THE " THEN DA$ = MID$(DA$, 5)
580 FOR I = 1 TO LEN(DA$)
590 FOR J = 1 TO 3
600 READ AR$
610 IF MID$(DA$, I, LEN(AR$)) = AR$ THEN DL$ = LEFT$(DA$, I - 1): DR$ = MID$(DA$, I + LEN(AR$)): GOTO 660
620 NEXT J
630 RESTORE
640 NEXT I
650 PRINT "I DON'T UNDERSTAND.": GOTO 820
660 RESTORE
700 '           B. Data retrieval
710 FOR I = 0 TO 9
720 IF A$(0, I) = DL$ THEN GOTO 750
730 IF A$(0, I) = "X" THEN PRINT "I DON'T KNOW.": GOTO 820
740 NEXT I
750 FOR I = 1 TO 9
760 FOR J = 0 TO 9
770 IF A$(I, J) = DR$ THEN 780 ELSE 800
780 IF A$(0, J) = DL$ THEN PRINT "YES.": GOTO 820
790 IF A$(0, J) <> DL$ THEN DR$ = A$(0, J): GOTO 750
800 NEXT J, I
810 PRINT "I DON'T KNOW."
820 RETURN

830 '           Requests
840 '           A. Parser
850 DL$ = MID$(DA$, 9)
860 '           B. Data retrieval
870 FOR I = 0 TO 9
880 IF A$(0, I) = DL$ THEN 910
890 NEXT I
900 PRINT "I HAVE NO DATA CONCERNING " DL$ ".": GOTO 960
910 PRINT DL$ " IS--"
920 FOR J = 1 TO 9
930 IF A$(J, I) = "X" THEN 960
940 PRINT A$(J, I)
950 NEXT J
960 RETURN