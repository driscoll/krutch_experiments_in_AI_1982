 1000 rem       tf.bas
 1010 rem-------------------------------
 1100 rem       main program
 1110 gosub 1200: rem initialization
 1120 gosub 1300: rem first le inputs
 1130 gosub 1400: rem input
 1140 gosub 1800: rem printing, score
 1150 gosub 1500: rem location update
 1160 gosub 1700: rem match-ptrn update
 1170 gosub 1600: rem location calc
 1180 goto 1130
 1190 rem-------------------------------
 1200 rem       initialization
 1210 z = rnd(-ti)
 1220 dim q(1111,2)
 1230 le = 4
 1240 print chr$(147)
 1250 d1$ = chr$(17)
 1260 return
 1270 rem-------------------------------
 1300 rem       first le inputs from
 1310 rem       player
 1320 for k = 1 to le
 1330 : gosub 1400
 1340 : mp(k) = cd
 1350 next k
 1360 return
 1370 rem-------------------------------
 1400 rem       input
 1410 print d1$ d1$ d1$ "go"
 1420 get ip$: if ip$ = "t" then cd = 1:      goto 1450
 1430 if ip$ = "f" then cd=0: goto 1450
 1440 goto 1420
 1450 print chr$(147)
 1460 return
 1470 rem-------------------------------
 1500 rem       location update
 1510 if cd=1 then q(lo,1) = q(lo,1) + 1:     goto 1530
 1520 if cd=0 then q(lo,2) = q(lo,2) + 1
 1530 return
 1540 rem-------------------------------
 1600 rem       location calculation
 1610 a$ = "":        rem null character
 1620 for k = 1 to le
 1630 :  a$ = a$ + mid$(str$(mp(k)),2)
 1640 next k
 1650 lo = val(a$)
 1660 return
 1670 rem-------------------------------
 1700 rem       match-pattern update
 1710 for k = 1 to le - 1
 1720 : mp(k) = mp(k + 1)
 1730 next k
 1740 mp(le) = cd
 1750 return
 1760 rem-------------------------------
 1800 rem printing and scorekeeping
 1810 print chr$(147) d1$ d1$ d1$ d1$
 1820 print "you typed:                        " ip$
 1830 print "computer was predicting:          ";
 1840 if q(lo,1) > q(lo,2) then tf$ =         "t": t = t+1: print tf$: goto 1890
 1850 if q(lo,2) > q(lo,1) then tf$ =         "f": f = f+1: print tf$: goto 1890
 1860 ra = int(rnd(1) * 2) + 1
 1870 if ra = 1 then tf$ = "t": t = t+1:      print tf$
 1880 if ra = 2 then tf$ = "f": f = f+1:      print tf$
 1890 if tf$ = ip$ then nc = nc + 1
 1900 print "total number of entries:         " t + f
 1910 print "number of correct pre-"
 1920 print "dictions by the computer:        " nc
 1930 print "percent of correct pre-"
 1940 print "dictions by the computer:        " int(((nc/(t+f))*100)*10+.5)/10;
 1950 print "%"
 1960 return
 1970 rem-------------------------------
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
