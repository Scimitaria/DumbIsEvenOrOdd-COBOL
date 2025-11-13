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
           END-EVALUATE
       STOP RUN.
