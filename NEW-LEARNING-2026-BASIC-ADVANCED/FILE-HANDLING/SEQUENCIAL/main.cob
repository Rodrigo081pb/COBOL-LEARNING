       IDENTIFICATION DIVISION.
       PROGRAM-ID. ARQUIVO-SEQUENCIAL.

       *> configuração do arquivo
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           *> SELECT DECLARA O ARQUIVO - o nome dele
           SELECT ARQUIVO-SEQUENCIAL *> NOME LÓGICO DO ARQUIVO
               *> o assingn to liga o arquivo fisico
               ASSIGN TO 'ARQUIVO-SEQUENCIAL.txt' *> NOME FÍSICO
               ORGANIZATION IS SEQUENTIAL       *> TIPO DE ARQUIVO: SEQ
               ACCESS MODE IS SEQUENTIAL        *> MODO DE ACESSO: SEQ
               FILE STATUS IS WS-FILE-STATUS.   *> VARIÁVEL DE STATUS

       DATA DIVISION.

       FILE SECTION. *> SEÇÃO DE ARQUIVO
       FD ARQUIVO-SEQUENCIAL. *> DESCRIÇÃO DO ARQUIVO
       
       *> VAMOS USAR UM EXEMPLO DE CLIENTES
       *> ESTRUTURA DE ARQUIVO
       01  REGISTRO-CLIENTE.
           05 CLIENTE-ID     PIC 9(5).
           05 CLIENTE-NOME   PIC X(30).
           05 CLIENTE-IDADE  PIC 99.
           05 CLIENTE-CIDADE PIC X(20).

       WORKING-STORAGE SECTION. *> SEÇÃO DE VARIÁVEIS
       01 WS-FILE-STATUS    PIC XX. *> VARIÁVEL PARA STATUS DO ARQUIVO

           88 WS-OK    VALUE '00'. *> STATUS OK
           88 WS-EOF   VALUE '10'. *> STATUS DE FIM DO ARQUIVO
           88 WS-ERROR VALUE '30' THRU '99'. *> ERROS

       01 WS-CONTADOR PIC 9(5) VALUE ZERO.

       *> PARTE LÓGICA
       PROCEDURE DIVISION.

       INICIO.
               
           PERFORM CRIAR-ARQUIVO.
           PERFORM LER-ARQUIVO.
           STOP RUN.

       *> CRIAR E LER ARQUIVO

       CRIAR-ARQUIVO.
           OPEN OUTPUT ARQUIVO-SEQUENCIAL. *> ABRE ARQUIVO PARA ESCRITA
           
           IF NOT WS-OK
               DISPLAY 'ERRO AO ABRIR O ARQUIVO' WS-FILE-STATUS
               STOP RUN
           END-IF.

           DISPLAY 'ARQUIVO ABERTO PARA ESCRITA'.

           *> ESCREVE REGISTRO NO ARQUIVO
           MOVE 00001 TO CLIENTE-ID,
           MOVE 'RODRIGO' TO CLIENTE-NOME.
           MOVE 21 TO CLIENTE-IDADE.
           MOVE 'OSLO' TO CLIENTE-CIDADE.

           WRITE REGISTRO-CLIENTE

           CLOSE ARQUIVO-SEQUENCIAL.
           DISPLAY 'ARQUIVO CRIADO E REGISTRO PREENCHIDO'.
           
       LER-ARQUIVO.
           OPEN INPUT ARQUIVO-SEQUENCIAL. *> ABRE ARQUIVO PARA LEITURA

           IF NOT WS-OK
               DISPLAY 'ERRO AO ABRIR: ' WS-FILE-STATUS
               STOP RUN
           END-IF.

           DISPLAY '==== LENDO CLIENTES ===='

           PERFORM UNTIL WS-EOF
               READ ARQUIVO-SEQUENCIAL
                   AT END
                       CONTINUE *> FIM DO ARQUIVO
                   NOT AT END
                       ADD 1 TO WS-CONTADOR
                       DISPLAY 'CLIENTE'  WS-CONTADOR
                       DISPLAY 'ID: '     CLIENTE-ID
                       DISPLAY 'NOME: '   CLIENTE-NOME
                       DISPLAY 'IDADE: '  CLIENTE-IDADE
                       DISPLAY 'CIDADE: ' CLIENTE-CIDADE
                END-READ
           END-PERFORM.
           
           CLOSE ARQUIVO-SEQUENCIAL.
           DISPLAY 'FIM DA LEITURA DO ARQUIVO'.

           STOP RUN.
       
      