1000 REM       AUTOWRITER.BAS
1010 REM-------------------------------
1100 REM       MAIN PROGRAM
1110 GOSUB 1200:    REM INITIALIZATION
1120 GOSUB 2000:    REM GENERATE SENTNC
1130 GOTO 1120
1140 REM-------------------------------
1200 REM       INITIALIZATION
1205 Z = RND(-TI)
1210 PRINT CHR$(147)
1220 PRINT: PRINT: PRINT TAB(5);
1300 REM       ARTICLES
1310 AR = 1: DIM AR$(AR)
1320 FOR K=1 TO AR: READ AR$(K): NEXT K
1330 DATA THE
1400 REM       ADJECTIVES
1410 AD = 5: DIM AD$(AD)
1420 FOR K=1 TO AD: READ AD$(K): NEXT K
1430 DATA MATERIALISTIC,WAR-MONGERING
1440 DATA AGGRESSIVE,IMPERIALIST,GREEDY
1500 REM       NOUNS
1510 NU = 3: DIM NU$(NU)
1520 FOR K=1 TO NU: READ NU$(K): NEXT K
1530 DATA FREE COMMUNIST DEMOCRACIES,        PEACE-LOVING SOCIALIST PEOPLES
1540 DATA IDEALISTIC MARXIST PEOPLES
1600 REM       PROP. NOUNS/NOUN PHRASES
1610 PN = 3: DIM PN$(PN)
1620 FOR K=1 TO PN: READ PN$(K): NEXT K
1630 DATA WESTERNERS
1640 DATA WESTERN ENEMIES OF PEACE
1650 DATA CAPITALIST GOVERNMENTS
1700 REM       VERBS
1710 VE = 5: DIM VE$(VE)
1720 FOR K=1 TO VE: READ VE$(K): NEXT K
1730 DATA SLANDER,SABOTAGE,ATTACK
1740 DATA VILIFY,HATE
1800 REM       ADVERBS
1810 AV = 5: DIM AV$(AV)
1820 FOR K=1 TO AV: READ AV$(K): NEXT K
1830 DATA MALICIOUSLY,BITTERLY,SLYLY
1840 DATA VENOMOUSLY,FALSELY
1980 RETURN
1990 REM-------------------------------
2000 REM       GENERATE SENTENCE
2005 RA = INT(RND(1) * 2 + 1): REM ART?
2010 IF RA = 1 THEN GOSUB 3000: REM YES 
2020 GOSUB 3100: REM GET 0,1, OR 2 ADJS
2030 GOSUB 3300: REM GET NP/SUBJECT
2040 GOSUB 3500: REM GET 0 OR 1 ADVERB
2050 GOSUB 3400: REM GET VERB
2060 RA = INT(RND(1) * 2 + 1): REM ART?
2065 IF RA = 1 THEN GOSUB 3000: REM YES
2070 GOSUB 3200: REM GET NP/OBJECT
2080 GOSUB 4200: REM ADD PUNC. & PRINT
2980 RETURN
2990 REM-------------------------------
3000 REM       GET ARTICLE
3010 SE$=SE$+" "+ AR$(INT(RND(1)*AR+1))
3020 RETURN
3030 REM-------------------------------
3100 REM       GET 0,1, OR 2 ADJECTIVES
3110 RA = INT(RND(1) * 3 + 1)
3120 IF RA > 1 THEN 3140
3130 IF RA = 1 THEN 3170
3140 SE$=SE$+" "+ AD$(INT(RND(1)*AD+1))
3150 IF CF = 1 THEN RETURN
3160 RA = INT(RND(1) * 2 + 1): IF RA = 1     THEN CF = 1: GOSUB 3140
3170 CF = 0
3180 RETURN
3190 REM-------------------------------
3200 REM       GET NOUN
3210 SE$=SE$+" "+ NU$(INT(RND(1)*NU+1))
3220 RETURN
3230 REM-------------------------------
3300 REM       GET PROPER NOUN
3310 SE$=SE$+" "+ PN$(INT(RND(1)*PN+1))
3320 RETURN
3330 REM-------------------------------
3400 REM       GET VERB
3410 SE$=SE$+" "+ VE$(INT(RND(1)*VE+1))
3420 RETURN
3430 REM-------------------------------
3500 REM       GET 0 OR 1 ADVERB
3510 RA = INT(RND(1) * 2 + 1)
3520 IF RA = 1 THEN 3540
3530 IF RA = 2 THEN 3550
3540 SE$=SE$+" "+ AV$(INT(RND(1)*AV+1))
3550 RETURN
3560 REM-------------------------------
3600 REM       GET PREPOSITION
3610 SE$=SE$+" "+ PR$(INT(RND(1)*PR+1))
3620 RETURN
3630 REM-------------------------------
3700 REM       GET PREPOSITIONAL PHRASE
3710 GOSUB 3600:   REM GET PREPOSITION
3720 GOSUB 3000:   REM GET ARTICLE
3730 GOSUB 3100:   REM GET 0,1,2 ADJS
3740 GOSUB 3200:   REM GET NOUN
3750 REM-------------------------------
4000 REM       CHECK ARTICLES
4010 FOR K = 1 TO LEN(SE$) - 2
4020 IF MID$(SE$,K,3)<>" A " THEN 4070
4030 B$ = MID$(SE$,K+3,1)
4040 IF B$ = "A" OR B$ = "E" OR B$ = "I"     OR B$ = "O" OR B$ = "U" THEN 4060
4050 GOTO 4070
4060 SE$ = LEFT$(SE$,K+1) + "N" +            MID$(SE$,K+2)
4070 NEXT K
4080 FOR K = 1 TO LEN(SE$) - 2
4090 IF MID$(SE$,K,4)<>" AN " THEN 4130
4100 B$ = MID$(SE$,K+4,1)
4110 IF B$ = "A" OR B$ = "E" OR B$ = "I"     OR B$ = "O" OR B$ = "U" THEN 4130
4120 SE$ = LEFT$(SE$,K+1) +                  MID$(SE$,K+3)
4130 NEXT K 
4140 RETURN
4150 REM-------------------------------
4200 REM       ADD PUNCTUATION, FORMAT
4210 REM       THE SENTENCE, AND PRINT
4220 SE$ = SE$ + "."
4230 FOR K = 1 TO LEN(SE$)
4240 : L$ = MID$(SE$,K,1)
4250 : IF POS(0) < 30 THEN 4270
4260 : IF POS(0) => 30 THEN IF L$ = " "        THEN PRINT CHR$(13);
4270 : PRINT L$;
4280 NEXT K
4340 SE$ = "":      REM NULL CHARACTER
4350 RETURN
4360 REM-------------------------------