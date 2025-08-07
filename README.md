# Experiments in Artificial Intelligence (1979-1987)

Much like today, the early 1980s were a boom time for artificial intelligence but most of the action in A.I. was outside the grasp of the typical microcomputer owner. As *Popular Electronics* put it in 1982: "Artificial Intelligence (AI) is usually associated with big main-frame computers and exotic programming that only a few academics can understand" (90). 

In 1981, technical writer John Krutch hoped to make A.I. accessible to the growing population of micro enthusiasts in a book titled, *Experiments in Artificial Intelligence for Small Computers.* Krutch had previously written articles and programs for magazines such as *[Kilobaud](https://archive.org/details/kilobaudmagazine-1979-08/Kilobaud_Microcomputing_1979_August)* and [80 Microcomputing](https://archive.org/details/80-microcomputing-magazine-1980-06)* (including an amazing [Haiku Composer](https://archive.org/stream/kilobaudmagazine-1979-08/Kilobaud_Microcomputing_1979_August#page/n79/mode/2up)!) but this was his first book--and it was a success! Krutch's *Experiments* was [reprinted at least four times](http://www.worldcat.org/title/experiments-in-artificiali-ntelligence-for-small-computers/oclc/7252900/editions?editionsView=true&referer=br) in the U.S. between 1981 and 1984, and later translated into French and Japanese.

Light on theory and heavy on examples, each chapter in *Experiments in Artificial Intelligence* was organized around a demo program that gave readers a taste of the major topics in A.I. in 1982: game playing, problem solving, automatic writing, and natural language. The source for each program was printed in a monospaced font to assist readers typing the code into their machines. As with many hobby publications of the period, *Experiments* was as much a software distribution medium as a book to be read straight through.

All of Krutch's examples were written in BASIC, the *lingua franca* of microcomputing. As he noted in the Preface, BASIC was not an ideal language for teaching A.I. but no other language was available on as many different microcomputer architectures as BASIC. Of course, there was still plenty of variation within the BASIC ecosystem and code written for one system was not guaranteed to run perfectly on another. For the book, Krutch settled on Microsoft's Level II BASIC for the TRS-80, a dialect he believed to be "the most widely used form of microcomputer BASIC" at the time. It was bundled with TRS-80 machines and distributed through Radio Shack. Although Krutch avoided using any proprietary features of the TRS-80, he still took care to advise readers when any part of his code might require special attention to adapt to a different BASIC.

For the purposes of historical inquiry, teaching, and my own bizarre idea of fun, I'll be filling this repository with two types of files:
1. Direct transcriptions of Krutch's programs as they was originally published in 1982
2. Ports of these programs to Applesoft BASIC, designed to run on Joshua Bell's jsbasic

## Summary

### First edition

- Chapter 1: **KINGMOVE**, A chess king finds the shortest path between two squares on a 3x3 board
- Chapter 2: **CHECKERS**, Play checkers against the computer
- Chapter 3: **TF**, Pattern recognition program predicts the next character you will type
- Chapter 4: **FETCH**, A logic program that makes deductions based on the principle of the hypothetical syllogism
- Chapter 5: **HAIKU**, A poetry generator based on the rules of haiku and random draws from a word bank
- Chapter 6: **AUTOWRITER**, A sci-fi story generator based on constrained sentence construction and a strategically-constructed word bank
- Chapter 7: **DOCTOR**, A natural language chatbot in the spirit of ELIZA/DOCTOR

### Second edition

- Chapter 1: **KINGMOVE**, A chess king finds the shortest path between two squares on a 3x3 board
- Chapter 2: **CHECKERS**, Play checkers against the computer
- Chapter 3: **TF**, Pattern recognition program predicts the next character you will type
- Chapter 4: **INFER**, A logic program that makes deductions based on the principle of the hypothetical syllogism
- Chapter 5: TBD
- Chapter 6: **HAIKU**, A poetry generator based on the rules of haiku and random draws from a word bank
- Chapter 7: **AUTOWRITER**, A sci-fi story generator based on constrained sentence construction and a strategically-constructed word bank
- Chapter 8: **DOCTOR**, A natural language chatbot in the spirit of ELIZA/DOCTOR
- Chapter 9: **EXP SYS DEMO**, A small scale introduction to expert systems

### Magazine articles

- **HAIKU**, earlier version of the haiku composer, published in 1979 by **Kilobaud Microcomputing**

## Bugs

The transcribed code in this repository matches the code that appeared in the 1981 edition of the book. There are zero showstopper bugs in the book (to the credit of the author, editor, and publisher!) but that doesn't mean you won't run into some quirky behavior. In the interest of accuracy, I have chosen not to make any changes or corrections. Rather, I am using this space to document these edge cases as they arise.

- **AUTOWRITER** will occasionally assemble a sentence that exceeds the maximum string length of 255 characters. If this happens, the program will crash with error code 15 ("LS" or "String too long.") One way to fix this bug is to check the length of the sentence using LEN(SENT$) between line 170 and 180. If the length is over some threshold, then skip the "Another preposition?" subroutine by jumping to line 200.

## References

### Books

- John Krutch. *[Experiments in Artificial Intelligence for Small Computers](https://archive.org/details/krutch-experiments_in_artificial_intelligence_for_small_computers-1981).* Indianapolis, IN: Howard W. Sams & Co., Inc., 1982. https://archive.org/details/krutch-experiments_in_artificial_intelligence_for_small_computers-1981

### Book reviews

- "Review: Experiments in Artificial Intelligence for Small Computers by John Krutch." *Popular Electronics* (June, 1982): 90. http://www.americanradiohistory.com/Archive-Poptronics/80s/1982/Poptronics-1982-06.pdf.

### Magazine articles

- Krutch, John. “[Haiku Composer](https://archive.org/details/kilobaudmagazine-1979-08/page/n79).” Kilobaud Microcomputing, August 1979, 80–82. 

## Useful links

- [TRS-80 Model III emulator](https://www.my-trs-80.com/) by Lawrence Kestleloot ([source](https://github.com/lkesteloot/trs80))
- [TRS-80 Model I Level 2 BASIC Language Reference](http://web.archive.org/web/20080828023652/http://www.trs-80.com/trs80-info-level2.htm) by Joe Ganley, 1997
- [VICE Commodore 64 emulator](https://vice-emu.sourceforge.io/), reference for the 2nd edition code
- [C64 &amp; VIC20 Keyboard Map](https://vice-emu.sourceforge.io/vice_1.html#SEC11)
- [petcat](https://vice-emu.sourceforge.io/vice_15.html), tool for tokenizing BASIC code for the C64
- [Apple IIe Emulator in the browser](https://www.scullinsteel.com/apple//e) by Will Scullin, 2019
- [Applesoft BASIC in JavaScript](https://github.com/inexorabletash/jsbasic) by Joshua Bell
- [Applesoft BASIC FAQ](http://apple2.info/wiki/index.php?title=Applesoft_BASIC)
- [TRS-80 Fonts and Unicode](http://members.shaw.ca/gp2000/fonts.html)
- [Apple \]\[ Reference Manual](http://www.classiccmp.org/cini/pdf/Apple/Apple%20II%20Reference%20Manual%20-%20Woz.pdf) (PDF)
