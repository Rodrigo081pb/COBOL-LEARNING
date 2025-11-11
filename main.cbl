           IDENTIFICATION DIVISION.
           PROGRAM-ID. ORQUESTRADOR.
           
           ENVIRONMENT DIVISION.
           INPUT-OUTPUT SECTION.
           FILE-CONTROL.
               SELECT BANCO-DE-DADOS ASSIGN TO 'CADASTRO.DAT'
                   ORGANIZATION IS LINE SEQUENTIAL.

           DATA DIVISION.
           FILE SECTION.
           FD BANCO-DE-DADOS.
                COPY MODELO-DADOS.CPY.

           WORKING-STORAGE SECTION.

           PROCEDURE DIVISION.
                OPEN OUTPUT BANCO-DE-DADOS.
    
                MOVE 1 TO ID-MARCA.
                DISPLAY 'Digite o nome da marca: '.
                ACCEPT NOME-MARCA.
                WRITE CADASTRO-MARCAS.
    
                MOVE 2 TO ID-MARCA.
                MOVE 'SORVETES DELICIA' TO NOME-MARCA.
                WRITE CADASTRO-MARCAS.
    
                MOVE 3 TO ID-MARCA.
                MOVE 'SORVETES GELATO' TO NOME-MARCA.
                WRITE CADASTRO-MARCAS.
    
                CLOSE BANCO-DE-DADOS.
                STOP RUN.
                