 1000 rem       autowriter.bas
 1010 rem-------------------------------
 1100 rem       main program
 1110 gosub 1200:    rem initialization
 1120 gosub 2000:    rem generate sentnc
 1130 goto 1120
 1140 rem-------------------------------
 1200 rem       initialization
 1205 z = rnd(-ti)
 1210 print chr$(147)
 1220 print: print: print tab(5);
 1300 rem       articles
 1310 ar = 3: dim ar$(ar)
 1320 for k=1 to ar: read ar$(k): next k
 1330 data a,an,the
 1400 rem       adjectives
 1410 ad = 4: dim ad$(ad)
 1420 for k=1 to ad: read ad$(k): next k
 1430 data dark,pulsing,tiny,shadowy
 1500 rem       nouns
 1510 nu = 2: dim nu$(nu)
 1520 for k=1 to nu: read nu$(k): next k
 1530 data spaceship,meteor
 1600 rem       prop. nouns/noun phrases
 1610 pn = 4: dim pn$(pn)
 1620 for k=1 to pn: read pn$(k): next k
 1630 data the galactic overlord
 1640 data commander courageous
 1650 data professor powermad
 1660 data the killer robot
 1700 rem       verbs
 1710 ve = 5: dim ve$(ve)
 1720 for k=1 to ve: read ve$(k): next k
 1730 data stopped,flew,swerved,moved
 1740 data slowed down
 1800 rem       adverbs
 1810 av = 6: dim av$(av)
 1820 for k=1 to av: read av$(k): next k
 1830 data slowly,languidly,swiftly
 1840 data erratically,suddenly,silently
 1900 rem       prepositions
 1910 pr = 4: dim pr$(pr)
 1920 for k=1 to pr: read pr$(k): next k
 1930 data under,behind,over,near
 1980 return
 1990 rem-------------------------------
 2000 rem       generate sentence
 2010 ra = int(rnd(1) * 2 + 1): rem pn?
 2020 if ra = 1 then gosub 3300:             goto 2060: rem yes, get pn & jump
 2030 gosub 3000: rem no, so get art
 2040 gosub 3100: rem get 0,1, or 2 adjs
 2050 gosub 3200: rem get noun
 2060 gosub 3400: rem get verb
 2070 gosub 3500: rem get 0 or 1 adverb
 2080 ra = int(rnd(1) * 2 + 1): rem pp?
 2090 if ra = 1 then gosub 3700: rem yes
 2100 gosub 4000: rem check articles
 2110 gosub 4200: rem add punc. & print
 2980 return
 2990 rem-------------------------------
 3000 rem       get article
 3010 se$=se$+" "+ ar$(int(rnd(1)*ar+1))
 3020 return
 3030 rem-------------------------------
 3100 rem       get 0,1, or 2 adjectives
 3110 ra = int(rnd(1) * 3 + 1)
 3120 if ra > 1 then 3140
 3130 if ra = 1 then 3170
 3140 se$=se$+" "+ ad$(int(rnd(1)*ad+1))
 3150 if cf = 1 then return
 3160 ra = int(rnd(1) * 2 + 1): if ra = 1     then cf = 1: gosub 3140
 3170 cf = 0
 3180 return
 3190 rem-------------------------------
 3200 rem       get noun
 3210 se$=se$+" "+ nu$(int(rnd(1)*nu+1))
 3220 return
 3230 rem-------------------------------
 3300 rem       get proper noun
 3310 se$=se$+" "+ pn$(int(rnd(1)*pn+1))
 3320 return
 3330 rem-------------------------------
 3400 rem       get verb
 3410 se$=se$+" "+ ve$(int(rnd(1)*ve+1))
 3420 return
 3430 rem-------------------------------
 3500 rem       get 0 or 1 adverb
 3510 ra = int(rnd(1) * 2 + 1)
 3520 if ra = 1 then 3540
 3530 if ra = 2 then 3550
 3540 se$=se$+" "+ av$(int(rnd(1)*av+1))
 3550 return
 3560 rem-------------------------------
 3600 rem       get preposition
 3610 se$=se$+" "+ pr$(int(rnd(1)*pr+1))
 3620 return
 3630 rem-------------------------------
 3700 rem       get prepositional phrase
 3710 gosub 3600:   rem get preposition
 3720 gosub 3000:   rem get article
 3730 gosub 3100:   rem get 0,1,2 adjs
 3740 gosub 3200:   rem get noun
 3750 rem-------------------------------
 4000 rem       check articles
 4010 for k = 1 to len(se$) - 2
 4020 if mid$(se$,k,3)<>" a " then 4070
 4030 b$ = mid$(se$,k+3,1)
 4040 if b$ = "a" or b$ = "e" or b$ = "i"     or b$ = "o" or b$ = "u" then 4060
 4050 goto 4070
 4060 se$ = left$(se$,k+1) + "n" +            mid$(se$,k+2)
 4070 next k
 4080 for k = 1 to len(se$) - 2
 4090 if mid$(se$,k,4)<>" an " then 4130
 4100 b$ = mid$(se$,k+4,1)
 4110 if b$ = "a" or b$ = "e" or b$ = "i"     or b$ = "o" or b$ = "u" then 4130
 4120 se$ = left$(se$,k+1) +                  mid$(se$,k+3)
 4130 next k
 4140 return
 4150 rem-------------------------------
 4200 rem       add punctuation, format
 4210 rem       the sentence, and print
 4220 se$ = se$ + "."
 4230 for k = 1 to len(se$)
 4240 : l$ = mid$(se$,k,1)
 4250 : if pos(0) < 30 then 4270
 4260 : if pos(0) => 30 then if l$ = " "         then print chr$(13);
 4270 : print l$;
 4280 next k
 4340 se$ = "":      rem null character
 4350 return
 4360 rem-------------------------------
