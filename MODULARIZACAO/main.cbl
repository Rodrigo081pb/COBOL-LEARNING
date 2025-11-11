      * Linkage Section - Área de passagem de parâmetros entre programas
       IDENTIFICATION DIVISION.
       PROGRAM-ID. MODULARIZACAO.
       AUTHOR. RODRIGO.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       COPY SORVETES.CPY.

      * UTILIZANDO UM COPYBOOK PARA DEFINIÇÃO DA ESTRUTURA DE DADOS
       PROCEDURE DIVISION.
           MOVE 'ZECAS' TO MARCA.
           MOVE 'AMEIXA' TO SABOR.
           MOVE 1.99 TO PRECO.

           DISPLAY 'Saindo um sorvete de ' SABOR.
           DISPLAY 'Da marca ' MARCA.
           DISPLAY 'Por apenas R$' PRECO.

           STOP RUN.

       