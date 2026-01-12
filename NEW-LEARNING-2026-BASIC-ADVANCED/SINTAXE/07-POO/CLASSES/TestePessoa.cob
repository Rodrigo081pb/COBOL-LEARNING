       IDENTIFICATION DIVISION.
       PROGRAM-ID. TestePessoa.
       
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       REPOSITORY.
           CLASS Pessoa. 
       
       DATA DIVISION. 
       WORKING-STORAGE SECTION.
       01 minha-pessoa OBJECT REFERENCE Pessoa.
       01 nome-temp PIC X(50).
       
       PROCEDURE DIVISION. 
           INVOKE Pessoa "NEW" RETURNING minha-pessoa.
           
           INVOKE minha-pessoa "setNome" USING "RODRIGO". 
           INVOKE minha-pessoa "setIdade" USING 25.
           INVOKE minha-pessoa "exibirDados".
           
           INVOKE minha-pessoa "getNome" RETURNING nome-temp. 
           DISPLAY 'NOME RETORNADO: ' nome-temp. 
           
           STOP RUN.