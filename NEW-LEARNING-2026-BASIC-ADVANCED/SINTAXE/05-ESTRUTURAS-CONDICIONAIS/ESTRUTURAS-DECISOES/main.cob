       IDENTIFICATION DIVISION.
       PROGRAM-ID. ESTRUTURAS-CONDICIONAIS. *> ou de DECISÕES

       DATA DIVISION.
       WORKING-STORAGE SECTION.

       01 IDADE PIC 99.
       01 NOTA PIC 99.

       PROCEDURE DIVISION.
           
           DISPLAY 'INFORME SUA IDADE: '.
           ACCEPT IDADE.

           IF IDADE >= 18
               DISPLAY 'VOCÊ TEM QUE SE ALISTAR'
           ELSE
               DISPLAY 'VOCÊ AINDA NÃO PRECISA SE ALISTAR'
           END-IF.

           DISPLAY 'INFORME SUA NOTA DA AV1: '.
           ACCEPT NOTA.

           IF NOTA >= 60
               DISPLAY 'APROVADO'
           ELSE
               DISPLAY 'REPROVADO'
           END-IF.

           *>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
           *>
           *> IF ANINHADO
           *>

           IF NOTA >= 90
               DISPLAY 'VOCÊ TIROU UM A'
           ELSE
               IF NOTA >= 80 AND < 90
                   DISPLAY 'VOCÊ TIROU UM B'
                ELSE
                    IF NOTA >= 70 AND < 80
                        DISPLAY 'VOCÊ TIROU UM C'
                    ELSE
                        IF NOTA >= 60 AND < 70
                            DISPLAY 'VOCÊ TIROU UM D'
                        ELSE
                            DISPLAY 'VOCÊ TIROU UM F'
                        END-IF
                    END-IF  
                END-IF
            END-IF

           STOP RUN.
           