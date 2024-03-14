1000 REM       TF.BAS
1010 REM-------------------------------
1100 REM       MAIN PROGRAM
1110 GOSUB 1200: REM INITIALIZATION
1120 GOSUB 1300: REM FIRST LE INPUTS
1130 GOSUB 1400: REM INPUT
1140 GOSUB 1800: REM PRINTING, SCORE
1150 GOSUB 1500: REM LOCATION UPDATE
1160 GOSUB 1700: REM MATCH-PTRN UPDATE
1170 GOSUB 1600: REM LOCATION CALC
1180 GOTO 1130
1190 REM-------------------------------
1200 REM       INITIALIZATION
1210 Z = RND(-TI)
1220 DIM Q(1111,2)
1230 LE = 4
1240 PRINT CHR$(147)
1250 D1$ = CHR$(17)
1260 RETURN
1270 REM-------------------------------
1300 REM       FIRST LE INPUTS FROM
1310 REM       PLAYER
1320 FOR K = 1 TO LE
1330 : GOSUB 1400
1340 : MP(K) = CD
1350 NEXT K
1360 RETURN
1370 REM-------------------------------
1400 REM       INPUT
1410 PRINT D1$ D1$ D1$ "GO"
1420 GET IP$: IF IP$ = "T" THEN CD = 1:      GOTO 1450
1430 IF IP$ = "F" THEN CD=0: GOTO 1450
1440 GOTO 1420
1450 PRINT CHR$(147)
1460 RETURN
1470 REM-------------------------------
1500 REM       LOCATION UPDATE
1510 IF CD=1 THEN Q(LO,1) = Q(LO,1) + 1:     GOTO 1530
1520 IF CD=0 THEN Q(LO,2) = Q(LO,2) + 1
1530 RETURN
1540 REM-------------------------------
1600 REM       LOCATION CALCULATION
1610 A$ = "":        REM NULL CHARACTER
1620 FOR K = 1 TO LE
1630 :  A$ = A$ + MID$(STR$(MP(K)),2)
1640 NEXT K
1650 LO = VAL(A$)
1660 RETURN
1670 REM-------------------------------
1700 REM       MATCH-PATTERN UPDATE
1710 FOR K = 1 TO LE - 1
1720 : MP(K) = MP(K + 1)
1730 NEXT K
1740 MP(LE) = CD
1750 RETURN
1760 REM-------------------------------
1800 REM PRINTING AND SCOREKEEPING
1810 PRINT CHR$(147) D1$ D1$ D1$ D1$
1820 PRINT "YOU TYPED:                        " IP$
1830 PRINT "COMPUTER WAS PREDICTING:          ";
1840 IF Q(LO,1) > Q(LO,2) THEN TF$ =         "T": T = T+1: PRINT TF$: GOTO 1890
1850 IF Q(LO,2) > Q(LO,1) THEN TF$ =         "F": F = F+1: PRINT TF$: GOTO 1890
1860 RA = INT(RND(1) * 2) + 1
1870 IF RA = 1 THEN TF$ = "T": T = T+1:      PRINT TF$
1880 IF RA = 2 THEN TF$ = "F": F = F+1:      PRINT TF$
1890 IF TF$ = IP$ THEN NC = NC + 1
1900 PRINT "TOTAL NUMBER OF ENTRIES:         " T + F
1910 PRINT "NUMBER OF CORRECT PRE-"
1920 PRINT "DICTIONS BY THE COMPUTER:        " NC
1930 PRINT "PERCENT OF CORRECT PRE-"
1940 PRINT "DICTIONS BY THE COMPUTER:        " INT(((NC/(T+F))*100)*10+.5)/10;
1950 PRINT "%"
1960 RETURN
1970 REM-------------------------------