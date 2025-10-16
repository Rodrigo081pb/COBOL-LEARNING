      ******************************************************************
      * PROGRAMADOR: Rodrigo
      * DATA.......: 16/10/2025
      ******************************************************************

       IDENTIFICATION DIVISION.
       PROGRAM-ID. CAD0001A.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT ARQUIVO-CADASTRO ASSIGN TO 'CADASTRO.DAT'
               ORGANIZATION IS LINE SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.
       FD ARQUIVO-CADASTRO.
       01 REGISTRO-CADASTRO.
           05 NOME   PIC X(30).
           05 IDADE  PIC 9(03).
           05 CPF    PIC X(14).

       WORKING-STORAGE SECTION.

       01 WRK-CONTINUAR PIC X(01) VALUE 'S'.
       01 WRK-NOME PIC X(30).
       01 WRK-IDADE PIC 9(03).
       01 WRK-CPF PIC X(14).


       PROCEDURE DIVISION.
       0001-PROCESSAR.
           OPEN OUTPUT ARQUIVO-CADASTRO.


           PERFORM 0002-CADASTRAR-REG UNTIL WRK-CONTINUAR EQUAL 'N'.
           CLOSE ARQUIVO-CADASTRO.

           STOP RUN.
       0001-END.

       0002-CADASTRAR-REG.
           
           DISPLAY 'digite o seu nome: '.
           ACCEPT WRK-NOME.
           DISPLAY 'digite sua idade:'.
           ACCEPT WRK-IDADE.
           DISPLAY 'DIGITE SEU CPF: '.
           ACCEPT WRK-CPF.

           MOVE WRK-NOME TO NOME.
           MOVE WRK-IDADE TO IDADE.
           MOVE WRK-CPF TO CPF.

           WRITE REGISTRO-CADASTRO.

           DISPLAY 'DESEJA CADASTRAR OUTRA PESSOA? (S/N)'.
           ACCEPT WRK-CONTINUAR.

       0002-END.
