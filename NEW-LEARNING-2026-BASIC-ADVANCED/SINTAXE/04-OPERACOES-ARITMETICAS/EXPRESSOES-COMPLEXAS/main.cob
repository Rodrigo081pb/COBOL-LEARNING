       IDENTIFICATION DIVISION.
       PROGRAM-ID. EXEMPLO-EXPRESSOES-COMPLEXAS.

       DATA DIVISION.
       WORKING-STORAGE SECTION.

       01 A PIC 99 VALUE 10.
       01 B PIC 99 VALUE 5.
       01 C PIC 99 VALUE 2.
       01 RESULTADO PIC 999V99.

       PROCEDURE DIVISION.
       
           *> 10 + 5 * 2 
           COMPUTE RESULTADO = (A + B) * C.
           DISPLAY 'RESULTADO DE (10 + 5) * 2 É: ' RESULTADO.

           *> 10^2 - POTÊNCIA
           COMPUTE RESULTADO = A ** 2.
           DISPLAY 'RESULTADO DE 10^2 É: ' RESULTADO.

           *> (10 + 5) / 2
           COMPUTE RESULTADO = (A+B) / C. 
           DISPLAY 'RESULTADO DE (10 + 5) / 2 É: ' RESULTADO.

           *>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
           *>
           *> FUNÇÕES MATEMÁTICAS

           *> RAIZ QUADRADA.
           COMPUTE RESULTADO = FUNCTION SQRT(A).
           DISPLAY 'RAIZ QUADRADA DE 10 É: ' RESULTADO.


           COMPUTE RESULTADO = FUNCTION MOD(A, 3).
           DISPLAY 'RESTO DA DIVISÃO DE 10 POR 3 É: ' RESULTADO.
      
           STOP RUN.    