1000 rem       haiku.bas
1010 rem-------------------------------
1100 rem       main program
1110 gosub 1200:    rem initialization
1120 goto 1140:     rem first poem
1130 gosub 2000:    rem input
1140 gosub 2100:    rem get pattern
1150 if ra=1 then gosub 3000: goto 1130
1160 if ra=2 then gosub 3300: goto 1130
1170 if ra=3 then gosub 3600: goto 1130
1180 if ra=4 then gosub 3900: goto 1130
1190 rem-------------------------------
1200 rem       initialization
1210 print chr$(147)
1220 z = rnd(-ti)
1230 rem       articles
1240 ar = 4: dim ar$(ar)
1250 for k=1 to ar: read ar$(k): next k
1260 data a, the, an, the
1270 rem       adjectives
1280 ad = 50: dim ad$(ad)
1290 for k=1 to ad: read ad$(k): next k
1300 data autumn, hidden, bitter, misty
1310 data silent, empty, dry, dark
1320 data summer, icy, delicate, quiet
1330 data white, cool, spring, winter
1340 data dappled, twilight, dawn
1350 data crimson, wispy, azure, blue
1360 data billowing, broken, cold, damp
1370 data falling, frosty, green, long
1380 data late, lingering, limpid
1390 data little, morning, muddy, old
1400 data red, rough, still, small
1410 data sparkling, throbbing
1420 data vermilion, wandering
1430 data withered, wild, black, young
1440 rem       nouns
1450 nu = 50: dim nu$(nu)
1460 for k=1 to nu: read nu$(k): next k
1470 data waterfall, river, breeze
1480 data moon, rain, wind, sea
1490 data morning, snow, lake, sunset
1500 data pine, shadow, leaf, dawn
1510 data glitter, forest, hill, cloud
1520 data meadow, sun, glade, bird
1530 data brook, butterfly, bush, dew
1540 data dust, field, fir, flower
1550 data firefly, feather, grass, haze
1560 data mountain, night, pond, shade
1570 data snowflake, silence, sound
1580 data sky, shape, surf, thunder
1590 data violet, water, wildflower
1600 data wave
1610 rem       verbs
1620 ve = 14: dim ve$(ve)
1630 for k=1 to ve: read ve$(k): next k
1640 data shakes, drifts, has stopped
1650 data struggles, has fallen 
1660 data has passed, sleeps, creeps
1670 data flutters, has risen
1680 data is falling, is trickling
1690 data murmurs, is floating
1700 rem       prepositions
1710 pr = 6: dim pr$(pr)
1720 for k=1 to pr: read pr$(k): next k
1730 data on, in, under, over, near
1735 data behind 
1740 return
1750 rem-------------------------------
2000 rem       input
2010 lin$ = "":           rem null char
2020 get a$: if a$ = "" then 2020
2030 print chr$(147)
2040 return
2050 rem-------------------------------
2100 rem       determine haiku pattern
2110 ra = int(rnd(1) * 4 + 1)
2120 return
2130 rem-------------------------------
2200 rem       choose an article
2210 ra = int(rnd(1) * ar + 1)
2220 wrd$ = ar$(ra)
2230 lin$ = lin$ + " " + wrd$
2240 return
2250 rem-------------------------------
2300 rem       choose an adjective
2310 ra = int(rnd(1) * ad + 1)
2320 wrd$ = ad$(ra) 
2330 lin$ = lin$ + " " + wrd$
2340 return
2350 rem-------------------------------
2400 rem       choose a noun
2410 ra = int(rnd(1) * nu + 1)
2420 wrd$ = nu$(ra)
2430 lin$ = lin$ + " " + wrd$
2440 return
2450 rem-------------------------------
2500 rem       choose a verb
2510 ra = int(rnd(1) * ve + 1)
2520 wrd$ = ve$(ra)
2530 lin$ = lin$ + " " + wrd$
2540 return
2550 rem-------------------------------
2600 rem       choose a preposition
2610 ra = int(rnd(1) * pr + 1)
2620 wrd$ = pr$(ra)
2630 lin$ = lin$ + " " + wrd$
2640 return
2650 rem-------------------------------
2700 rem       check articles
2710 for k = 1 to len(lin$) - 2
2720 if mid$(lin$,k,3)<>" a " then 2770
2730 b$ = mid$(lin$,k+3,1)
2740 if b$ = "a" or b$ = "e" or b$ = "i"     or b$ = "o" or b$ = "u" then 2760
2750 goto 2770
2760 lin$ = left$(lin$ ,k+1) + "n" +         mid$(lin$,k+2)
2770 next k
2780 for k = 1 to len(lin$) - 2
2790 if mid$(lin$,k,4)<>" an "then 2830
2800 b$ = mid$(lin$,k+4,1)
2810 if b$ = "a" or b$ = "e" or b$ = "i"     or b$ = "o" or b$ = "u" then 2830
2820 lin$ = left$(lin$,k+1) +               mid$(lin$,k+3)
2830 next k
2840 return
2850 rem-------------------------------
3000 rem       first haiku pattern
3010 print: print: print: print: print
3020 gosub 2200:   rem article
3030 gosub 2300:   rem adjective
3040 gosub 2400:   rem noun
3050 gosub 2700:   rem check article
3060 lin$ = lin$ + "..."
3070 print lin$
3080 lin$ = "":    rem null character
3090 gosub 2200:   rem article
3100 gosub 2400:   rem noun
3110 gosub 2500:   rem verb
3120 gosub 2600:   rem preposition
3130 gosub 2200:   rem article
3140 gosub 2400:   rem noun
3150 gosub 2700:   rem check article
3160 print tab(2) lin$
3180 lin$ = "":    rem null character
3190 gosub 2300:   rem adjective
3195 gosub 2300:   rem adjective
3200 gosub 2400:   rem noun
3210 print tab(4) lin$
3220 return
3230 rem-------------------------------
3300 rem       second haiku pattern
3310 print: print: print: print: print
3320 gosub 2400:   rem noun
3330 gosub 2600:   rem preposition
3340 gosub 2200:   rem article
3350 gosub 2400:   rem noun
3360 gosub 2700:   rem check article
3370 lin$ = lin$ + ";"
3380 print lin$ 
3390 lin$ = "":    rem null character
3400 gosub 2200:   rem article
3410 gosub 2300:   rem adjective
3420 gosub 2400:   rem noun
3430 gosub 2600:   rem preposition
3440 gosub 2200:   rem article
3450 gosub 2400:   rem noun
3460 gosub 2700:   rem check article
3470 print tab(2) lin$
3480 lin$ = "":    rem null character
3490 gosub 2300:   rem adjective
3500 gosub 2400:   rem noun
3510 print tab(4) lin$
3520 return
3530 rem-------------------------------
3600 rem       third haiku pattern
3610 print: print: print: print: print
3620 gosub 2200:   rem article
3630 gosub 2300:   rem adjective
3640 gosub 2300:   rem adjective
3650 gosub 2400:   rem noun
3660 gosub 2700:   rem check article
3670 lin$ = lin$ + ";"
3680 print lin$
3690 lin$ = "":    rem null character
3700 gosub 2600:   rem preposition
3710 gosub 2200:   rem article
3720 gosub 2300:   rem adjective
3730 gosub 2400:   rem noun
3740 gosub 2700:   rem check article
3750 print tab(2) lin$
3760 lin$ = "":    rem null character
3770 gosub 2200:   rem article
3780 gosub 2400:   rem noun
3790 gosub 2500:   rem verb
3800 gosub 2700:   rem check article
3810 print tab(4) lin$
3820 return
3830 rem-------------------------------
3900 rem       fourth haiku pattern
3910 print: print: print: print: print
3920 gosub 2200:   rem article
3930 gosub 2300:   rem adjective
3940 gosub 2400:   rem noun
3950 gosub 2500:   rem verb
3960 gosub 2700:   rem check article
3970 lin$ = lin$ + ";"
3980 print lin$ 
3990 lin$ = "":    rem null character
4000 gosub 2200:   rem article
4010 gosub 2300:   rem adjective
4020 gosub 2300:   rem adjective
4030 gosub 2400:   rem noun
4040 gosub 2700:   rem check article
4050 print tab(2) lin$
4060 lin$ = "":    rem null character
4070 gosub 2600:   rem preposition
4080 gosub 2200:   rem article
4090 gosub 2300:   rem adjective
4100 gosub 2400:   rem noun
4110 gosub 2700:   rem check article
4120 print tab(4) lin$
4130 return
4140 rem-------------------------------