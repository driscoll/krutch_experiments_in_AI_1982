 1000 rem       exp sys demo.bas
 1010 rem-------------------------------
 1100 rem       main program
 1110 gosub 1200:  rem initialization
 1120 gosub 2000:  rem ask questions
 1130 gosub 2500:  rem make inference
 1140 goto 1120
 1190 rem-------------------------------
 1200 rem       initialization
 1210 print chr$(147)
 1220 print
 1230 print "cloud identifier--";
 1240 print "expert systems demo"
 1250 print "will identify clouds ";
 1260 print "above 2 km"
 1270 cn = 8
 1280 dim cn$(cn): dim cd$(cn)
 1290 for k = 1 to cn
 1300 : read cn$(k)
 1310 : read cd(k)
 1320 next k
 1400 rem       knowledge base
 1410 data cirrus,2211
 1420 data cirrocumulus,2131
 1430 data cirrocumulus,2231
 1440 data cirrostratus,2251
 1450 data altocumulus,1121
 1460 data altocumulus,1221
 1470 data altostratus,1141
 1480 data nimbostratus,1122
 1890 return
 1900 rem-------------------------------
 2000 rem       ask questions
 2150 print
 2160 print "cloud altitude:"
 2170 print "[1] 2-7 km"
 2180 print "[2] above 7 km"
 2190 input al$
 2200 print
 2210 print "cloud color:"
 2220 print "[1] gray"
 2230 print "[2] white"
 2240 input cl$
 2250 print
 2260 print "cloud composition:"
 2270 print "[1] filaments"
 2280 print "[2] rounded masses"
 2290 print "[3] rippled"
 2300 print "[4] sheet"
 2310 print "[5] veil"
 2320 input cp$
 2330 print
 2340 print "visibility of sun ";
 2350 print "through the cloud:"
 2360 print "[1] sun partly visible"
 2370 print "[2] sun not visible"
 2380 input vi$
 2390 return
 2400 rem-------------------------------
 2500 rem       make inference
 2510 ip = val(al$ + cl$ + cp$ + vi$)
 2520 for k = 1 to cn
 2530 : if ip = cd(k) then 2580
 2540 next k
 2550 print
 2560 print "i don't know that one."
 2570 goto 2600
 2580 print
 2590 print "cloud is " cn$(k)
 2600 return
 2610 rem-------------------------------
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
