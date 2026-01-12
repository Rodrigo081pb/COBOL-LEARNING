       IDENTIFICATION DIVISION.
       PROGRAM-ID. SWITCH-CASES-COBOL.

           *> OBJETIVO É APRENDER SOBRE EVALUETE NO COBOL QUE É IGUAL 
           *> AO SWITCH CASES DE OUTRAS LINGUAGENS.

       DATA DIVISION.
       WORKING-STORAGE SECTION.

       01 CODIGO PIC 9.
       01 DIA-SEMANA PIC 9.
       01 NOTA PIC 99.
       01 TURNO PIC X.

       PROCEDURE DIVISION.
           
           *> EVALUATE SIMPLES.
           EVALUATE CODIGO
               WHEN 1
                   MOVE 1 TO DIA-SEMANA
                   DISPLAY "SEGUNDA-FEIRA"
               WHEN 2
                   MOVE 2 TO DIA-SEMANA
                   DISPLAY "TERÇA-FEIRA"
               WHEN 3
                   MOVE 3 TO DIA-SEMANA
                   DISPLAY "QUARTA-FEIRA"
               WHEN 4
                   MOVE 4 TO DIA-SEMANA
                   DISPLAY "QUINTA-FEIRA"
               WHEN 5
                   MOVE 5 TO DIA-SEMANA
                   DISPLAY "SEXTA-FEIRA"
               WHEN 6
                   MOVE 6 TO DIA-SEMANA
                   DISPLAY "SÁBADO"
               WHEN 7
                   MOVE 7 TO DIA-SEMANA
                   DISPLAY "DOMINGO"
               WHEN OTHER
                   DISPLAY "CÓDIGO INVÁLIDO"
           END-EVALUATE.
           
           *>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
           *>
           *> EVALUATE COM RANGES

           EVALUATE NOTA
               WHEN 90 THRU 100
                   DISPLAY 'EXCELENTE NOTA: A'
               WHEN 80 THRU 89
                   DISPLAY 'ÓTIMA NOTA: B'
               WHEN 70 THRU 79
                   DISPLAY 'BOA NOTA: C'
               WHEN 60 THRU 69
                   DISPLAY 'NOTA REGULAR: D'
               WHEN 0 THRU 59
                   DISPLAY 'NOTA INSUFICIENTE: F'
               WHEN OTHER
                   DISPLAY 'NOTA INVÁLIDA'
               END-EVALUATE.
           *>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
           *>
           *> MÚLTIPLAS CONDIÇÕES

           EVALUATE DIA-SEMANA ALSO TURNO
               WHEN 1 ALSO 'M'
                   DISPLAY 'SEGUNDA-FEIRA MANHÃ'
               WHEN 1 ALSO 'T'
                   DISPLAY 'SEGUNDA-FEIRA TARDE'
               WHEN 2 ALSO 'M'
                   DISPLAY 'TERÇA-FEIRA MANHÃ'
               WHEN 2 ALSO 'T'
                   DISPLAY 'TERÇA-FEIRA TARDE'
               WHEN OTHER
                   DISPLAY 'COMBINAÇÃO INVÁLIDA'
           END-EVALUATE.
        

           STOP RUN.