       IDENTIFICATION DIVISION.
       PROGRAM-ID. Dumb.
       AUTHOR. Scimitaria.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 Arg  PIC X(38).
       01 Num  PIC 9(38).

       PROCEDURE DIVISION.
           ACCEPT Arg FROM COMMAND-LINE.
           UNSTRING Arg DELIMITED BY SPACE INTO Num.
           EVALUATE Num
             WHEN 0 DISPLAY "0 is even"
             WHEN 1 DISPLAY "1 is odd"
             WHEN 2 DISPLAY "2 is even"
             WHEN 3 DISPLAY "3 is odd"
             WHEN 4 DISPLAY "4 is even"
             WHEN 5 DISPLAY "5 is odd"
             WHEN 6 DISPLAY "6 is even"
             WHEN 7 DISPLAY "7 is odd"
             WHEN 8 DISPLAY "8 is even"
             WHEN 9 DISPLAY "9 is odd"
             WHEN 10 DISPLAY "10 is even"
           END-EVALUATE
       STOP RUN.
