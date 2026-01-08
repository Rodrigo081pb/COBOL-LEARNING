      ***********************************************************
      * PROGRAMADOR: Rodrigo
      * DATA.......: 23/10/2025
      ******************************************************************

       IDENTIFICATION DIVISION.
       PROGRAM-ID. HELLOWORLD.

       ENVIRONMENT DIVISION.

       DATA DIVISION.
       WORKING-STORAGE SECTION.  
       01 WS-MESSAGE PIC X(20) VALUE 'Hello World'.

       PROCEDURE DIVISION.
           DISPLAY "Olá, Mundo!".
           STOP RUN.
