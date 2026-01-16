       IDENTIFICATION DIVISION. *> DIVISÃO DE IDENTIFICAÇÃO DO PGM
       PROGRAM-ID. Pessoa.        *> CLASSE PESSOA PELO CLASS-ID

       ENVIRONMENT DIVISION.    *> DIVISÃO DE AMBIENTE
       CONFIGURATION SECTION.   *> SEÇÃO DE CONFIGURAÇÃO
       REPOSITORY.
           CLASS Pessoa.

       DATA DIVISION.
       WORKING-STORAGE SECTION.

       01 nome-privado    PIC X(50).
       01 idade-privada   PIC 999.

       PROCEDURE DIVISION.


           *>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
           *> INÍCIO DO MÉTODO SETNOME PARA DEFINIR O NOME DA PESSOA

           *> método id significa o início de um metodo
           METHOD-ID. setNome. 
           DATA DIVISION.
           LINKAGE SECTION. *> Seção de ligação para parâmetros
           01 novo-nome PIC X(50).

           *> USING é usado para receber o parâmetro
           PROCEDURE DIVISION USING novo-nome.
               MOVE novo-nome TO nome-privado.
           END METHOD setNome.

           *> FIM DO MÉTODO SETNOME

           *> GETNOME PARA OBTER O NOME DA PESSOA
           METHOD-ID. getNome.
           DATA DIVISION.
           LINKAGE SECTION.
           01 retorno-nome PIC X(50).

           PROCEDURE DIVISION RETURNING retorno-nome.
               MOVE nome-privado TO retorno-nome.
           END METHOD getNome.

           *> FIM DO MÉTODO GETNOME

           *> INICIO DO SET IDADE
           METHOD-ID. setIdade.
           DATA DIVISION.
           LINKAGE SECTION.
           01 nova-idade PIC 999.

           PROCEDURE DIVISION USING nova-idade.
               IF nova-idade >= 0 AND nova-idade <= 150
                   MOVE nova-idade TO idade-privada
               ELSE
                   DISPLAY 'IDADE INVÁLIDA'
               END-IF.
           END METHOD setIdade.
           
           *> FIM DO MÉTODO SET IDADE
           
           *> INICIO DO GET IDADE 
           METHOD-ID. getIdade.
           DATA DIVISION.
           LINKAGE SECTION.
           01 retorno-idade PIC 999.

           PROCEDURE DIVISION RETURNING retorno-idade.
               MOVE idade-privada TO retorno-idade.
           END METHOD getIdade.

           *> FIM DO MÉTODO GET IDADE

           METHOD-ID. exibirDados.
           PROCEDURE DIVISION.
               DISPLAY 'NOME: ' nome-privado.
               DISPLAY 'IDADE: ' idade-privada
           END METHOD exibirDados.

           END CLASS Pessoa.



