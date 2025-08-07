 1000 rem       kingmove.bas
 1010 rem-------------------------------
 1100 rem       main program
 1110 gosub 1200: rem initialization
 1120 gosub 1400: rem initialize array
 1130 gosub 1500: rem draw board
 1140 gosub 1900: rem print cur kg posn
 1150 gosub 1700: rem king's move
 1160 gosub 1900: rem print cur kg posn
 1170 goto 1150
 1180 rem-------------------------------
 1200 rem       initialiization
 1210 print chr$(147);
 1220 z = rnd(-ti)
 1230 cu = 1
 1240 d1$ = chr$(17)
 1250 d5$ = d1$ + d1$ + d1$ + d1$ + d1$
 1260 l1$ = chr$(157)
 1270 l3$ = l1$ + l1$ + l1$
 1280 l8$ = l3$ + l3$ + l1$ + l1$
 1290 r1$ = chr$(29)
 1300 r3$ = r1$ + r1$ + r1$
 1310 r5$ = r3$ + r1$ + r1$
 1320 u1$ = chr$(145)
 1330 ka$ = "O" + "{CBM-Y}" + l1$ + u1$ + "{SHIFT-+}" + d1$ + "P" + l3$
 1340 kb$ = d1$ + "L" + "{CBM-P}" + "{SHIFT-@}" + d1$
 1350 k$ = ka$ + kb$
 1360 ea$ = "   " + l3$ + d1$
 1370 e$ = u1$ + ea$ + ea$ + ea$ + r3$
 1380 return
 1390 rem-------------------------------
 1400 rem       initialize array
 1410 a$(1) = k$
 1420 for k = 2 to 9
 1430 : a$(k) = e$
 1440 next k
 1450 return
 1460 rem-------------------------------
 1500 rem       draw board
 1510 v$ = "B" + "            "
 1520 for k = 1 to 24
 1530 : print v$ v$ v$ "B";
 1540 next k
 1550 h$ = r1$ + "{CBM-Y}{CBM-Y}{CBM-Y}{CBM-Y}{CBM-Y}{CBM-Y}{CBM-Y}{CBM-Y}{CBM-Y}{CBM-Y}{CBM-Y}{CBM-Y}"
 1560 print chr$(19);
 1570 for k = 1 to 3
 1580 : print h$ h$ h$ r1$ d5$
 1590 next k
 1600 print h$ h$ h$;
 1610 return
 1620 rem-------------------------------
 1700 rem       king's move
 1710 st$ = "1"
 1720 ra = int(rnd(1) * 4 + 1): if ra = 2 then 1720
 1730 if ra = 1 then if cu = 3 or cu = 6 then 1720
 1740 if ra = 4 then if cu = 3 or cu = 7 then 1720
 1750 if cu + ra > 9 then 1720
 1760 pc = cu: cu = cu + ra
 1770 st$ = st$ + mid$(str$(cu),2,1)
 1780 gosub 1900: rem print cur kg posn
 1790 if cu = 9 then pc = cu: cu = 1: goto 1810
 1800 goto 1720
 1810 if len(st$) <> 3 then 1830
 1820 print chr$(19) "shortest path: ";: print st$: goto 1820
 1830 return
 1840 rem-------------------------------
 1900 rem       print current king posn
 1910 print l8$ u1$ u1$ e$ chr$(19)
 1920 a$(pc) = e$: a$(cu) = k$
 1930 for k = 1 to 9
 1940 : print r5$ a$(k) r5$;
 1950 : if k=3 or k=6 then print d1$;
 1960 next k
 1970 return
 1980 rem-------------------------------
