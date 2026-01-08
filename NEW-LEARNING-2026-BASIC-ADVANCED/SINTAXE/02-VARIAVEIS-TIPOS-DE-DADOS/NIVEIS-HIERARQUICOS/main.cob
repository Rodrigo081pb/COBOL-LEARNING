       IDENTIFICATION DIVISION. *> é o que identifica o programa
       PROGRAM-ID. VARIAVEIS-TIPOS-DE-DADOS. *> nome do programa

       ENVIRONMENT DIVISION. *> Ambiente onde o progrma é executado
       
       DATA DIVISION. *> onde são declarados as variáveis e estruturas
       WORKING-STORAGE SECTION. *> área de armazenamento temporário

       01 FUNCIONARIO. *> NÍVEL 01 = REGISTRO PRINCIPAL 
           02 DADOS-PESSOAIS. *> GRUPO DE DADOS
               03 NOME PIC X(40). *> Campo Indivídual
               03 SOBRENOME PIC X(40).
           02 DADOS-PROFISSIONAIS. *> GRUPO DE DADOS
               03 SALARIO PIC 9(7)V99. *> 9999999.99
               03 CARGO PIC X(30).
       
      * NÍVEL 77 = VARIÁVEL INDEPENDENTE > NÃO PERTENCE A UM GRUPO
       77 CONTADOR PIC 999 VALUE 0.
       77 MENSAGEM PIC X(50) VALUE 'BEM VINDO! '.


