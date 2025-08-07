    1 rem         infer. bas
    2 rem----------------------------------
   10 rem        main program
   20 gosub 100: rem initialization
   30 gosub 160: rem input
   40 gosub 200: rem determine control
   50 if x=1 then gosub 550: rem interrog.
   60 if x=2 then gosub 830: rem requests
   70 if x=3 then gosub 290: rem declar.
   80 goto 30
   90 rem---------------------------------
  100 rem       initialization
  110 print chr$(147);
  120 for i = 0 to 9
  130 : a$(0,i) = "x"
  140 next i
  150 return
  155 rem--------------------------------
  160 rem       input
  170 x = 0
  180 input da$
  190 return
  195 rem--------------------------------
  200 rem       determine where to send
  205 rem       control
  210 da$ = left$(da$,len(da$) - 1)
  220 if mid$(da$,1,3) = "is " then x = 1:    goto 280
  230 if mid$(da$,1,8) = "request " then      x = 2: goto 280
  240 for i = 1 to len(da$)
  250 : if mid$(da$,i,4) = " is " then          x = 3: goto 280
  260 next i
  270 x = 4
  280 return
  285 rem--------------------------------
  290 rem       declarative sentences
  300 rem       a. parser
  310 dl$ = left$(da$,i-1): dr$ =             mid$(da$,i+4)
  320 for i = 1 to 6
  330 : read ar$
  340 : if mid$(dl$,1,len(ar$)) = ar$ then      dl$ = mid$(dl$,len(ar$) + 1)
  350 next i
  360 restore
  370 for i = 1 to 6
  380 : read ar$
  390 : if mid$(dr$,1,len(ar$)) = ar$ then      dr$ = mid$(dr$,len(ar$) + 1)
  400 next i
  410 restore
  420 data " a ", " an ", " the ", "a ",      "an ", "the "
  430 rem       b. data storage
  440 for i = 0 to 9
  450 : if a$(0,i) = dl$ then 500
  460 next i
  470 for i = 0 to 9
  480 :  if a$(0,i) <> "x" then 490
  482 :  a$(0,i) = dl$
  484 :  a$(0,i + 1) = "x"
  486 :  a$(1,i) = dr$
  487 :  a$(2,i) = "x"
  488 :  goto 530
  490 next i
  500 for j = 1 to 9
  510 : if a$(j,i) = "x" then a$(j,i) =         dr$: a$(j+1,i) = "x": goto 530
  520 next j
  530 print "okay."
  540 return
  545 rem--------------------------------
  550 rem       interrogative sentences
  560 rem       a. parser
  570 da$ = mid$(da$,4)
  572 if mid$(da$,1,2) = "a " then da$ =      mid$(da$,3)
  574 if mid$(da$,1,3) = "an " then da$ =     mid$(da$,4)
  576 if mid$(da$,1,4) = "the " then da$      = mid$(da$,5)
  580 for i = 1 to len(da$)
  590 : for j = 1 to 3
  600 :   read ar$
  610 :   if mid$(da$,i,len(ar$)) <> ar$          then goto 620
  612 :   dl$ = left$(da$,i - 1)
  614 :   dr$ = mid$(da$,i + len(ar$))
  616 :   goto 660
  620 : next j
  630 : restore
  640 next i
  650 print "i don't understand.":            goto 820
  660 restore
  700 rem       b. data retrieval
  710 for i = 0 to 9
  720 : if a$(0,i) = dl$ then goto 750
  730 : if a$(0,i) = "x" then print             "i don't know.": goto 820
  740 next i
  750 for i = 1 to 9
  760 : for j = 0 to 9
  770 :   if a$(i,j) <> dr$ then 795
  780 :   if a$(0,j) = dl$ then print             "yes.": goto 820
  790 :   if a$(0,j) <> dl$ then dr$ =            a$(0,j): goto 750
  795 : next j
  800 next i
  810 print "i don't know."
  820 return
  825 rem--------------------------------
  830 rem       requests
  840 rem       a. parser
  850 dl$ = mid$(da$,9)
  860 rem       b. data retrieval
  870 for i = 0 to 9
  880 : if a$(0,i) = dl$ then 910
  890 next i
  900 print "i have no data concerning "      dl$ ".": goto 960
  910 print dl$ " is--"
  920 for j = 1 to 9
  930 : if a$(j,i) = "x" then 960
  940 : print a$(j,i)
  950 next j
  960 return
  970 rem--------------------------------
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
