       IDENTIFICATION DIVISION.
       PROGRAM-ID. CADASTRO-CLIENTES.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT CAD-CLIENT ASSIGN TO 'CLIENTES.DAT'
               ORGANIZATION IS LINE SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.
       FD CAD-CLIENT.
       01 REGISTRO-CLIENT.
           02 NOME     PIC X(30).
           02 CPF      PIC X(14).
           02 EMPRESA  PIC X(10).

       WORKING-STORAGE SECTION.
       01 WRK-OPCAO   PIC X(01).
       01 WRK-NOME    PIC X(30).
       01 WRK-CPF     PIC X(14).
       01 WRK-EMPRESA PIC X(10).

       PROCEDURE DIVISION.

           DISPLAY "--------------------------------------------".
           DISPLAY "Olá, tudo bem? Deseja cadastrar um cliente (S/N)?".
           DISPLAY "--------------------------------------------".
           ACCEPT WRK-OPCAO.

           IF WRK-OPCAO = "S" OR WRK-OPCAO = "s"
              PERFORM CADASTRA
           ELSE
              DISPLAY "Tudo bem, tenha um bom dia!"
           END-IF.

       CADASTRA.

           OPEN OUTPUT CAD-CLIENT.

           DISPLAY "Qual é o nome da empresa?".
           ACCEPT WRK-EMPRESA.

           DISPLAY "Qual é o nome do cliente?".
           ACCEPT WRK-NOME.

           DISPLAY "Insira o CPF do cliente:".
           ACCEPT WRK-CPF.

           MOVE WRK-NOME    TO NOME.
           MOVE WRK-CPF     TO CPF.
           MOVE WRK-EMPRESA TO EMPRESA.

           WRITE REGISTRO-CLIENT.

           DISPLAY "--------------------------------------------".
           DISPLAY " PARABÉNS! CADASTRO FINALIZADO COM SUCESSO. ".
           DISPLAY "--------------------------------------------".

           CLOSE CAD-CLIENT.

           STOP RUN.

