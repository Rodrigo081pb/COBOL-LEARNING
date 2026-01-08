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

---


<a name="variáveis"></a>
## 3️⃣ VARIÁVEIS E TIPOS DE DADOS

### 🔢 **Níveis Hierárquicos**

```cobol
       WORKING-STORAGE SECTION.
       
      *> Nível 01 = Registro principal (começa na Área A)
       01 FUNCIONARIO.
           05 DADOS-PESSOAIS.              *> Grupo de dados
               10 NOME        PIC X(40).   *> Campo individual
               10 SOBRENOME   PIC X(40).
           05 DADOS-PROFISSIONAIS.
               10 SALARIO     PIC 9(7)V99. *> 9999999.99
               10 DEPARTAMENTO PIC X(20).
       
      *> Nível 77 = Variável independente (não pertence a grupo)
       77 CONTADOR PIC 999 VALUE ZERO.
       77 MENSAGEM PIC X(50) VALUE 'BEM-VINDO! '.
```

### 📊 **Tipos de Dados (PIC = PICTURE)**

```cobol
       WORKING-STORAGE SECTION. 
       
      *> ==================== NUMÉRICOS ====================
       01 NUMERO-INTEIRO        PIC 9(5).        *> 5 dígitos:  00000-99999
       01 NUMERO-COM-SINAL      PIC S9(5).       *> Com sinal: -99999 a +99999
       01 NUMERO-DECIMAL        PIC 9(5)V99.     *> 99999.99 (V = ponto implícito)
       01 PRECO                 PIC 9(4)V99 VALUE 1234.56.
       
      *> ==================== ALFANUMÉRICOS ====================
       01 TEXTO                 PIC X(30).       *> Aceita QUALQUER caractere
       01 INICIAL               PIC X VALUE 'R'.
       
      *> ==================== ALFABÉTICOS ====================
       01 SOMENTE-LETRAS        PIC A(20).       *> Apenas A-Z e espaço
       
      *> ==================== EDITADOS (para exibição) ====================
       01 PRECO-EDITADO         PIC $$$,$$9.99.  *> Exibe: $1,234.56
       01 DATA-EDITADA          PIC 99/99/9999.  *> Exibe: 07/01/2026
       01 TELEFONE              PIC (999)999-9999. *> (123)456-7890
```

### 🎯 **Nível 88 (Condições)**

```cobol
       01 STATUS-CLIENTE        PIC 9.
           88 ATIVO             VALUE 1.
           88 INATIVO           VALUE 0.
           88 SUSPENSO          VALUE 2.
       
       01 DIA-SEMANA            PIC 9.
           88 DOMINGO           VALUE 0.
           88 SEGUNDA           VALUE 1.
           88 FIM-DE-SEMANA     VALUES 0, 6.  *> Múltiplos valores
       
      *> Uso: 
       PROCEDURE DIVISION.
           MOVE 1 TO STATUS-CLIENTE. 
           IF ATIVO
               DISPLAY 'CLIENTE ATIVO!'
           END-IF.
```

