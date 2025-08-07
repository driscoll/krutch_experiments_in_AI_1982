10000 REM CHECKSUM GENERATOR

10005 REM Retrieve zeropage pointer to 
10006 REM the start of BASIC program text
10007 REM by default these values will be
10008 REM 2049 or 0801h
10010 MC = PEEK(43) + 256 * PEEK(44)

10015 REM The first two bytes will be 
10016 REM the line number in 16-bit 
10017 REM little-endian format.
10020 LN = PEEK(MC+2) + 256*PEEK(MC+3)

10025 REM Skip lines higher than 9999
10030 IF LN > 9999 THEN END

10035 REM Increment memory pointer
10036 REM Reset the column counter 
10037 REM The print statement is 
10038 REM inside the conditional.
10040 MC = MC+2: IF C=3 THEN C=0: PRINT

10045 REM Read first character after
10046 REM the line number.
10047 REM Add the values to checksum
10050 FOR K = 1 TO 2
10060 : VA=PEEK(MC): MC=MC+1: CS=CS+VA
10070 NEXT K

10075 REM Keep reading and adding to
10076 REM the checksum until a null
10077 REM value of zero is found.
10078 REM All lines end with CHR$(0)
10080 VA=PEEK(MC): MC=MC+1: CS=CS+VA: IF VA <> O THEN 10080
10090 NC$ = LEFT$(STR$(LN)+":     ",6)+ LEFT$(STR$(CS) + "       ",7)
10100 PRINT NC$;:C=C+1:CS=0:GOTO 10020

10999 REM https://www.c64-wiki.com/wiki/Memory_(BASIC)