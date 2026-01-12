       IDENTIFICATION DIVISION.
       CLASS-ID. Funcionario INHERITS Pessoa.
       
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 salario-privado PIC 9(7)V99.
       01 cargo-privado PIC X(30).
       
       PROCEDURE DIVISION.
       
       METHOD-ID. setSalario.
       DATA DIVISION.
       LINKAGE SECTION.
       01 novo-salario PIC 9(7)V99.
       
       PROCEDURE DIVISION USING novo-salario.
           MOVE novo-salario TO salario-privado.
       END METHOD setSalario.
       
       METHOD-ID. exibirDados OVERRIDE.   *> Sobrescrita
       PROCEDURE DIVISION.
           INVOKE SUPER "exibirDados".    *> Chama método da superclasse
           DISPLAY 'CARGO: ' cargo-privado. 
           DISPLAY 'SALARIO:  ' salario-privado. 
       END METHOD exibirDados.
       
       END CLASS Funcionario.