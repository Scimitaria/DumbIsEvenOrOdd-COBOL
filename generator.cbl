       IDENTIFICATION DIVISION.
       PROGRAM-ID. Generator.
       AUTHOR. Scimitaria.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
       SELECT dumb ASSIGN TO "dumb.cbl"
           ORGANIZATION IS LINE SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.
       FD dumb.
       01 lineText PIC X(52).
       WORKING-STORAGE SECTION.
       01 Arg    PIC X(38).
       01 num    PIC 9(38).
       01 idx    PIC 9(38) VALUE 0.

       PROCEDURE DIVISION.
      *Clear file
           OPEN OUTPUT dumb.
           CLOSE dumb.     
      *Prep file for appending
           OPEN EXTEND dumb.
           ACCEPT Arg FROM COMMAND-LINE.
           UNSTRING Arg DELIMITED BY SPACE INTO Num.

      *Append header
           MOVE "       IDENTIFICATION DIVISION." TO lineText.
           WRITE lineText.
           MOVE "       PROGRAM-ID. Dumb." TO lineText.
           WRITE lineText.
           MOVE "       AUTHOR. Scimitaria." TO lineText.
           WRITE lineText.
           MOVE " " TO lineText.
           WRITE lineText.
           MOVE "       DATA DIVISION." TO lineText.
           WRITE lineText.
           MOVE "       WORKING-STORAGE SECTION." TO lineText.
           WRITE lineText.
           MOVE "       01 Arg  PIC X(38)." TO lineText.
           WRITE lineText.
           MOVE "       01 Num  PIC 9(38)." TO lineText.
           WRITE lineText.
           MOVE " " TO lineText. 
           WRITE lineText.
           MOVE "       PROCEDURE DIVISION." TO lineText.
           WRITE lineText.
           MOVE "           ACCEPT Arg FROM COMMAND-LINE." TO lineText.
           WRITE lineText.
           MOVE "           UNSTRING Arg DELIMITED BY SPACE INTO Num."
               TO lineText.
           WRITE lineText.
           MOVE "           EVALUATE Num" TO lineText.
           WRITE lineText.

      *Generate isEvenOrOdd
           PERFORM VARYING idx FROM 0 BY 1 UNTIL idx > num
            MOVE "             WHEN 0 DISPLAY ""0 is odd""" TO lineText
            WRITE lineText
           END-PERFORM.

      *Append footer
           MOVE "           END-EVALUATE" TO lineText.
           WRITE lineText.
           MOVE "       STOP RUN." TO lineText.
           WRITE lineText.

      *Close off
           CLOSE dumb.
           STOP RUN.
