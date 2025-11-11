      ***********************************************************
      * PROGRAMADOR: Rodrigo
      * DATA.......: 16/10/2025
      ******************************************************************

       IDENTIFICATION DIVISION.
       PROGRAM-ID. ESCOLA.

       ENVIRONMENT DIVISION.

       DATA DIVISION.
       WORKING-STORAGE SECTION.  

       01 ALUNO.
           02 NOME PIC X(30).
           02 NOTA1 PIC 9(2)v9.
           02 NOTA2 PIC 9(2)v9.
           02 NOTA3 PIC 9(2)v9.
           02 MEDIA PIC 9(2)v9.
           02 TECLA PIC X.

       PROCEDURE DIVISION.
       MAIN-SECTION.
           DISPLAY " ".
           DISPLAY "**************************************************".
           DISPLAY "*                                                *".
           DISPLAY "*                E D U C A   +                  *".
           DISPLAY "*                                                *".
           DISPLAY "**************************************************".
           DISPLAY "Pressione [ENTER] para continuar...".
           ACCEPT TECLA.

           DISPLAY " ".
           DISPLAY "**************************************************".
           DISPLAY "*                                                *".
           DISPLAY "*                E D U C A   +                  *".
           DISPLAY "*                                                *".
           DISPLAY "**************************************************".
           DISPLAY " ".
           DISPLAY "Digite o seu nome: ".
           ACCEPT NOME.
           DISPLAY "Digite a sua primeira nota: ".
           ACCEPT NOTA1.
           DISPLAY "Digite a sua segunda nota: ".
           ACCEPT NOTA2.
           DISPLAY "Digite a sua terceira nota: ".
           ACCEPT NOTA3.
           COMPUTE MEDIA = (NOTA1 + NOTA2 + NOTA3) / 3.

           IF MEDIA >= 7
               DISPLAY "Parabens " NOME " ! Voce foi aprovado!"
           ELSE
               DISPLAY "Voce, " NOME " foi reprovado. Estude seu merda!"
           END-IF.

           DISPLAY " ".
           DISPLAY "**************************************************".
           DISPLAY "*                                                *".
           DISPLAY "*                E D U C A   +                  *".
           DISPLAY "*                                                *".
           DISPLAY "**************************************************".
           DISPLAY " ".
           DISPLAY "Nome do Aluno: " NOME.
           DISPLAY "Média: " MEDIA.
           STOP RUN.
