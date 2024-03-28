1000 REM       DOCTOR
1010 REM-------------------------------
1100 REM       MAIN PROGRAM
1110 GOSUB 1300:  REM INITIALIZATION
1120 GOSUB 2000:  REM INPUT
1130 GOSUB 2100:  REM SWAP FOR OPPOSITE
1140 GOSUB 2300:  REM KEYWRD PROCESSING
1150 GOSUB 2600:  REM DOCTOR'S REPLY
1160 GOTO 1120
1170 REM-------------------------------
1300 REM       INITIALIZATION
1310 PRINT CHR$(147)
1320 PRINT: PRINT
1330 Z = RND(-TI)
1340 TE = 14: TN = 14
1350 DIM TE$(TE): DIM TN$(TN)
1360 FOR K = 1 TO TE
1370 : READ TE$(K)
1380 : READ TN$(K)
1390 NEXT K
1400 DATA " MOM "," MOTHER "," DAD ",        " FATHER "," DREAMS "," DREAM "
1410 DATA " I "," YOU* "," YOU "," I ",      " ME "," YOU "," MY "," YOUR* "
1420 DATA " YOUR "," MY "," MYSELF ",        " YOURSELF* "
1430 DATA " YOURSELF "," MYSELF ",           " I'M "," YOU'RE* "
1440 DATA " YOU'RE "," I'M "," AM ",         " ARE "," WERE "," WAS "
1500 KE = 82
1510 DIM KE$(KE): DIM JU(KE)
1520 FOR K = 1 TO KE
1530 : READ KE$(K)
1540 : READ JU(K)
1550 NEXT K
1560 DATA COMPUTER,1,MACHINE,1," NAME ",     2,ALIKE,3," LIKE ",3," SAME ",3
1570 DATA YOU REMEMBER,4,DO I REMEMBER,      5,YOU DREAMED,6," DREAM ",7
1580 DATA " IF ",8,EVERYBODY,9,EVERYONE,     9,NOBODY,9,NO ONE,9,WAS YOU,10
1590 DATA YOU WAS,11,WAS I,12,               YOUR MOTHER,13,YOUR FATHER,13
1600 DATA YOUR SISTER,13,YOUR BROTHER,       13,YOUR WIFE,13,YOUR HUSBAND,13
1610 DATA YOUR CHILDREN,13,YOUR,14,          ALWAYS,15,ARE I,16,ARE YOU,18
1620 DATA " HOW ",25,BECAUSE,19,CAN I,       20,CAN YOU,21,CERTAINLY,22
1630 DATA DEUTSCH,23,ESPANOL,23,             FRANCAIS,23,HELLO,24
1640 DATA I REMIND YOU OF,3,I ARE,26,        I'M,26,ITALIAN0,23,MAYBE,28
1650 DATA " MY ",29," NO ",30,PERHAPS,       28,SORRY,31,"WHAT ",25,"WHEN ",25
1660 DATA WHY DON'T I,32,WHY CAN'T YOU,      33,YES,22,YOU WANT,34
1670 DATA YOU NEED,34," I ",27,              YOU ARE SAD,35,YOU'RE SAD,35
1680 DATA YOU ARE UNHAPPY,35,                YOU'RE UNHAPPY,35
1690 DATA YOU ARE DEPRESSED,35,              YOU'RE DEPRESSED,35
1700 DATA YOU ARE SICK,35,YOU'RE SICK,       35,YOU ARE HAPPY,36
1710 DATA YOU'RE HAPPY,36,                   YOU ARE ELATED,36,YOU'RE ELATED,36
1720 DATA YOU ARE GLAD,36,YOU'RE GLAD,       36,YOU ARE BETTER,36
1730 DATA YOU'RE BETTER,36,YOU FEEL YOU,     37,YOU THINK YOU,37
1740 DATA YOU BELIEVE YOU,37,                YOU WISH YOU,37,YOU ARE,38
1750 DATA YOU'RE,38,YOU CAN'T,39,            YOU CANNOT,39,YOU DON'T,40
1760 DATA YOU FEEL,41," ARE ",17
1970 PRINT "PLEASE STATE YOUR PROBLEM."
1980 RETURN
1990 REM-------------------------------
2000 REM       INPUT
2004 PRINT "-------------------------";
2006 PRINT "--------------"
2010 INPUT PA$
2020 EP$ = RIGHT$(PA$,1)
2030 IF EP$ = "." OR EP$ = "?" OR EP$ =      "!" THEN PA$=LEFT$(PA$,LEN(PA$)-1)
2040 PA$ = " " + PA$ + " "
2050 RETURN
2060 REM-------------------------------
2100 REM       SWAP WORD FOR OPPOSITE
2110 REM       FORM
2120 FOR K = 1 TO TE
2130 TE$ = TE$(K): TN$ = TN$(K)
2140 FOR P = 1 TO LEN(PA$)
2150 MS$ = MID$(PA$,P,LEN(TE$))
2160 IF TE$ = MS$ THEN PA$ = LEFT$(PA$,      P-1) + TN$ + MID$(PA$,P+LEN(TE$))
2170 NEXT P
2180 NEXT K
2190 FOR P = 1 TO LEN(PA$)
2200 IF MID$(PA$,P,1) = "*" THEN PA$ =       LEFT$(PA$,P-1) + MID$(PA$,P+1)
2210 NEXT P
2220 RETURN
2230 REM-------------------------------
2300 REM       KEYWORD PROCESSING
2310 FOR K = 1 TO KE 
2320 KE$ = KE$(K): JU = JU(K)
2330 FOR P = 1 TO LEN(PA$)
2340 MS$ = MID$(PA$,P,LEN(KE$))
2350 IF KE$ <> MS$ THEN 2390
2360 DR$ = MID$(PA$,P+LEN(KE$))
2370 IF DR$ = "" THEN 2550
2380 IF DR$ <> "" THEN DR$ = LEFT$(DR$,      LEN(DR$)-1): GOTO 2550
2390 NEXT P
2400 NEXT K
2410 IF YR$ = "" THEN 2440
2420 RA = INT(RND(1) * 5 + 1)
2430 ON RA GOTO 2440, 2440, 2440, 2500,      2500
2440 RA = INT(RND(1) * 4 + 1)
2450 ON RA GOTO 2460, 2470, 2480, 2490
2460 PRINT "I AM NOT SURE I UNDERSTAND YOU FULLY.": JU = 42: GOTO 2550
2470 PRINT "PLEASE GO ON.": JU = 42:         GOTO 2550
2480 PRINT "WHAT DOES THAT SUGGEST TO YOU?": JU = 42: GOTO 2550
2490 PRINT "DO YOU FEEL STRONGLY ABOUT DISCUSSING SUCH THINGS?":JU=42:GOTO 2550
2500 RA = INT(RND(1) * 3 + 1)
2510 ON RA GOTO 2520, 2530, 2540
2520 PRINT "LET'S DISCUSS FURTHER WHY YOUR" + YR$ + ".": JU = 42: GOTO 2550
2530 PRINT "EARLIER YOU SAID YOUR" +         YR$ + ".": JU = 42: GOTO 2550
2540 PRINT"DOES THAT HAVE ANYTHING TO DO WITH THE FACT THAT YOUR"+YR$+".":JU=42
2550 RETURN
2560 REM-------------------------------
2600 REM       DOCTOR'S REPLY
2610 IF JU < 12 THEN 2650
2620 IF JU < 23 THEN JU = JU - 11: GOTO      2660
2630 IF JU < 34 THEN JU = JU - 22: GOTO      2670
2640 IF JU < 43 THEN JU = JU - 33: GOTO      2680
2650 ON JU GOTO 2720,2730,2740,2750,         2760,2770,2780,2790,2800,2810,2820
2660 ON JU GOTO 2830,2840,2850,2860,         2870,2880,2890,2900,2910,2920,2930
2670 ON JU GOTO 2940,2950,2960,2970,         2980,2990,3000,3010,3020,3070,3080
2680 ON JU GOTO 3090,3100,3110,3120,         3130,3140,3150,3160,3170
2720 PRINT "DO COMPUTERS WORRY YOU?":        GOTO 3170
2730 PRINT "I AM NOT INTERESTED IN NAMES.": GOTO 3170
2740 PRINT "IN WHAT WAY?": GOTO 3170
2750 PRINT "DO YOU OFTEN THINK OF" +         DR$ + "?": GOTO 3170
2760 PRINT "DID YOU THINK I WOULD FORGET" + DR$ + "?": GOTO 3170
2770 PRINT "REALLY," + DR$ + "?": GOTO       3170
2780 PRINT "WHAT DOES THAT DREAM SUGGEST TO YOU?": GOTO 3170
2790 PRINT "DO YOU THINK IT'S LIKELY THAT IF " + DR$ + "?": GOTO 3170
2800 PRINT "REALLY, " + KE$ + "?": GOTO      3170
2810 PRINT "WHAT IF YOU WERE" + DR$ +        "?": GOTO 3170
2820 PRINT "WERE YOU REALLY?":GOTO 3170
2830 PRINT "WOULD YOU LIKE TO BELIEVE I WAS" + DR$ + "?": GOTO 3170
2840 PRINT "TELL ME MORE ABOUT YOUR FAMILY.": GOTO 3170
2850 PRINT "YOUR" + DR$ + ".": IF LEN        (DR$) > 11 THEN YR$=DR$
2855 GOTO 3170
2860 PRINT "CAN YOU THINK OF A SPECIFIC EXAMPLE?": GOTO 3170
2870 PRINT "WHY ARE YOU INTERESTED IN WHETHER I AM" +DR$ + " OR NOT?":GOTO 3170
2880 PRINT "DID YOU THINK THEY MIGHT NOT BE " + DR$ + "?": GOTO 3170
2890 PRINT "DO YOU BELIEVE YOU ARE" +        DR$ + "?": GOTO 3170
2900 PRINT "IS THAT THE REAL REASON?":       GOTO 3170
2910 PRINT "YOU BELIEVE I CAN" + DR$ +       ", DON'T YOU?": GOTO 3170
2920 PRINT "WHETHER YOU CAN" + DR$+" DEPENDS ON YOU MORE THAN ON ME.":GOTO 3170
2930 PRINT "YOU SEEM QUITE POSITIVE.":       GOTO 3170
2940 PRINT "I AM SORRY, I SPEAK ONLY ENGLISH.": GOTO 3170
2950 PRINT "HOW DO YOU DO.": GOTO 3170
2960 PRINT "WHY DO YOU ASK?": GOTO 3170
2970 PRINT "WHAT MAKES YOU THINK I AM"       + DR$ + "?": GOTO 3170
2980 PRINT "WE WERE DISCUSSING YOU, NOT ME.": GOTO 3170
2990 PRINT "YOU DON'T SEEM QUITE CERTAIN.": GOTO 3170
3000 PRINT "WHY ARE YOU CONCERNED OVER MY " + DR$ + "?": GOTO 3170
3010 PRINT "ARE YOU SAYING 'NO' JUST TO BE NEGATIVE?": GOTO 3170
3020 RA = INT(RND(1) * 4 + 1): ON RA         GOTO 3030, 3040, 3050, 3060
3030 PRINT "PLEASE DON'T APOLOGIZE.":        GOTO 3170
3040 PRINT "APOLOGIES ARE NOT NECESSARY.": GOTO 3170
3050 PRINT "WHAT FEELINGS DO YOU HAVE WHEN YOU APOLOGIZE?": GOTO 3170
3060 PRINT "YOU NEEDN'T FEEL THAT YOU HAVE TO APOLOGIZE.": GOTO 3170
3070 PRINT "DO YOU BELIEVE I DON'T" +        DR$ + "?": GOTO 3170
3080 PRINT "DO YOU THINK YOU SHOULD BE ABLE TO" + DR$ + "?": GOTO 3170
3090 PRINT "WHAT WOULD IT MEAN TO YOU IF YOU GOT" + DR$ + "?": GOTO 3170
3100 PRINT "I AM SORRY TO HEAR IT.":         GOTO 3170
3110 PRINT "HOW HAVE I HELPED YOU TO BE?": GOTO 3170
3120 PRINT "DO YOU REALLY THINK SO?":        GOTO 3170 
3130 PRINT "IS IT BECAUSE YOU ARE"+DR$+      " THAT YOU CAME TO ME?": GOTO 3170
3140 PRINT "HOW DO YOU KNOW YOU CAN'T"       + DR$ + "?": GOTO 3170
3150 PRINT "DON'T YOU REALLY" + DR$ +        "?": GOTO 3170
3160 PRINT "TELL ME MORE ABOUT SUCH FEELINGS."
3170 RETURN
3180 REM-------------------------------