       IDENTIFICATION DIVISION.
       *> IDENTIFICAÇÃO DO PROGRAMA
       PROGRAM-ID. MANIPULACAO-DE-DADOS.
       *> NOME DO PROGRAMA

       *> --------------------------------------------------
       *> OBJETIVO:
       *> APRENDER SOBRE A MANIPULAÇÃO DE DADOS / VARIÁVEIS
       *> --------------------------------------------------

       ENVIRONMENT DIVISION.
       *> DEFINE O AMBIENTE ONDE O PROGRAMA É EXECUTADO

       DATA DIVISION.
       *> DIVISÃO ONDE SÃO DECLARADAS AS VARIÁVEIS

       WORKING-STORAGE SECTION.
       *> ÁREA DE ARMAZENAMENTO TEMPORÁRIO DE DADOS

       *> VARIÁVEIS ALFANUMÉRICAS
       01 ORIGEM      PIC X(10) VALUE 'COBOL'.
       01 DESTINO     PIC X(10).

       *> VARIÁVEIS NUMÉRICAS
       01 NUMERO1     PIC 999 VALUE 123.
       01 NUMERO2     PIC 999.

       *> ESTRUTURAS PARA MOVE CORRESPONDING
       01 PESSOA1.
          05 NOME     PIC X(20) VALUE 'JOAO'.
          05 IDADE    PIC 99 VALUE 30.

       01 PESSOA2.
          05 NOME     PIC X(20).
          05 IDADE    PIC 99.

       PROCEDURE DIVISION.
       *> DIVISÃO ONDE FICA A LÓGICA DO PROGRAMA

       *> -------------------------
       *> MOVE BÁSICO
       *> -------------------------
           MOVE ORIGEM  TO DESTINO.
           *> DESTINO RECEBE 'COBOL'

           MOVE NUMERO1 TO NUMERO2.
           *> NUMERO2 RECEBE 123

       *> -------------------------
       *> MÚLTIPLOS DESTINOS
       *> -------------------------
           MOVE ZERO TO NUMERO1 NUMERO2.
           *> NUMERO1 = 000 | NUMERO2 = 000

           MOVE SPACES TO ORIGEM DESTINO.
           *> ORIGEM E DESTINO FICAM EM BRANCO

       *> -------------------------
       *> VALORES ESPECIAIS
       *> -------------------------
           MOVE ZEROS TO NUMERO1.
           *> NUMERO1 = 000

           MOVE SPACES TO ORIGEM.
           *> ORIGEM = '          '

           MOVE HIGH-VALUES TO DESTINO.
           *> MAIOR VALOR POSSÍVEL PARA CAMPO ALFANUMÉRICO

           MOVE LOW-VALUES TO ORIGEM.
           *> MENOR VALOR POSSÍVEL PARA CAMPO ALFANUMÉRICO

       *> -------------------------
       *> MOVE CORRESPONDING
       *> (Copia campos com o MESMO NOME)
       *> -------------------------
           MOVE CORRESPONDING PESSOA1 TO PESSOA2.
           *> COPIA NOME E IDADE DE PESSOA1 PARA PESSOA2

           DISPLAY DESTINO.
           *> EXIBE O VALOR DE DESTINO (QUE FOI MODIFICADO)
           
           DISPLAY PESSOA2.

       *> -------------------------
       *> FINALIZA O PROGRAMA
       *> -------------------------
           STOP RUN.
