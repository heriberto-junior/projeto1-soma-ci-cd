IDENTIFICATION DIVISION.
       PROGRAM-ID. SOMA.
       
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-NUMERO1 PIC 9(10) VALUE 0.
       01 WS-NUMERO2 PIC 9(10) VALUE 0.
       01 WS-RESULTADO PIC 9(10) VALUE 0.
       01 WS-ARGUMENTO PIC X(100).
       01 WS-PARAMETRO1 PIC X(20).
       01 WS-PARAMETRO2 PIC X(20).
       
       PROCEDURE DIVISION.
       
      *> Receber todos os argumentos da linha de comando
           ACCEPT WS-ARGUMENTO FROM COMMAND-LINE.
           
      *> Analisar os argumentos recebidos
           UNSTRING WS-ARGUMENTO DELIMITED BY SPACE
               INTO WS-PARAMETRO1
                    WS-PARAMETRO2
           END-UNSTRING.

           DISPLAY 'WS-PARAMETRO1: ' WS-PARAMETRO1
           DISPLAY 'WS-PARAMETRO2: ' WS-PARAMETRO2
      
      *> Converter primeiro parâmetro
           IF WS-PARAMETRO1 NOT = SPACES AND WS-PARAMETRO1 IS NUMERIC
               MOVE FUNCTION NUMVAL(WS-PARAMETRO1) TO WS-NUMERO1
           ELSE
               MOVE 0 TO WS-NUMERO1
           END-IF.
           
      *> Converter segundo parâmetro
           IF WS-PARAMETRO2 NOT = SPACES AND WS-PARAMETRO2 IS NUMERIC
               MOVE FUNCTION NUMVAL(WS-PARAMETRO2) TO WS-NUMERO2
           ELSE
               MOVE 0 TO WS-NUMERO2
           END-IF.
           
      *> Realizar a soma
           ADD WS-NUMERO1 TO WS-NUMERO2 GIVING WS-RESULTADO.
           
      *> Exibir resultado
           DISPLAY "RESULTADO=" WS-RESULTADO.
           
           STOP RUN.
