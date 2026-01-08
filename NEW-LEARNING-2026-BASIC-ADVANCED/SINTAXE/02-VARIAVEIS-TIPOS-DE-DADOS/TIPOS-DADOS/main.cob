       IDENTIFICATION DIVISION. *> IDENTIFICAÇÃO DO PROGRAMA
       PROGRAM-ID. TIPOS-DADOS. *> NOME DO PROGRAMA

       *> OBJETIVO: É APRENDER SOBRE TIPOS DE DADOS NO COBOL
       *>
       *> TIPOS DE DADOS 
       *>
       *> PIC = PICTURE que significa "formato" no COBOL
       
       ENVIRONMENT DIVISION. *> Ambiente onde o progrma é executado
       
       DATA DIVISION. *> onde são declarados as variáveis e estruturas
       WORKING-STORAGE SECTION. *> área de armazenamento temporário

      *> ==================== NUMÉRICOS ====================
       01 NUMERO-INTEIRO    PIC 9(5).    *> 5 dígitos:  00000-99999
       01 NUMERO-COM-SINAL  PIC S9(5).   *> Com sinal: -99999 a +99999
       01 NUMERO-DECIMAL    PIC 9(5)V99. *> 99999.99 
       01 PRECO             PIC 9(4)V99 VALUE 1234.56.
       
      *> ==================== ALFANUMÉRICOS ====================
       01 TEXTO                 PIC X(30). *> Aceita QUALQUER caractere
       01 INICIAL               PIC X VALUE 'R'.
       
      *> ==================== ALFABÉTICOS ====================
       01 SOMENTE-LETRAS        PIC A(20).       *> Apenas A-Z e espaço
       
      *> ==================== EDITADOS (para exibição) ================
       01 PRECO-EDITADO         PIC $$$,$$9.99.  *> Exibe: $1,234.56
       01 DATA-EDITADA          PIC 99/99/9999.  *> Exibe: 07/01/2026
       01 TELEFONE              PIC 9(999)999-9999. *> (123)456-7890
 

