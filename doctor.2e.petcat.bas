 1000 rem       doctor
 1010 rem-------------------------------
 1100 rem       main program
 1110 gosub 1300:  rem initialization
 1120 gosub 2000:  rem input
 1130 gosub 2100:  rem swap for opposite
 1140 gosub 2300:  rem keywrd processing
 1150 gosub 2600:  rem doctor's reply
 1160 goto 1120
 1170 rem-------------------------------
 1300 rem       initialization
 1310 print chr$(147)
 1320 print: print
 1330 z = rnd(-ti)
 1340 te = 14: tn = 14
 1350 dim te$(te): dim tn$(tn)
 1360 for k = 1 to te
 1370 : read te$(k)
 1380 : read tn$(k)
 1390 next k
 1400 data " mom "," mother "," dad ",        " father "," dreams "," dream "
 1410 data " i "," you* "," you "," i ",      " me "," you "," my "," your* "
 1420 data " your "," my "," myself ",        " yourself* "
 1430 data " yourself "," myself ",           " i'm "," you're* "
 1440 data " you're "," i'm "," am ",         " are "," were "," was "
 1500 ke = 82
 1510 dim ke$(ke): dim ju(ke)
 1520 for k = 1 to ke
 1530 : read ke$(k)
 1540 : read ju(k)
 1550 next k
 1560 data computer,1,machine,1," name ",     2,alike,3," like ",3," same ",3
 1570 data you remember,4,do i remember,      5,you dreamed,6," dream ",7
 1580 data " if ",8,everybody,9,everyone,     9,nobody,9,no one,9,was you,10
 1590 data you was,11,was i,12,               your mother,13,your father,13
 1600 data your sister,13,your brother,       13,your wife,13,your husband,13
 1610 data your children,13,your,14,          always,15,are i,16,are you,18
 1620 data " how ",25,because,19,can i,       20,can you,21,certainly,22
 1630 data deutsch,23,espanol,23,             francais,23,hello,24
 1640 data i remind you of,3,i are,26,        i'm,26,italiano,23,maybe,28
 1650 data " my ",29," no ",30,perhaps,       28,sorry,31,"what ",25,"when ",25
 1660 data why don't i,32,why can't you,      33,yes,22,you want,34
 1670 data you need,34," i ",27,              you are sad,35,you're sad,35
 1680 data you are unhappy,35,                you're unhappy,35
 1690 data you are depressed,35,              you're depressed,35
 1700 data you are sick,35,you're sick,       35,you are happy,36
 1710 data you're happy,36,                   you are elated,36,you're elated,36
 1720 data you are glad,36,you're glad,       36,you are better,36
 1730 data you're better,36,you feel you,     37,you think you,37
 1740 data you believe you,37,                you wish you,37,you are,38
 1750 data you're,38,you can't,39,            you cannot,39,you don't,40
 1760 data you feel,41," are ",17
 1970 print "please state your problem."
 1980 return
 1990 rem-------------------------------
 2000 rem       input
 2004 print "-------------------------";
 2006 print "--------------"
 2010 input pa$
 2020 ep$ = right$(pa$,1)
 2030 if ep$ = "." or ep$ = "?" or ep$ =      "!" then pa$=left$(pa$,len(pa$)-1)
 2040 pa$ = " " + pa$ + " "
 2050 return
 2060 rem-------------------------------
 2100 rem       swap word for opposite
 2110 rem       form
 2120 for k = 1 to te
 2130 te$ = te$(k): tn$ = tn$(k)
 2140 for p = 1 to len(pa$)
 2150 ms$ = mid$(pa$,p,len(te$))
 2160 if te$ = ms$ then pa$ = left$(pa$,      p-1) + tn$ + mid$(pa$,p+len(te$))
 2170 next p
 2180 next k
 2190 for p = 1 to len(pa$)
 2200 if mid$(pa$,p,1) = "*" then pa$ =       left$(pa$,p-1) + mid$(pa$,p+1)
 2210 next p
 2220 return
 2230 rem-------------------------------
 2300 rem       keyword processing
 2310 for k = 1 to ke
 2320 ke$ = ke$(k): ju = ju(k)
 2330 for p = 1 to len(pa$)
 2340 ms$ = mid$(pa$,p,len(ke$))
 2350 if ke$ <> ms$ then 2390
 2360 dr$ = mid$(pa$,p+len(ke$))
 2370 if dr$ = "" then 2550
 2380 if dr$ <> "" then dr$ = left$(dr$,      len(dr$)-1): goto 2550
 2390 next p
 2400 next k
 2410 if yr$ = "" then 2440
 2420 ra = int(rnd(1) * 5 + 1)
 2430 on ra goto 2440, 2440, 2440, 2500,      2500
 2440 ra = int(rnd(1) * 4 + 1)
 2450 on ra goto 2460, 2470, 2480, 2490
 2460 print "i am not sure i understand you fully.": ju = 42: goto 2550
 2470 print "please go on.": ju = 42:         goto 2550
 2480 print "what does that suggest to you?": ju = 42: goto 2550
 2490 print "do you feel strongly about discussing such things?":ju=42:goto 2550
 2500 ra = int(rnd(1) * 3 + 1)
 2510 on ra goto 2520, 2530, 2540
 2520 print "let's discuss further why your" + yr$ + ".": ju = 42: goto 2550
 2530 print "earlier you said your" +         yr$ + ".": ju = 42: goto 2550
 2540 print"does that have anything to do with the fact that your"+yr$+".":ju=42
 2550 return
 2560 rem-------------------------------
 2600 rem       doctor's reply
 2610 if ju < 12 then 2650
 2620 if ju < 23 then ju = ju - 11: goto      2660
 2630 if ju < 34 then ju = ju - 22: goto      2670
 2640 if ju < 43 then ju = ju - 33: goto      2680
 2650 on ju goto 2720,2730,2740,2750,         2760,2770,2780,2790,2800,2810,2820
 2660 on ju goto 2830,2840,2850,2860,         2870,2880,2890,2900,2910,2920,2930
 2670 on ju goto 2940,2950,2960,2970,         2980,2990,3000,3010,3020,3070,3080
 2680 on ju goto 3090,3100,3110,3120,         3130,3140,3150,3160,3170
 2720 print "do computers worry you?":        goto 3170
 2730 print "i am not interested in names.": goto 3170
 2740 print "in what way?": goto 3170
 2750 print "do you often think of" +         dr$ + "?": goto 3170
 2760 print "did you think i would forget" + dr$ + "?": goto 3170
 2770 print "really," + dr$ + "?": goto       3170
 2780 print "what does that dream suggest to you?": goto 3170
 2790 print "do you think it's likely that if " + dr$ + "?": goto 3170
 2800 print "really, " + ke$ + "?": goto      3170
 2810 print "what if you were" + dr$ +        "?": goto 3170
 2820 print "were you really?":goto 3170
 2830 print "would you like to believe i was" + dr$ + "?": goto 3170
 2840 print "tell me more about your family.": goto 3170
 2850 print "your" + dr$ + ".": if len        (dr$) > 11 then yr$=dr$
 2855 goto 3170
 2860 print "can you think of a specific example?": goto 3170
 2870 print "why are you interested in whether i am" +dr$ + " or not?":goto 3170
 2880 print "did you think they might not be " + dr$ + "?": goto 3170
 2890 print "do you believe you are" +        dr$ + "?": goto 3170
 2900 print "is that the real reason?":       goto 3170
 2910 print "you believe i can" + dr$ +       ", don't you?": goto 3170
 2920 print "whether you can" + dr$+" depends on you more than on me.":goto 3170
 2930 print "you seem quite positive.":       goto 3170
 2940 print "i am sorry, i speak only english.": goto 3170
 2950 print "how do you do.": goto 3170
 2960 print "why do you ask?": goto 3170
 2970 print "what makes you think i am"       + dr$ + "?": goto 3170
 2980 print "we were discussing you, not me.": goto 3170
 2990 print "you don't seem quite certain.": goto 3170
 3000 print "why are you concerned over my " + dr$ + "?": goto 3170
 3010 print "are you saying 'no' just to be negative?": goto 3170
 3020 ra = int(rnd(1) * 4 + 1): on ra         goto 3030, 3040, 3050, 3060
 3030 print "please don't apologize.":        goto 3170
 3040 print "apologies are not necessary.": goto 3170
 3050 print "what feelings do you have when you apologize?": goto 3170
 3060 print "you needn't feel that you have to apologize.": goto 3170
 3070 print "do you believe i don't" +        dr$ + "?": goto 3170
 3080 print "do you think you should be able to" + dr$ + "?": goto 3170
 3090 print "what would it mean to you if you got" + dr$ + "?": goto 3170
 3100 print "i am sorry to hear it.":         goto 3170
 3110 print "how have i helped you to be?": goto 3170
 3120 print "do you really think so?":        goto 3170
 3130 print "is it because you are"+dr$+      " that you came to me?": goto 3170
 3140 print "how do you know you can't"       + dr$ + "?": goto 3170
 3150 print "don't you really" + dr$ +        "?": goto 3170
 3160 print "tell me more about such feelings."
 3170 return
 3180 rem-------------------------------
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
