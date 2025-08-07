1 '             AUTOWRITER , Vers. 1.1
2 CLEAR 1000

10 '            Supervisor
20 GOSUB 230    ' Initialization
30 GOSUB 430    ' Sentence with or without Proper noun?
40 IF RAN > 1 THEN 50 ELSE 90
50 GOSUB 460    ' Get article
60 GOSUB 490    ' Get adjective(s), if any
70 GOSUB 570    ' Get noun
80 GOTO 100
90 GOSUB 600    ' Get proper noun
100 GOSUB 630   ' Get verb

110 GOSUB 660   ' Get adverb, if any
120 GOSUB 700   ' Prepositional phrase?
130 IF RAN > 1 THEN 140 ELSE 200
140 GOSUB 730   ' Get preposition
150 GOSUB 460
160 GOSUB 490
170 GOSUB 570
180 GOSUB 760   ' Another prepositional phrase?
190 IF RAN > 1 THEN 140 ELSE 200
200 GOSUB 790   ' Check articles
210 GOSUB 870   ' Add punctuation to sentence and print
220 GOTO 30

230 '           Initialization
240 CLS: RANDOM
250 PRINT: PRINT "      ";
260 ARTNMB = 3
270 NOUNNMB = 13
280 PNOUNNMB = 4
290 ADJNMB = 17
300 VERBNMB = 6
310 AVNMB = 5
320 PREPNMB = 7
330 DIM NO$(13)
340 DIM AD$(17)
350 FOR I = 1 TO ARTNMB : READ AR$(I): NEXT I
360 FOR I = 1 TO NOUNNMB: READ NO$(I): NEXT I
370 FOR I = 1 TO PNOUNNMB: READ PN$(I): NEXT I
380 FOR I = 1 TO ADJNMB: READ AD$(I): NEXT I
390 FOR I = 1 TO VERBNMB: READ VE$(I): NEXT I
400 FOR I = 1 TO AVNMB : READ AV$(I): NEXT I
410 FOR I = 1 TO PREPNMB: READ PR$(I): NEXT I
420 RETURN

430 '           Sentence with or without Proper noun?
440 RAN = RND(3)
450 RETURN

460 '           Get article
470 SENT$ = SENT$ + " " + AR$(RND(ARTNBM))
480 RETURN

490 '           Get adjective(s), if any
500 RAN = RND(3)
510 IF RAN > 1 THEN 520 ELSE 560
520 SENT$ = SENT$ + " " + AD$(RND(ADJNMB))
530 IF Z = 1 THEN 550
540 RAN = RND(2): IF RAN = 1 THEN Z = 1: GOSUB 520
550 Z = 0
560 RETURN

570 '           Get noun
580 SENT$ = SENT$ + " " + NO$(RND(NOUNNMB))
590 RETURN

600 '           Get proper noun
610 SENT$ = SENT$ + " " + PN$(RND(PNOUNNMB))
620 RETURN

630 '           Get verb
640 SENT$ = SENT$ + " " + VE$(RND(VERBNMB))
650 RETURN

660 '           Get adverb, if any
670 RAN = RND(3): IF RAN >  1 THEN 680 ELSE 690
680 SENT$ = SENT$ + " " + AV$(RND(AVNMB))
690 RETURN

700 '           Prepositional phrase?
710 RAN = RND(3)
720 RETURN

730 '           Get preposition
740 SENT$ = SENT$ + " " + PR$(RND(PREPNMB))
750 RETURN

760 '           Another Prepositional phrase?
770 RAN = RND(2)
780 RETURN

790 '           Check articles
800 FOR I = 1 TO LEN(SENT$) - 2
810 IF MID$(SENT$, I, 3) = " A " THEN B$ = MID$(SENT$, I + 3, 1): IF B$ = "A" OR B$ = "E" OR B$ = "I" OR B$ = "O" OR B$ = "U" THEN SENT$ = LEFT$(SENT$, I + 1) + "N" + MID$(SENT$, I + 2)
820 NEXT I
830 FOR I = 1 TO LEN(SENT$) - 2
840 IF MID$(SENT$, I, 4) = " AN " THEN B$ = MID$(SENT$, I + 4, 1): IF B$ = "A" OR B$ = "E" OR B$ = "I" OR B$ = "O" OR B$ = "U" THEN 850 ELSE SENT$ = LEFT$(SENT$, I + 1) + MID$(SENT$, I + 3)
850 NEXT I
860 RETURN

870 '           Add punctuation to sentence and print
880 SENT$ = SENT$ + ". "
890 PRINT SENT$;
900 SENT$ = ""
910 RETURN

920 '           Vocabulary
930 '           A. Articles
940 DATA A, AN, THE
950 '           B. Nouns
960 DATA BLACK HOLE, SPACESHIP, STAR, PLANET, MOON, SUN
970 DATA COMET, GALACTIC FEDERATION, GALAXY, ASTEROID, METEOR
980 DATA ALIEN INVADER, GALACTIC PATROL
990 '           C. Proper Nouns
1000 DATA THE GALACTIC OVERLORD, BILL MCWERTY, SALLY, VOSH'KAN
1010 '          D. Adjectives
1020 DATA DARK, BRIGHT, PULSING, LONELY, MAGNIFICENT, DULL
1030 DATA RED, BLUE-WHITE , YELLOW, TINY, ENORMOUS, MONSTROUS
1040 DATA HORRIFYING, DISGUSTING, IMMENSE, LOVELY, AWESOME
1050 '          E. Verbs
1060 DATA STOPPED, FLEW, WENT, CONTINUED, SWERVED, SLOWED DOWN
1070 '          F. Adverbs
1080 DATA SLOWLY, LANGUIDLY, SWIFTLY, ERRATICALLY, SUDDENLY
1090 '          G. Prepositions
1100 DATA WITH, UNDER, BEHIND, OVER, NEAR, CLOSE TO, FAR FROM