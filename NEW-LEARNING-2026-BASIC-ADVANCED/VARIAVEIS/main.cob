       IDENTIFICATION DIVISION.
           PROGRAM-ID.  VARIAVEIS.
       ENVIRONMENT DIVISION.
       
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       
       01 NOME PIC X(20).
       01 IDADE PIC 99.
       
       PROCEDURE DIVISION.

           DISPLAY "DIGITE SEU NOME".
           ACCEPT NOME.

           DISPLAY "OlA," NOME.
           
           DISPLAY "DIGITE SUA IDADE".
           ACCEPT IDADE.

           DISPLAY "Voce tem " IDADE.    

           STOP RUN.