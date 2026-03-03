IDENTIFICATION DIVISION.
       PROGRAM-ID. SOMA.
       
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       
       DATA DIVISION.
       FILE SECTION.
       
       WORKING-STORAGE SECTION.
       01 WS-NUMERO1          PIC 9(10) VALUE 0.
       01 WS-NUMERO2          PIC 9(10) VALUE 0.
       01 WS-RESULTADO        PIC 9(10) VALUE 0.
       01 WS-ARGUMENTO1       PIC X(20).
       01 WS-ARGUMENTO2       PIC X(20).
       01 WS-RETURN-CODE      PIC 9 VALUE 0.
       
       PROCEDURE DIVISION.
       
           ACCEPT WS-ARGUMENTO1 FROM COMMAND-LINE.
           
           IF WS-ARGUMENTO1 NOT = SPACES
               MOVE FUNCTION NUMVAL(WS-ARGUMENTO1) TO WS-NUMERO1
           ELSE
               MOVE 0 TO WS-NUMERO1
           END-IF.
           
           ACCEPT WS-ARGUMENTO2 FROM ARGUMENT-VALUE.
           
           IF WS-ARGUMENTO2 NOT = SPACES
               MOVE FUNCTION NUMVAL(WS-ARGUMENTO2) TO WS-NUMERO2
           ELSE
               MOVE 0 TO WS-NUMERO2
           END-IF.
           
           PERFORM CALCULAR-SOMA.
           
           DISPLAY "RESULTADO=" WS-RESULTADO.
           
           STOP RUN.
           
       CALCULAR-SOMA.
           ADD WS-NUMERO1 TO WS-NUMERO2 GIVING WS-RESULTADO.
