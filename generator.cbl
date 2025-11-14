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
       01 lineText PIC X(180).
       WORKING-STORAGE SECTION.
       01 Arg    PIC X(18).
       01 num    PIC 9(18).
       01 idx    PIC 9(18).
       01 idx-text PIC Z(18).
       01 isEven PIC X(5)  VALUE "odd".
       01 toggle PIC S9    VALUE 1.

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
           PERFORM VARYING idx FROM 1 BY 1 UNTIL idx > num
             *>convert index to string
             MOVE idx TO idx-text

             IF toggle = 1
               MOVE " odd'" TO isEven
               MOVE isEven(2:4) TO isEven
             ELSE
               MOVE "even'" TO isEven
             END-IF

             MULTIPLY toggle BY -1 GIVING toggle

             STRING
               "             WHEN " DELIMITED BY SIZE
               FUNCTION TRIM(idx-text) DELIMITED BY SPACE
               " DISPLAY '"         DELIMITED BY SIZE
               FUNCTION TRIM(idx-text) DELIMITED BY SPACE
               " is "               DELIMITED BY SIZE
               isEven               DELIMITED BY SIZE
               INTO lineText
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
           