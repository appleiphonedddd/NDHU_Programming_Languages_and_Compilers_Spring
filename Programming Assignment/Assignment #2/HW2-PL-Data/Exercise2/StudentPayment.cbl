       IDENTIFICATION DIVISION.
       PROGRAM-ID. StudentPayment.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT StudentFile ASSIGN TO "HW2-Student-Payment.csv"
               ORGANIZATION IS LINE SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.
       FD  StudentFile.
       01  StudentRecord.
           05  StudentID           PIC X(10).
           05  Filler1             PIC X VALUE ','.
           05  Amount              PIC X(15).

       WORKING-STORAGE SECTION.
       01  AmountNumeric           PIC 9(12)V99 COMP-3.
       01  TotalAmount             PIC 9(12)V99 COMP-3 VALUE 0.
       01  WS-AmountString         PIC X(15).
       01  WS-AmountNumeric        PIC 9(12)V99 COMP-3.

       PROCEDURE DIVISION.
       BEGIN.
           OPEN INPUT StudentFile.
           PERFORM UNTIL EOF
               READ StudentFile INTO StudentRecord
                   AT END
                       SET EOF TO TRUE
               END-READ
               IF NOT EOF THEN
                   MOVE Amount TO WS-AmountString
                   PERFORM Strip-Commas
                   MOVE WS-AmountString TO WS-AmountNumeric
                   ADD WS-AmountNumeric TO TotalAmount
               END-IF
           END-PERFORM.
           CLOSE StudentFile.
           DISPLAY "Total Amount Received: $" TotalAmount.
           STOP RUN.

       Strip-Commas.
           UNSTRING WS-AmountString DELIMITED BY ','
               INTO WS-AmountString
           END-UNSTRING.

       END PROGRAM StudentPayment.
