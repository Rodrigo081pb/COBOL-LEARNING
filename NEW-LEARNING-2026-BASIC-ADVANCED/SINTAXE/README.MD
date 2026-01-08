<a name="estrutura-básica"></a>
## 1️⃣ ESTRUTURA BÁSICA DO COBOL

COBOL tem **4 DIVISÕES OBRIGATÓRIAS**:

```cobol
      *> Este é um comentário
       IDENTIFICATION DIVISION.
       PROGRAM-ID. MEU-PRIMEIRO-PROGRAMA.
       AUTHOR. RODRIGO.
       
       ENVIRONMENT DIVISION.
       
       DATA DIVISION.
       WORKING-STORAGE SECTION. 
       01 NOME PIC X(30) VALUE 'RODRIGO'.
       
       PROCEDURE DIVISION.
           DISPLAY 'OLA, ' NOME. 
           STOP RUN. 
```

### 📌 **Explicação das Divisões:**

| Divisão | O que faz?  |
|---------|-----------|
| **IDENTIFICATION** | Identifica o programa (nome, autor, data) |
| **ENVIRONMENT** | Configurações de hardware/arquivos |
| **DATA** | Declaração de TODAS as variáveis |
| **PROCEDURE** | Lógica do programa (código executável) |
