       IDENTIFICATION DIVISION.
       PROGRAM-ID. LOOP-COBOL

           *> OBJETIVO É APRENDER SOBRES LAÇOS DE REPETIÇÕES NO COBOL.

       DATA DIVISION.
       WORKING-STORAGE SECTION.

       01 CONTADOR PIC 99 VALUE 1.
       01 SOME     PIC 9999 VALUE 0.

       PROCEDURE DIVISION.
           
           *> ========== PERFOM SIMPLES ================================
           
           PERFORM EXIBIR-MENSAGEM.
           STOP RUN.

       EXIBIR-MENSAGEM.
           DISPLAY 'OLÁ MUNDO! '.

           *> =========== PERFORM TIMES - REPETIR N VEZES ==============

           PERFORM 10 TIMES
               DISPLAY 'REPETINDO.....'
           END-PERFORM

           *> =========== PERFORM UNTIL (WHILE) ========================
           PERFORM UNTIL CONTADOR > 10
               DISPLAY 'CONTADOR: ' CONTADOR
               ADD 1 TO CONTADOR
           END-PERFORM.

           *> =========== PERFORM VARYING - FOR LOOP ===================

           *> PRA CONTAR DE 1 ATÉ 10 FAZENDO INCREMENTO DE 1.
           PERFORM VARYING CONTADOR FROM 1 BY 1 UNTIL CONTADOR > 10
               DISPLAY 'CONTADOR: ' CONTADOR
           END-PERFORM.

           *> ==========================================================
           *>                LOOP COM PASSO DIFERENTE
           *> loop com passo de 2 em 2
           PERFORM VARYING CONTADOR FROM 0 BY 2 UNTIL CONTADOR > 20
               DISPLAY CONTADOR
           END-PERFORM.

           *> ==========================================================
           *>     
           *>                     LOOP DECRESCENTE

           PERFORM VARYING CONTADOR FROM 10 BY -1 UNTIL CONTADOR < 1
            DISPLAY 'CONTADOR DECRESCENTE: ' CONTADOR
           END-PERFORM.

           *> ==========================================================
           *>     
           *>           PERFORM THRU - EXECUTAR SEQUENCIA

           PERFORM INICIO-PROCESSO THRU FIM-PROCESSO.
           STOP RUN.

       INICIO-PROCESSO.
           DISPLAY 'INICIO PROCESSO'.

       PASSO-INTERMEDIARIO.
           DISPLAY 'PASSO INTERMEDIÁRIO'.

       FIM-PROCESSO.
           DISPLAY 'FIM DO PROCESSO'.
           
           STOP RUN.