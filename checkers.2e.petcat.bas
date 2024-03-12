 1000 rem       checkers.bas
 1010 rem-------------------------------
 1100 rem       main program
 1110 gosub 1300: rem initialization
 1120 gosub 1500: rem initialize array
 1130 gosub 2800: rem computer 1st move
 1140 gosub 1800: rem draw checkerboard
 1150 gosub 2000: rem print current
 1160 gosub 2400: rem input
 1170 gosub 2500: rem change array
 1180 gosub 2000: rem print current
 1190 if m$="x" then 1160: rem d/t jumps
 1200 gosub 2900: rem evaluation routine
 1210 goto 1150
 1220 rem-------------------------------
 1300 rem       initialization
 1310 print chr$(147);
 1320 z = rnd(-ti)
 1330 dim t$(11,11)
 1340 bl$ = "W": wh$ = "Q"
 1350 kw$ = "Z": er$ = " "
 1351 d1$ = chr$(17)
 1352 r1$ = chr$(29)
 1354 r3$ = r1$ + r1$ + r1$
 1355 rt$ = r3$ + r3$ + r3$ + r1$
 1356 rf$ = rt$ + rt$ + rt$ + rt$
 1357 l1$ = chr$(157)
 1358 u1$ = chr$(145)
 1360 return
 1370 rem-------------------------------
 1500 rem       initialize array
 1510 for i = 2 to 9
 1520 :  for j = 2 to 9
 1530 :    t$(i,j) = er$
 1540 :  next j
 1550 next i
 1560 for i = 2 to 4 step 2
 1570 : for j = 2 to 8 step 2
 1580 :   t$(i,j) = wh$
 1590 : next j
 1600 next i
 1610 for i = 3 to 9 step 2
 1620 :  t$(3,i) = wh$
 1630 next i
 1640 for i = 7 to 9 step 2
 1650 : for j = 3 to 9 step 2
 1660 :   t$(i,j) = bl$
 1670 : next j
 1680 next i
 1690 for i = 2 to 8 step 2
 1700 : t$(8,i) = bl$
 1710 next i
 1720 return
 1730 rem-------------------------------
 1800 rem       draw checkerboard
 1810 d$ = "{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}": l$ = "     "
 1820 r$ = d$+l$+d$+l$+d$+l$+d$+l$
 1830 s$ = l$+d$+l$+d$+l$+d$+l$+d$
 1840 print r$r$r$s$s$s$r$r$r$s$s$s$;
 1850 print r$r$r$s$s$s$r$r$r$s$s$s$;
 1860 return
 1870 rem-------------------------------
 2000 rem       print current
 2010 rem       arrangement of pieces
 2020 print chr$(19) r3$ r1$ r1$;
 2030 for i = 9 to 3 step -2
 2040 : for j = 3 to 9 step 2
 2050 :   print right$(str$(i),1);
 2060 :   print right$(str$(j),1);
 2070 :   print d1$ d1$ t$(i,j);
 2080 :   print u1$ u1$ r3$ r3$ r1$;
 2090 : next j
 2100 : print rf$ rf$ rf$ rf$ rf$;
 2110 next i
 2120 print chr$(19): print d1$;
 2130 for i = 8 to 2 step -2
 2140 : for j = 2 to 8 step 2
 2150 :   print right$(str$(i),1);
 2160 :   print right$(str$(j),1);
 2170 :   print d1$ d1$ t$(i,j);
 2180 :   print u1$ u1$ r3$ r3$ r1$;
 2190 : next j
 2200 : if i = 2 then 2220
 2210 : print rf$ rf$ rf$ rf$ rf$;
 2220 next i
 2230 return
 2240 rem-------------------------------
 2400 rem       input
 2410 b$ = "":           rem null string
 2420 get a$: if a$ = "" then 2420
 2430 b$ = b$ + a$
 2440 if len(b$) <> 5 then 2420
 2445 if mid$(b$,3,1)<>"-" and mid$(b$,3,1)<>"x" then print b$: end
 2450 return
 2460 rem-------------------------------
 2500 rem       change array to reflect
 2510 rem       new board position
 2520 i = val(left$(b$,1))
 2530 j = val(mid$(b$,2,1))
 2540 k = val(mid$(b$,4,1))
 2550 l = val(right$(b$,1))
 2560 m$ = mid$(b$,3,1)
 2570 if k=i-2 andl=j-2 then t$(k,l)=kw$:   t$(i,j)=er$:t$(i-1,j-1)=er$:goto2650
 2580 if k=i-2 andl=j+2 then t$(k,l)=kw$:   t$(i,j)=er$:t$(i-1,j+1)=er$:goto2650
 2590 if k=9 then t$(k,l)=kw$: goto 2620
 2600 if t$(i,j) = kw$ then t$(k,l) =kw$:     goto 2620
 2610 t$(k,l) = wh$
 2620 t$(i,j) = er$
 2630 if k = i+2 and l = j+2 then             t$(k-1,l-1) = er$: goto 2650
 2640 if k = i+2 and l = j-2 then             t$(k-1,l+1) = er$
 2650 return
 2660 rem-------------------------------
 2800 rem       computer's first move
 2810 ra = int(rnd(1) * 4 + 1)
 2820 if ra = 1 then t$(7,3) = er$:           t$(6,4) = bl$
 2830 if ra = 2 then t$(7,5) = er$:           t$(6,4) = bl$
 2840 if ra = 3 then t$(7,5) = er$:           t$(6,6) = bl$
 2850 if ra = 4 then t$(7,7) = er$:           t$(6,6) = bl$
 2860 return
 2870 rem-------------------------------
 2900 rem       evaluation routine
 2910 rem       a. black looking for
 2920 rem          jump possibilities
 2930 for i = 2 to 9
 2940 for j = 2 to 9
 2950 if t$(i,j) <> bl$ then 3000
 2960 if t$(i-1,j+1)=wh$ and t$(i-2,j+2)=     er$ then t$(i-1,j+1)=er$:goto 2970
 2965 goto 2980
 2970 t$(i-2,j+2) = bl$: t$(i,j) = er$:       goto 3320
 2980 if t$(i-1,j-1)=wh$ and t$(i-2,j-2)=     er$ then t$(i-1,j-1)=er$:goto 2990
 2985 goto 3000
 2990 t$(i-2,j-2) = bl$: t$(i,j) = er$:       goto 3320
 3000 next j
 3010 next i
 3020 rem       b. black guarding itself
 3030 rem          against a jump
 3040 for i = 2 to 9
 3050 for j = 2 to 9
 3060 if t$(i,j) <> bl$ then 3150
 3070 if t$(i-1,j-1)=wh$ and t$(i+1,j+1)      = er$ then 3110
 3080 if t$(i-1,j+1)=wh$ and t$(i+1,j-1)      = er$ then 3130
 3090 if t$(i-1,j+1) <> wh$ then 3150
 3100 if t$(i+1,j-1) <> er$ then 3150
 3110 if t$(i+2,j) = bl$ then t$(i+2,j)=      er$: t$(i+1,j+1) = bl$: goto 3320
 3120 if t$(i+2,j+2)=bl$ then t$(i+2,j+2)     = er$: t$(i+1,j+1)=bl$: goto 3320
 3130 if t$(i+2,j-2)=bl$ then t$(i+2,j-2)     = er$: t$(i+1,j-1)=bl$: goto 3320
 3140 if t$(i+2,j) = bl$ then t$(i+2,j)       = er$: t$(i+1,j-1)=bl$: goto 3320
 3150 next j
 3160 next i
 3170 rem       c. black looking for a
 3180 rem          move which won't
 3190 rem          result in a capture
 3200 rem          of black's man
 3210 for i = 2 to 9
 3220 for j = 2 to 9
 3230 if t$(i,j) <> bl$ then 3300
 3240 if t$(i-2,j)=wh$ and t$(i,j-2)=er$      then 3270
 3250 if t$(i-2,j-2) = wh$ then 3270
 3260 if t$(i-1,j-1) = er$ then t$(i,j)=      er$: t$(i-1,j-1) = bl$: goto 3320
 3270 if t$(i-2,j)=wh$ and t$(i,j+2)=er$      then 3300
 3280 if t$(i-2,j+2) = wh$ then 3300
 3290 if t$(i-1,j+1) = er$ then t$(i,j)=      er$: t$(i-1,j+1) = bl$: goto 3320
 3300 next j
 3310 next i
 3311 rem       d. make any other move
 3312 for i = 2 to 9
 3313 for j = 2 to 9
 3314 if t$(i,j) <> bl$ then 3317
 3315 if t$(i-1,j-1) = er$ then t$(i,j)=      er$: t$(i-1,j-1) = bl$: goto 3320
 3316 if t$(i-1,j+1) = er$ then t$(i,j)=      er$: t$(i-1,j+1) = bl$: goto 3320
 3317 next j
 3318 next i
 3320 rem       set array edges to nulls
 3330 t$(0,0) = "": t$(0,1) = ""
 3340 t$(1,0) = "": t$(1,1) = ""
 3350 t$(10,10) = "": t$(10,11) = ""
 3360 t$(11,10) = "": t$(11,11) = ""
 3370 return
 3380 rem-------------------------------
10000 rem checksum generator
10010 mc = peek(43) + 256 * peek(44)
10020 ln = peek(mc+2) + 256*peek(mc+3)
10030 if ln > 9999 then end
10040 mc = mc+2: if c=3 then c=0: print
10050 for k = 1 to 2
10060 : va=peek(mc): mc=mc+1: cs=cs+va
10070 next k
10080 va=peek(mc): mc=mc+1: cs=cs+va: if va <> o then 10080
10090 nc$ = left$(str$(ln)+":     ",6)+ left$(str$(cs) + "       ",7)
10100 print nc$;:c=c+1:cs=0:goto 10020