# 🚀 COBOL - Guia Completo do Zero ao Avançado

Vou te ensinar **TUDO** sobre COBOL, começando do básico até você dominar completamente!  Prepare-se para virar um **expert em COBOL**!  💪

---

## 📋 ÍNDICE RÁPIDO
1. [Estrutura Básica do COBOL](#estrutura-básica)
2. [Colunas do COBOL (IMPORTANTE!)](#colunas)
3. [Variáveis e Tipos de Dados](#variáveis)
4. [Manipulação de Dados](#manipulação)
5. [Operações Aritméticas](#aritmética)
6. [Estruturas de Decisão](#decisão)
7. [Laços e Repetições](#laços)
8. [POO em COBOL](#poo)
9. [50+ Exercícios LeetCode Style](#exercícios)

---

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

<a name="colunas"></a>
## 2️⃣ COLUNAS DO COBOL (CRITICAL!)

COBOL usa um **sistema de colunas fixo** (legado dos cartões perfurados):

```
Colunas 1-6:    Número de sequência (IGNORADO hoje)
Coluna 7:      Indicador especial (* = comentário, - = continuação)
Colunas 8-11:   Área A (divisões, seções, parágrafos, 01, 77)
Colunas 12-72: Área B (código normal)
Colunas 73-80: Ignoradas (identificação do cartão)
```

### 🎯 **Regras de Ouro:**

```cobol
      *> Coluna 7 com * = LINHA INTEIRA É COMENTÁRIO
      
      *> ÁREA A (8-11): Itens que começam com nível 01, 77, FD, SD
       IDENTIFICATION DIVISION.    *> Divisões na Área A
       PROGRAM-ID. EXEMPLO. 
       
       DATA DIVISION. 
       WORKING-STORAGE SECTION.
       01 CLIENTE.                   *> 01 na Área A
           05 NOME PIC X(50).       *> 05 na Área B
           05 IDADE PIC 99.         *> 05 na Área B
       
       PROCEDURE DIVISION. 
       INICIO.                      *> Parágrafo na Área A
           DISPLAY 'OLA'.            *> Comando na Área B
           STOP RUN. 
```

**⚠️ ERRO COMUM:** Colocar comandos na Área A causa erro!

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

---

<a name="manipulação"></a>
## 4️⃣ MANIPULAÇÃO DE DADOS

### 📦 **MOVE - Movimentação de Dados**

```cobol
       WORKING-STORAGE SECTION.
       01 ORIGEM     PIC X(10) VALUE 'COBOL'.
       01 DESTINO    PIC X(10).
       01 NUMERO1    PIC 999 VALUE 123.
       01 NUMERO2    PIC 999.
       
       PROCEDURE DIVISION.
      *> Básico
           MOVE ORIGEM TO DESTINO.              *> DESTINO = 'COBOL'
           MOVE NUMERO1 TO NUMERO2.             *> NUMERO2 = 123
           
      *> Múltiplos destinos
           MOVE ZERO TO NUMERO1 NUMERO2.        *> Ambos = 0
           MOVE SPACES TO ORIGEM DESTINO.       *> Ambos = '          '
           
      *> Valores especiais
           MOVE ZEROS TO NUMERO1.               *> 000
           MOVE SPACES TO ORIGEM.               *> '          '
           MOVE HIGH-VALUES TO DESTINO.         *> Valor mais alto possível
           MOVE LOW-VALUES TO ORIGEM.            *> Valor mais baixo possível
           
      *> CORRESPONDING (move campos com mesmo nome)
       01 PESSOA1. 
           05 NOME PIC X(20) VALUE 'JOAO'.
           05 IDADE PIC 99 VALUE 30.
       01 PESSOA2.
           05 NOME PIC X(20).
           05 IDADE PIC 99.
           
           MOVE CORRESPONDING PESSOA1 TO PESSOA2.  *> Copia NOME e IDADE
```

### 🧹 **INITIALIZE - Limpeza de Dados**

```cobol
       01 CLIENTE.
           05 NOME         PIC X(30) VALUE 'TESTE'.
           05 IDADE        PIC 99 VALUE 25.
           05 SALARIO      PIC 9(5)V99 VALUE 5000.00.
       
       PROCEDURE DIVISION. 
      *> Limpa TUDO (numéricos = 0, alfanuméricos = SPACES)
           INITIALIZE CLIENTE.
           
      *> Limpa apenas certos tipos
           INITIALIZE CLIENTE REPLACING NUMERIC DATA BY 99.
           INITIALIZE CLIENTE REPLACING ALPHANUMERIC DATA BY 'N/A'.
```

---

<a name="aritmética"></a>
## 5️⃣ OPERAÇÕES ARITMÉTICAS

### ➕ **ADD - Adição**

```cobol
       01 NUM1 PIC 999 VALUE 100.
       01 NUM2 PIC 999 VALUE 50.
       01 RESULTADO PIC 9999. 
       
       PROCEDURE DIVISION.
      *> Formato 1: ADD ...  TO
           ADD 10 TO NUM1.                    *> NUM1 = 110
           
      *> Formato 2: ADD ... GIVING
           ADD NUM1 NUM2 GIVING RESULTADO.    *> RESULTADO = 160
           ADD 10 20 30 GIVING RESULTADO.     *> RESULTADO = 60
           
      *> Com tratamento de erro
           ADD NUM1 TO NUM2
               ON SIZE ERROR
                   DISPLAY 'OVERFLOW!'
           END-ADD.
```

### ➖ **SUBTRACT - Subtração**

```cobol
       PROCEDURE DIVISION.
           SUBTRACT 30 FROM NUM1.                  *> NUM1 = 70
           SUBTRACT NUM2 FROM NUM1 GIVING RESULTADO. *> RESULTADO = 20
```

### ✖️ **MULTIPLY - Multiplicação**

```cobol
       PROCEDURE DIVISION.
           MULTIPLY 3 BY NUM1.                     *> NUM1 = 300
           MULTIPLY NUM1 BY NUM2 GIVING RESULTADO. *> RESULTADO = 15000
```

### ➗ **DIVIDE - Divisão**

```cobol
       01 DIVIDENDO PIC 999 VALUE 100.
       01 DIVISOR   PIC 99 VALUE 5.
       01 QUOCIENTE PIC 999.
       01 RESTO     PIC 99.
       
       PROCEDURE DIVISION.
           DIVIDE DIVISOR INTO DIVIDENDO.          *> DIVIDENDO = 20
           
           DIVIDE DIVIDENDO BY DIVISOR GIVING QUOCIENTE.  *> QUOCIENTE = 20
           
      *> Com resto
           DIVIDE 100 BY 3 
               GIVING QUOCIENTE 
               REMAINDER RESTO.                    *> QUOCIENTE = 33, RESTO = 1
```

### 🧮 **COMPUTE - Expressões Complexas**

```cobol
       01 A PIC 99 VALUE 10.
       01 B PIC 99 VALUE 5.
       01 C PIC 99 VALUE 2.
       01 RESULTADO PIC 999V99.
       
       PROCEDURE DIVISION.
      *> Operadores:  + - * / ** (potência)
           COMPUTE RESULTADO = (A + B) * C.        *> (10+5)*2 = 30
           COMPUTE RESULTADO = A ** 2.             *> 10² = 100
           COMPUTE RESULTADO = (A + B) / C.        *> 15/2 = 7.5
           
      *> Funções matemáticas
           COMPUTE RESULTADO = FUNCTION SQRT(A).   *> Raiz quadrada
           COMPUTE RESULTADO = FUNCTION MOD(A, 3). *> Resto da divisão
```

---

<a name="decisão"></a>
## 6️⃣ ESTRUTURAS DE DECISÃO

### 🔀 **IF / ELSE / END-IF**

```cobol
       01 IDADE PIC 99 VALUE 18.
       01 NOTA  PIC 999 VALUE 85.
       
       PROCEDURE DIVISION.
      *> IF simples
           IF IDADE >= 18
               DISPLAY 'MAIOR DE IDADE'
           END-IF.
           
      *> IF/ELSE
           IF NOTA >= 70
               DISPLAY 'APROVADO'
           ELSE
               DISPLAY 'REPROVADO'
           END-IF. 
           
      *> IF aninhado
           IF NOTA >= 90
               DISPLAY 'CONCEITO A'
           ELSE
               IF NOTA >= 80
                   DISPLAY 'CONCEITO B'
               ELSE
                   IF NOTA >= 70
                       DISPLAY 'CONCEITO C'
                   ELSE
                       DISPLAY 'CONCEITO D'
                   END-IF
               END-IF
           END-IF.
           
      *> Operadores lógicos
           IF IDADE >= 18 AND NOTA >= 70
               DISPLAY 'APTO'
           END-IF.
           
           IF NOTA < 50 OR IDADE < 16
               DISPLAY 'NAO APTO'
           END-IF.
           
           IF NOT (NOTA < 70)
               DISPLAY 'PASSOU'
           END-IF. 
```

### 🎯 **EVALUATE (Switch do COBOL)**

```cobol
       01 CODIGO PIC 9.
       01 DIA-SEMANA PIC 9.
       
       PROCEDURE DIVISION.
      *> EVALUATE básico (igual switch)
           EVALUATE CODIGO
               WHEN 1
                   DISPLAY 'OPCAO UM'
               WHEN 2
                   DISPLAY 'OPCAO DOIS'
               WHEN 3
                   DISPLAY 'OPCAO TRES'
               WHEN OTHER
                   DISPLAY 'OPCAO INVALIDA'
           END-EVALUATE.
           
      *> EVALUATE com ranges
           EVALUATE NOTA
               WHEN 90 THRU 100
                   DISPLAY 'EXCELENTE'
               WHEN 80 THRU 89
                   DISPLAY 'OTIMO'
               WHEN 70 THRU 79
                   DISPLAY 'BOM'
               WHEN OTHER
                   DISPLAY 'PRECISA MELHORAR'
           END-EVALUATE.
           
      *> EVALUATE múltiplas condições
           EVALUATE TRUE
               WHEN IDADE < 18
                   DISPLAY 'MENOR'
               WHEN IDADE >= 18 AND IDADE < 65
                   DISPLAY 'ADULTO'
               WHEN IDADE >= 65
                   DISPLAY 'IDOSO'
           END-EVALUATE.
           
      *> EVALUATE múltiplas variáveis
           EVALUATE DIA-SEMANA ALSO TURNO
               WHEN 1 ALSO 'M'
                   DISPLAY 'SEGUNDA DE MANHA'
               WHEN 1 ALSO 'T'
                   DISPLAY 'SEGUNDA A TARDE'
               WHEN 6 ALSO ANY
                   DISPLAY 'SABADO - QUALQUER TURNO'
           END-EVALUATE.
```

---

<a name="laços"></a>
## 7️⃣ LAÇOS E REPETIÇÕES

### 🔁 **PERFORM - O Loop do COBOL**

```cobol
       01 CONTADOR PIC 99 VALUE 1.
       01 SOMA     PIC 9999 VALUE ZERO.
       
       PROCEDURE DIVISION.
       
      *> ========== PERFORM SIMPLES ==========
           PERFORM EXIBIR-MENSAGEM.
           STOP RUN.
       
       EXIBIR-MENSAGEM.
           DISPLAY 'HELLO WORLD! '.
       
      *> ========== PERFORM TIMES (repetir N vezes) ==========
           PERFORM 10 TIMES
               DISPLAY 'REPETINDO...'
           END-PERFORM.
           
      *> ========== PERFORM UNTIL (while) ==========
           PERFORM UNTIL CONTADOR > 10
               DISPLAY 'CONTADOR: ' CONTADOR
               ADD 1 TO CONTADOR
           END-PERFORM.
           
      *> ========== PERFORM WITH TEST AFTER (do-while) ==========
           PERFORM WITH TEST AFTER UNTIL CONTADOR > 5
               DISPLAY CONTADOR
               ADD 1 TO CONTADOR
           END-PERFORM.
           
      *> ========== PERFORM VARYING (for loop) ==========
           PERFORM VARYING CONTADOR FROM 1 BY 1 UNTIL CONTADOR > 10
               DISPLAY 'CONTADOR: ' CONTADOR
           END-PERFORM.
           
      *> Loop com passo diferente
           PERFORM VARYING CONTADOR FROM 0 BY 2 UNTIL CONTADOR > 20
               DISPLAY CONTADOR  *> 0, 2, 4, 6... 
           END-PERFORM. 
           
      *> ========== PERFORM THRU (executar sequência) ==========
           PERFORM INICIO-PROCESSO THRU FIM-PROCESSO. 
           STOP RUN.
           
       INICIO-PROCESSO.
           DISPLAY 'PASSO 1'.
       
       PASSO-INTERMEDIARIO.
           DISPLAY 'PASSO 2'.
           
       FIM-PROCESSO. 
           DISPLAY 'PASSO 3'.
```

### ⚠️ **GO TO (EVITE! )**

```cobol
      *> NÃO FAÇA ISSO!  (código espaguete)
           GO TO PASSO-2. 
       
       PASSO-1.
           DISPLAY 'NUNCA EXECUTADO'.
       
       PASSO-2.
           DISPLAY 'PULOU DIRETO AQUI'.
           
      *> Em vez disso, use PERFORM! 
           PERFORM PASSO-2.
```

---

<a name="poo"></a>
## 8️⃣ POO EM COBOL (Object COBOL)

COBOL moderno (COBOL 2002+) suporta **Programação Orientada a Objetos**! 

### 🏗️ **Classe em COBOL**

```cobol
       IDENTIFICATION DIVISION.
       CLASS-ID.  Pessoa.
       
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       REPOSITORY. 
           CLASS Pessoa. 
       
       DATA DIVISION.
       WORKING-STORAGE SECTION.
      *> Atributos privados
       01 nome-privado PIC X(50).
       01 idade-privada PIC 999.
       
       PROCEDURE DIVISION.
       
      *> ========== MÉTODOS ==========
       METHOD-ID. setNome.
       DATA DIVISION.
       LINKAGE SECTION.
       01 novo-nome PIC X(50).
       
       PROCEDURE DIVISION USING novo-nome.
           MOVE novo-nome TO nome-privado.
       END METHOD setNome.
       
       METHOD-ID. getNome.
       DATA DIVISION.
       LINKAGE SECTION.
       01 retorno PIC X(50).
       
       PROCEDURE DIVISION RETURNING retorno.
           MOVE nome-privado TO retorno. 
       END METHOD getNome.
       
       METHOD-ID. setIdade.
       DATA DIVISION.
       LINKAGE SECTION.
       01 nova-idade PIC 999.
       
       PROCEDURE DIVISION USING nova-idade.
           IF nova-idade >= 0 AND nova-idade <= 150
               MOVE nova-idade TO idade-privada
           ELSE
               DISPLAY 'IDADE INVALIDA'
           END-IF.
       END METHOD setIdade.
       
       METHOD-ID. exibirDados.
       PROCEDURE DIVISION.
           DISPLAY 'NOME: ' nome-privado. 
           DISPLAY 'IDADE: ' idade-privada. 
       END METHOD exibirDados.
       
       END CLASS Pessoa.
```

### 🎯 **Usando a Classe**

```cobol
       IDENTIFICATION DIVISION.
       PROGRAM-ID. TestePessoa.
       
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       REPOSITORY.
           CLASS Pessoa. 
       
       DATA DIVISION. 
       WORKING-STORAGE SECTION.
       01 minha-pessoa OBJECT REFERENCE Pessoa.
       01 nome-temp PIC X(50).
       
       PROCEDURE DIVISION. 
           INVOKE Pessoa "NEW" RETURNING minha-pessoa.
           
           INVOKE minha-pessoa "setNome" USING "RODRIGO". 
           INVOKE minha-pessoa "setIdade" USING 25.
           INVOKE minha-pessoa "exibirDados".
           
           INVOKE minha-pessoa "getNome" RETURNING nome-temp. 
           DISPLAY 'NOME RETORNADO: ' nome-temp. 
           
           STOP RUN.
```

### 🧬 **Herança**

```cobol
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
```

---

<a name="exercícios"></a>
## 9️⃣ 50+ EXERCÍCIOS LEETCODE STYLE

### 🟢 **NÍVEL BÁSICO (1-20)**

#### **#1 - Hello World**
```cobol
       IDENTIFICATION DIVISION.
       PROGRAM-ID. EX001.
       
       PROCEDURE DIVISION.
           DISPLAY 'HELLO, WORLD!'.
           STOP RUN.
```

#### **#2 - Soma de Dois Números**
```cobol
       IDENTIFICATION DIVISION.
       PROGRAM-ID. EX002.
       
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 NUM1 PIC 999 VALUE 150.
       01 NUM2 PIC 999 VALUE 250.
       01 SOMA PIC 9999.
       
       PROCEDURE DIVISION.
           ADD NUM1 NUM2 GIVING SOMA. 
           DISPLAY 'RESULTADO:  ' SOMA.
           STOP RUN.
```

#### **#3 - Par ou Ímpar**
```cobol
       IDENTIFICATION DIVISION.
       PROGRAM-ID.  EX003.
       
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 NUMERO PIC 999 VALUE 42.
       01 RESTO  PIC 9.
       
       PROCEDURE DIVISION.
           DIVIDE NUMERO BY 2 GIVING NUMERO REMAINDER RESTO.
           
           IF RESTO = 0
               DISPLAY 'PAR'
           ELSE
               DISPLAY 'IMPAR'
           END-IF.
           STOP RUN.
```

#### **#4 - Maior de Três Números**
```cobol
       IDENTIFICATION DIVISION. 
       PROGRAM-ID. EX004.
       
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 A PIC 999 VALUE 45.
       01 B PIC 999 VALUE 78.
       01 C PIC 999 VALUE 23.
       01 MAIOR PIC 999.
       
       PROCEDURE DIVISION.
           MOVE A TO MAIOR.
           
           IF B > MAIOR
               MOVE B TO MAIOR
           END-IF.
           
           IF C > MAIOR
               MOVE C TO MAIOR
           END-IF.
           
           DISPLAY 'MAIOR: ' MAIOR. 
           STOP RUN. 
```

#### **#5 - Tabuada**
```cobol
       IDENTIFICATION DIVISION.
       PROGRAM-ID. EX005.
       
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 NUMERO PIC 99 VALUE 7.
       01 I      PIC 99. 
       01 RESULTADO PIC 999.
       
       PROCEDURE DIVISION.
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > 10
               MULTIPLY NUMERO BY I GIVING RESULTADO
               DISPLAY NUMERO ' x ' I ' = ' RESULTADO
           END-PERFORM.
           STOP RUN.
```

#### **#6 - Fatorial**
```cobol
       IDENTIFICATION DIVISION.
       PROGRAM-ID. EX006.
       
       DATA DIVISION. 
       WORKING-STORAGE SECTION.
       01 NUMERO PIC 99 VALUE 5.
       01 FATORIAL PIC 9(18) VALUE 1.
       01 I PIC 99.
       
       PROCEDURE DIVISION.
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > NUMERO
               MULTIPLY I BY FATORIAL
           END-PERFORM.
           
           DISPLAY 'FATORIAL:  ' FATORIAL.
           STOP RUN.
```

#### **#7 - Fibonacci (N primeiros)**
```cobol
       IDENTIFICATION DIVISION.
       PROGRAM-ID. EX007.
       
       DATA DIVISION. 
       WORKING-STORAGE SECTION.
       01 N PIC 99 VALUE 10.
       01 A PIC 9(10) VALUE 0.
       01 B PIC 9(10) VALUE 1.
       01 TEMP PIC 9(10).
       01 I PIC 99.
       
       PROCEDURE DIVISION. 
           DISPLAY A. 
           DISPLAY B.
           
           PERFORM VARYING I FROM 3 BY 1 UNTIL I > N
               ADD A B GIVING TEMP
               MOVE B TO A
               MOVE TEMP TO B
               DISPLAY TEMP
           END-PERFORM.
           STOP RUN.
```

#### **#8 - Número Primo**
```cobol
       IDENTIFICATION DIVISION.
       PROGRAM-ID. EX008.
       
       DATA DIVISION. 
       WORKING-STORAGE SECTION.
       01 NUMERO PIC 9999 VALUE 17.
       01 I PIC 9999.
       01 RESTO PIC 9999.
       01 PRIMO PIC 9 VALUE 1.
       
       PROCEDURE DIVISION.
           IF NUMERO < 2
               MOVE 0 TO PRIMO
           ELSE
               PERFORM VARYING I FROM 2 BY 1 UNTIL I >= NUMERO OR PRIMO = 0
                   DIVIDE NUMERO BY I GIVING I REMAINDER RESTO
                   IF RESTO = 0 AND I NOT = NUMERO
                       MOVE 0 TO PRIMO
                   END-IF
               END-PERFORM
           END-IF.
           
           IF PRIMO = 1
               DISPLAY 'PRIMO'
           ELSE
               DISPLAY 'NAO PRIMO'
           END-IF.
           STOP RUN.
```

#### **#9 - Inverter String**
```cobol
       IDENTIFICATION DIVISION.
       PROGRAM-ID. EX009.
       
       DATA DIVISION. 
       WORKING-STORAGE SECTION.
       01 TEXTO PIC X(20) VALUE 'COBOL'.
       01 INVERTIDO PIC X(20).
       01 I PIC 99.
       01 LEN PIC 99.
       01 CHAR PIC X. 
       
       PROCEDURE DIVISION.
           MOVE FUNCTION LENGTH(FUNCTION TRIM(TEXTO)) TO LEN.
           
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > LEN
               MOVE TEXTO(LEN - I + 1:1) TO INVERTIDO(I:1)
           END-PERFORM.
           
           DISPLAY 'ORIGINAL: ' TEXTO.
           DISPLAY 'INVERTIDO: ' INVERTIDO.
           STOP RUN.
```

#### **#10 - Palíndromo**
```cobol
       IDENTIFICATION DIVISION.
       PROGRAM-ID. EX010.
       
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 TEXTO PIC X(20) VALUE 'ARARA'.
       01 INVERTIDO PIC X(20).
       01 I PIC 99.
       01 LEN PIC 99.
       
       PROCEDURE DIVISION.
           MOVE FUNCTION LENGTH(FUNCTION TRIM(TEXTO)) TO LEN.
           
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > LEN
               MOVE TEXTO(LEN - I + 1:1) TO INVERTIDO(I:1)
           END-PERFORM.
           
           IF TEXTO = INVERTIDO
               DISPLAY 'E PALINDROMO'
           ELSE
               DISPLAY 'NAO E PALINDROMO'
           END-IF.
           STOP RUN.
```

#### **#11 - Média de Notas** ⭐
```cobol
       IDENTIFICATION DIVISION.
       PROGRAM-ID. EX011-MEDIA-NOTAS.
       AUTHOR.  RODRIGO. 
       
       DATA DIVISION. 
       WORKING-STORAGE SECTION.
       01 NOTA1  PIC 999V99 VALUE 85.50.
       01 NOTA2  PIC 999V99 VALUE 92.00.
       01 NOTA3  PIC 999V99 VALUE 78.75.
       01 NOTA4  PIC 999V99 VALUE 88.25.
       01 MEDIA  PIC 999V99.
       01 SOMA   PIC 9999V99.
       01 STATUS-ALUNO PIC X(10).
       
       PROCEDURE DIVISION.
       CALCULAR-MEDIA.
           ADD NOTA1 NOTA2 NOTA3 NOTA4 GIVING SOMA.
           DIVIDE SOMA BY 4 GIVING MEDIA. 
           
           DISPLAY '================================'.
           DISPLAY 'SISTEMA DE AVALIACAO DE NOTAS'.
           DISPLAY '================================'.
           DISPLAY 'NOTA 1: ' NOTA1.
           DISPLAY 'NOTA 2: ' NOTA2.
           DISPLAY 'NOTA 3: ' NOTA3.
           DISPLAY 'NOTA 4: ' NOTA4.
           DISPLAY '--------------------------------'.
           DISPLAY 'MEDIA FINAL: ' MEDIA.
           
           EVALUATE TRUE
               WHEN MEDIA >= 90
                   MOVE 'EXCELENTE' TO STATUS-ALUNO
               WHEN MEDIA >= 80
                   MOVE 'OTIMO' TO STATUS-ALUNO
               WHEN MEDIA >= 70
                   MOVE 'APROVADO' TO STATUS-ALUNO
               WHEN MEDIA >= 50
                   MOVE 'RECUPERACAO' TO STATUS-ALUNO
               WHEN OTHER
                   MOVE 'REPROVADO' TO STATUS-ALUNO
           END-EVALUATE.
           
           DISPLAY 'STATUS:  ' STATUS-ALUNO. 
           DISPLAY '================================'.
           
           STOP RUN.
```

#### **#12 - Menu com EVALUATE** ⭐
```cobol
       IDENTIFICATION DIVISION.
       PROGRAM-ID. EX012-MENU-EVALUATE.
       
       DATA DIVISION.
       WORKING-STORAGE SECTION. 
       01 OPCAO PIC 9 VALUE 2.
       01 NUM1  PIC 999V99 VALUE 100.50.
       01 NUM2  PIC 999V99 VALUE 25.25.
       01 RESULTADO PIC 9999V99.
       
       PROCEDURE DIVISION.
       EXIBIR-MENU.
           DISPLAY '===== CALCULADORA ====='.
           DISPLAY '1 - SOMAR'.
           DISPLAY '2 - SUBTRAIR'.
           DISPLAY '3 - MULTIPLICAR'.
           DISPLAY '4 - DIVIDIR'.
           DISPLAY '0 - SAIR'.
           DISPLAY '======================'.
           
           EVALUATE OPCAO
               WHEN 1
                   ADD NUM1 NUM2 GIVING RESULTADO
                   DISPLAY 'SOMA: ' RESULTADO
               WHEN 2
                   SUBTRACT NUM2 FROM NUM1 GIVING RESULTADO
                   DISPLAY 'SUBTRACAO: ' RESULTADO
               WHEN 3
                   MULTIPLY NUM1 BY NUM2 GIVING RESULTADO
                   DISPLAY 'MULTIPLICACAO: ' RESULTADO
               WHEN 4
                   IF NUM2 NOT = 0
                       DIVIDE NUM1 BY NUM2 GIVING RESULTADO
                       DISPLAY 'DIVISAO: ' RESULTADO
                   ELSE
                       DISPLAY 'ERRO: DIVISAO POR ZERO!'
                   END-IF
               WHEN 0
                   DISPLAY 'SAINDO...'
               WHEN OTHER
                   DISPLAY 'OPCAO INVALIDA!'
           END-EVALUATE. 
           
           STOP RUN.
```

#### **#13 - Contar Vogais**
```cobol
       IDENTIFICATION DIVISION.
       PROGRAM-ID. EX013.
       
       DATA DIVISION. 
       WORKING-STORAGE SECTION.
       01 TEXTO PIC X(50) VALUE 'PROGRAMACAO COBOL'.
       01 I PIC 99.
       01 LEN PIC 99.
       01 CHAR PIC X.
       01 VOGAIS PIC 99 VALUE ZERO.
       
       PROCEDURE DIVISION.
           MOVE FUNCTION LENGTH(FUNCTION TRIM(TEXTO)) TO LEN.
           
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > LEN
               MOVE TEXTO(I:1) TO CHAR
               EVALUATE CHAR
                   WHEN 'A'
                   WHEN 'E'
                   WHEN 'I'
                   WHEN 'O'
                   WHEN 'U'
                       ADD 1 TO VOGAIS
               END-EVALUATE
           END-PERFORM.
           
           DISPLAY 'VOGAIS: ' VOGAIS. 
           STOP RUN.
```

#### **#14 - Ano Bissexto**
```cobol
       IDENTIFICATION DIVISION. 
       PROGRAM-ID. EX014.
       
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 ANO PIC 9999 VALUE 2024.
       01 RESTO4 PIC 9.
       01 RESTO100 PIC 99.
       01 RESTO400 PIC 999.
       
       PROCEDURE DIVISION.
           DIVIDE ANO BY 4 GIVING ANO REMAINDER RESTO4.
           DIVIDE ANO BY 100 GIVING ANO REMAINDER RESTO100.
           DIVIDE ANO BY 400 GIVING ANO REMAINDER RESTO400.
           
           IF (RESTO4 = 0 AND RESTO100 NOT = 0) OR RESTO400 = 0
               DISPLAY 'BISSEXTO'
           ELSE
               DISPLAY 'NAO BISSEXTO'
           END-IF.
           STOP RUN.
```

#### **#15 - Somatório 1 até N**
```cobol
       IDENTIFICATION DIVISION. 
       PROGRAM-ID. EX015.
       
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 N PIC 999 VALUE 100.
       01 SOMA PIC 99999 VALUE ZERO.
       01 I PIC 999.
       
       PROCEDURE DIVISION.
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > N
               ADD I TO SOMA
           END-PERFORM.
           
           DISPLAY 'SOMA DE 1 ATE ' N ':  ' SOMA.
           STOP RUN.
```

#### **#16 - Converter Celsius para Fahrenheit**
```cobol
       IDENTIFICATION DIVISION. 
       PROGRAM-ID. EX016.
       
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 CELSIUS PIC S999V99 VALUE 25.00.
       01 FAHRENHEIT PIC S999V99.
       
       PROCEDURE DIVISION.
           COMPUTE FAHRENHEIT = (CELSIUS * 9 / 5) + 32.
           DISPLAY CELSIUS 'C = ' FAHRENHEIT 'F'. 
           STOP RUN. 
```

#### **#17 - Maior e Menor em Array**
```cobol
       IDENTIFICATION DIVISION.
       PROGRAM-ID. EX017.
       
       DATA DIVISION. 
       WORKING-STORAGE SECTION.
       01 NUMEROS. 
           05 NUM OCCURS 5 TIMES PIC 999.
       01 I PIC 9. 
       01 MAIOR PIC 999 VALUE ZERO.
       01 MENOR PIC 999 VALUE 999.
       
       PROCEDURE DIVISION.
           MOVE 45 TO NUM(1).
           MOVE 12 TO NUM(2).
           MOVE 89 TO NUM(3).
           MOVE 34 TO NUM(4).
           MOVE 67 TO NUM(5).
           
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > 5
               IF NUM(I) > MAIOR
                   MOVE NUM(I) TO MAIOR
               END-IF
               IF NUM(I) < MENOR
                   MOVE NUM(I) TO MENOR
               END-IF
           END-PERFORM. 
           
           DISPLAY 'MAIOR: ' MAIOR.
           DISPLAY 'MENOR: ' MENOR.
           STOP RUN.
```

#### **#18 - Contagem Regressiva**
```cobol
       IDENTIFICATION DIVISION. 
       PROGRAM-ID. EX018.
       
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 I PIC 99 VALUE 10.
       
       PROCEDURE DIVISION.
           PERFORM UNTIL I < 1
               DISPLAY I
               SUBTRACT 1 FROM I
           END-PERFORM.
           DISPLAY 'LANCAMENTO! '.
           STOP RUN. 
```

#### **#19 - Calculadora de IMC**
```cobol
       IDENTIFICATION DIVISION.
       PROGRAM-ID. EX019.
       
       DATA DIVISION. 
       WORKING-STORAGE SECTION.
       01 PESO PIC 999V99 VALUE 75.50.
       01 ALTURA PIC 9V99 VALUE 1.75.
       01 IMC PIC 99V99.
       
       PROCEDURE DIVISION.
           COMPUTE IMC = PESO / (ALTURA ** 2).
           
           DISPLAY 'IMC:  ' IMC.
           
           EVALUATE TRUE
               WHEN IMC < 18.5
                   DISPLAY 'ABAIXO DO PESO'
               WHEN IMC < 25
                   DISPLAY 'PESO NORMAL'
               WHEN IMC < 30
                   DISPLAY 'SOBREPESO'
               WHEN OTHER
                   DISPLAY 'OBESIDADE'
           END-EVALUATE. 
           STOP RUN.
```

#### **#20 - Dias do Mês**
```cobol
       IDENTIFICATION DIVISION. 
       PROGRAM-ID. EX020.
       
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 MES PIC 99 VALUE 2.
       01 ANO PIC 9999 VALUE 2024.
       01 DIAS PIC 99.
       
       PROCEDURE DIVISION. 
           EVALUATE MES
               WHEN 1
               WHEN 3
               WHEN 5
               WHEN 7
               WHEN 8
               WHEN 10
               WHEN 12
                   MOVE 31 TO DIAS
               WHEN 4
               WHEN 6
               WHEN 9
               WHEN 11
                   MOVE 30 TO DIAS
               WHEN 2
                   IF FUNCTION MOD(ANO, 4) = 0
                       MOVE 29 TO DIAS
                   ELSE
                       MOVE 28 TO DIAS
                   END-IF
           END-EVALUATE.
           
           DISPLAY 'O MES ' MES ' TEM ' DIAS ' DIAS'. 
           STOP RUN.
```

---

### 🟡 **NÍVEL INTERMEDIÁRIO (21-40)**

#### **#21 - Bubble Sort**
```cobol
       IDENTIFICATION DIVISION.
       PROGRAM-ID. EX021.
       
       DATA DIVISION. 
       WORKING-STORAGE SECTION.
       01 ARRAY-NUM. 
           05 NUM OCCURS 5 TIMES PIC 999.
       01 I PIC 9.
       01 J PIC 9.
       01 TEMP PIC 999.
       01 TROCOU PIC 9.
       
       PROCEDURE DIVISION.
           MOVE 64 TO NUM(1).
           MOVE 34 TO NUM(2).
           MOVE 25 TO NUM(3).
           MOVE 12 TO NUM(4).
           MOVE 22 TO NUM(5).
           
           PERFORM VARYING I FROM 1 BY 1 UNTIL I >= 5
               MOVE 0 TO TROCOU
               PERFORM VARYING J FROM 1 BY 1 UNTIL J > (5 - I)
                   IF NUM(J) > NUM(J + 1)
                       MOVE NUM(J) TO TEMP
                       MOVE NUM(J + 1) TO NUM(J)
                       MOVE TEMP TO NUM(J + 1)
                       MOVE 1 TO TROCOU
                   END-IF
               END-PERFORM
               IF TROCOU = 0
                   EXIT PERFORM
               END-IF
           END-PERFORM.
           
           DISPLAY 'ARRAY ORDENADO: '.
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > 5
               DISPLAY NUM(I)
           END-PERFORM. 
           STOP RUN.
```

#### **#22 - Busca Binária**
```cobol
       IDENTIFICATION DIVISION. 
       PROGRAM-ID. EX022.
       
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 ARRAY-NUM.
           05 NUM OCCURS 10 TIMES PIC 999.
       01 BUSCAR PIC 999 VALUE 50.
       01 INICIO PIC 99 VALUE 1.
       01 FIM PIC 99 VALUE 10.
       01 MEIO PIC 99.
       01 ENCONTRADO PIC 9 VALUE 0.
       
       PROCEDURE DIVISION.
      *> Array já ordenado
           MOVE 10 TO NUM(1).
           MOVE 20 TO NUM(2).
           MOVE 30 TO NUM(3).
           MOVE 40 TO NUM(4).
           MOVE 50 TO NUM(5).
           MOVE 60 TO NUM(6).
           MOVE 70 TO NUM(7).
           MOVE 80 TO NUM(8).
           MOVE 90 TO NUM(9).
           MOVE 100 TO NUM(10).
           
           PERFORM UNTIL INICIO > FIM OR ENCONTRADO = 1
               COMPUTE MEIO = (INICIO + FIM) / 2
               
               IF NUM(MEIO) = BUSCAR
                   MOVE 1 TO ENCONTRADO
                   DISPLAY 'ENCONTRADO NA POSICAO ' MEIO
               ELSE
                   IF BUSCAR < NUM(MEIO)
                       COMPUTE FIM = MEIO - 1
                   ELSE
                       COMPUTE INICIO = MEIO + 1
                   END-IF
               END-IF
           END-PERFORM.
           
           IF ENCONTRADO = 0
               DISPLAY 'NAO ENCONTRADO'
           END-IF.
           STOP RUN.
```

#### **#23 - Números Primos até N**
```cobol
       IDENTIFICATION DIVISION.
       PROGRAM-ID. EX023.
       
       DATA DIVISION. 
       WORKING-STORAGE SECTION.
       01 N PIC 999 VALUE 50.
       01 NUM PIC 999.
       01 I PIC 999.
       01 PRIMO PIC 9.
       01 RESTO PIC 999.
       
       PROCEDURE DIVISION.
           DISPLAY 'PRIMOS ATE ' N ': '.
           
           PERFORM VARYING NUM FROM 2 BY 1 UNTIL NUM > N
               MOVE 1 TO PRIMO
               PERFORM VARYING I FROM 2 BY 1 UNTIL I >= NUM OR PRIMO = 0
                   DIVIDE NUM BY I GIVING I REMAINDER RESTO
                   IF RESTO = 0 AND I NOT = NUM
                       MOVE 0 TO PRIMO
                   END-IF
               END-PERFORM
               
               IF PRIMO = 1
                   DISPLAY NUM
               END-IF
           END-PERFORM.
           STOP RUN.
```

#### **#24 - MDC (Máximo Divisor Comum)**
```cobol
       IDENTIFICATION DIVISION.
       PROGRAM-ID. EX024.
       
       DATA DIVISION.
       WORKING-STORAGE SECTION. 
       01 A PIC 9999 VALUE 48.
       01 B PIC 9999 VALUE 18.
       01 TEMP PIC 9999.
       
       PROCEDURE DIVISION.
      *> Algoritmo de Euclides
           PERFORM UNTIL B = 0
               MOVE B TO TEMP
               DIVIDE A BY B GIVING A REMAINDER B
               MOVE TEMP TO A
           END-PERFORM.
           
           DISPLAY 'MDC:  ' A.
           STOP RUN.
```

#### **#25 - MMC (Mínimo Múltiplo Comum)**
```cobol
       IDENTIFICATION DIVISION.
       PROGRAM-ID.  EX025.
       
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 A PIC 9999 VALUE 12.
       01 B PIC 9999 VALUE 18.
       01 ORIGINAL-A PIC 9999.
       01 ORIGINAL-B PIC 9999.
       01 TEMP PIC 9999.
       01 MDC PIC 9999.
       01 MMC PIC 99999999.
       
       PROCEDURE DIVISION.
           MOVE A TO ORIGINAL-A.
           MOVE B TO ORIGINAL-B.
           
      *> Calcular MDC
           PERFORM UNTIL B = 0
               MOVE B TO TEMP
               DIVIDE A BY B GIVING A REMAINDER B
               MOVE TEMP TO A
           END-PERFORM. 
           MOVE A TO MDC. 
           
      *> MMC = (A * B) / MDC
           MULTIPLY ORIGINAL-A BY ORIGINAL-B GIVING MMC. 
           DIVIDE MMC BY MDC GIVING MMC.
           
           DISPLAY 'MMC:  ' MMC.
           STOP RUN.
```

#### **#26 - Soma de Dígitos**
```cobol
       IDENTIFICATION DIVISION.
       PROGRAM-ID. EX026.
       
       DATA DIVISION. 
       WORKING-STORAGE SECTION.
       01 NUMERO PIC 99999 VALUE 12345.
       01 SOMA PIC 999 VALUE ZERO.
       01 DIGITO PIC 9.
       
       PROCEDURE DIVISION. 
           PERFORM UNTIL NUMERO = 0
               DIVIDE NUMERO BY 10 GIVING NUMERO REMAINDER DIGITO
               ADD DIGITO TO SOMA
           END-PERFORM.
           
           DISPLAY 'SOMA DOS DIGITOS: ' SOMA. 
           STOP RUN. 
```

#### **#27 - Número Armstrong**
```cobol
       IDENTIFICATION DIVISION.
       PROGRAM-ID. EX027.
       
       DATA DIVISION. 
       WORKING-STORAGE SECTION.
       01 NUMERO PIC 9999 VALUE 153.
       01 ORIGINAL PIC 9999.
       01 SOMA PIC 99999 VALUE ZERO.
       01 DIGITO PIC 9.
       01 CUBO PIC 9999.
       
       PROCEDURE DIVISION.
           MOVE NUMERO TO ORIGINAL. 
           
           PERFORM UNTIL NUMERO = 0
               DIVIDE NUMERO BY 10 GIVING NUMERO REMAINDER DIGITO
               COMPUTE CUBO = DIGITO ** 3
               ADD CUBO TO SOMA
           END-PERFORM.
           
           IF SOMA = ORIGINAL
               DISPLAY ORIGINAL ' E ARMSTRONG'
           ELSE
               DISPLAY ORIGINAL ' NAO E ARMSTRONG'
           END-IF.
           STOP RUN.
```

#### **#28 - Conversão Decimal para Binário**
```cobol
       IDENTIFICATION DIVISION. 
       PROGRAM-ID. EX028.
       
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 DECIMAL PIC 9999 VALUE 42.
       01 BINARIO PIC X(20).
       01 I PIC 99 VALUE 1.
       01 RESTO PIC 9.
       
       PROCEDURE DIVISION.
           PERFORM UNTIL DECIMAL = 0
               DIVIDE DECIMAL BY 2 GIVING DECIMAL REMAINDER RESTO
               
               IF RESTO = 0
                   MOVE '0' TO BINARIO(I: 1)
               ELSE
                   MOVE '1' TO BINARIO(I:1)
               END-IF
               
               ADD 1 TO I
           END-PERFORM.
           
           DISPLAY 'BINARIO: ' BINARIO. 
           STOP RUN. 
```

#### **#29 - Matriz 3x3 - Soma**
```cobol
       IDENTIFICATION DIVISION.
       PROGRAM-ID. EX029.
       
       DATA DIVISION. 
       WORKING-STORAGE SECTION.
       01 MATRIZ. 
           05 LINHA OCCURS 3 TIMES. 
               10 COLUNA OCCURS 3 TIMES PIC 999.
       01 I PIC 9.
       01 J PIC 9.
       01 SOMA PIC 9999 VALUE ZERO.
       
       PROCEDURE DIVISION.
      *> Inicializar matriz
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > 3
               PERFORM VARYING J FROM 1 BY 1 UNTIL J > 3
                   COMPUTE COLUNA(I, J) = (I * 10) + J
               END-PERFORM
           END-PERFORM.
           
      *> Somar elementos
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > 3
               PERFORM VARYING J FROM 1 BY 1 UNTIL J > 3
                   ADD COLUNA(I, J) TO SOMA
               END-PERFORM
           END-PERFORM. 
           
           DISPLAY 'SOMA TOTAL: ' SOMA.
           STOP RUN.
```

#### **#30 - Sequência de Collatz**
```cobol
       IDENTIFICATION DIVISION.
       PROGRAM-ID. EX030.
       
       DATA DIVISION. 
       WORKING-STORAGE SECTION.
       01 N PIC 9(10) VALUE 27.
       01 PASSOS PIC 999 VALUE ZERO.
       01 RESTO PIC 9.
       
       PROCEDURE DIVISION.
           DISPLAY 'SEQUENCIA DE COLLATZ:'. 
           
           PERFORM UNTIL N = 1
               DISPLAY N
               ADD 1 TO PASSOS
               
               DIVIDE N BY 2 GIVING N REMAINDER RESTO
               
               IF RESTO = 0
                   DIVIDE N BY 2 GIVING N
               ELSE
                   COMPUTE N = (N * 3) + 1
               END-IF
           END-PERFORM.
           
           DISPLAY '1'. 
           DISPLAY 'TOTAL DE PASSOS: ' PASSOS.
           STOP RUN. 
```

#### **#31-40:  Desafios Rápidos**

```cobol
      *> #31 - Contar palavras em string
      *> #32 - Remover espaços duplicados
      *> #33 - Calcular potência (sem **)
      *> #34 - Número perfeito (soma dos divisores = número)
      *> #35 - Série de Taylor (seno/cosseno)
      *> #36 - Conversão Binário para Decimal
      *> #37 - Jogo de Adivinhação
      *> #38 - Validar CPF
      *> #39 - Matriz Transposta
      *> #40 - Quick Sort
```

---

### 🔴 **NÍVEL AVANÇADO (41-50)**

#### **#41 - Sistema de Cadastro Completo**

```cobol
       IDENTIFICATION DIVISION.
       PROGRAM-ID. EX041-CADASTRO.
       
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 OPCAO PIC 9.
       01 CONTINUAR PIC X VALUE 'S'.
       
       01 CLIENTES. 
           05 CLIENTE OCCURS 100 TIMES.
               10 ID-CLIENTE PIC 9999. 
               10 NOME-CLIENTE PIC X(50).
               10 IDADE-CLIENTE PIC 999.
               10 ATIVO PIC X VALUE 'N'.
       
       01 TOTAL-CLIENTES PIC 999 VALUE ZERO.
       01 I PIC 999.
       01 ID-BUSCA PIC 9999.
       01 ENCONTRADO PIC 9.
       
       PROCEDURE DIVISION.
       MENU-PRINCIPAL.
           PERFORM UNTIL CONTINUAR = 'N'
               DISPLAY '==========================='. 
               DISPLAY 'SISTEMA DE CADASTRO'.
               DISPLAY '==========================='.
               DISPLAY '1 - INCLUIR CLIENTE'.
               DISPLAY '2 - LISTAR CLIENTES'.
               DISPLAY '3 - BUSCAR CLIENTE'.
               DISPLAY '4 - EXCLUIR CLIENTE'.
               DISPLAY '0 - SAIR'.
               DISPLAY '==========================='.
               DISPLAY 'OPCAO: ' WITH NO ADVANCING
               ACCEPT OPCAO
               
               EVALUATE OPCAO
                   WHEN 1
                       PERFORM INCLUIR-CLIENTE
                   WHEN 2
                       PERFORM LISTAR-CLIENTES
                   WHEN 3
                       PERFORM BUSCAR-CLIENTE
                   WHEN 4
                       PERFORM EXCLUIR-CLIENTE
                   WHEN 0
                       MOVE 'N' TO CONTINUAR
                   WHEN OTHER
                       DISPLAY 'OPCAO INVALIDA!'
               END-EVALUATE
           END-PERFORM.
           
           DISPLAY 'SISTEMA ENCERRADO! '.
           STOP RUN. 
       
       INCLUIR-CLIENTE.
           ADD 1 TO TOTAL-CLIENTES. 
           MOVE TOTAL-CLIENTES TO ID-CLIENTE(TOTAL-CLIENTES).
           
           DISPLAY 'NOME:  ' WITH NO ADVANCING.
           ACCEPT NOME-CLIENTE(TOTAL-CLIENTES).
           
           DISPLAY 'IDADE: ' WITH NO ADVANCING.
           ACCEPT IDADE-CLIENTE(TOTAL-CLIENTES).
           
           MOVE 'S' TO ATIVO(TOTAL-CLIENTES).
           
           DISPLAY 'CLIENTE CADASTRADO COM ID: ' 
               ID-CLIENTE(TOTAL-CLIENTES).
       
       LISTAR-CLIENTES.
           DISPLAY '===== CLIENTES CADASTRADOS ====='.
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > TOTAL-CLIENTES
               IF ATIVO(I) = 'S'
                   DISPLAY 'ID: ' ID-CLIENTE(I) 
                       ' | NOME: ' NOME-CLIENTE(I)
                       ' | IDADE: ' IDADE-CLIENTE(I)
               END-IF
           END-PERFORM.
       
       BUSCAR-CLIENTE.
           DISPLAY 'ID PARA BUSCAR: ' WITH NO ADVANCING.
           ACCEPT ID-BUSCA.
           MOVE 0 TO ENCONTRADO.
           
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > TOTAL-CLIENTES
               IF ID-CLIENTE(I) = ID-BUSCA AND ATIVO(I) = 'S'
                   DISPLAY '=== CLIENTE ENCONTRADO ==='.
                   DISPLAY 'NOME:  ' NOME-CLIENTE(I).
                   DISPLAY 'IDADE: ' IDADE-CLIENTE(I).
                   MOVE 1 TO ENCONTRADO
                   EXIT PERFORM
               END-IF
           END-PERFORM.
           
           IF ENCONTRADO = 0
               DISPLAY 'CLIENTE NAO ENCONTRADO!'
           END-IF.
       
       EXCLUIR-CLIENTE.
           DISPLAY 'ID PARA EXCLUIR:  ' WITH NO ADVANCING.
           ACCEPT ID-BUSCA. 
           
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > TOTAL-CLIENTES
               IF ID-CLIENTE(I) = ID-BUSCA AND ATIVO(I) = 'S'
                   MOVE 'N' TO ATIVO(I)
                   DISPLAY 'CLIENTE EXCLUIDO!'
                   EXIT PERFORM
               END-IF
           END-PERFORM.
```

#### **#42 - Calculadora Científica**
```cobol
       IDENTIFICATION DIVISION.
       PROGRAM-ID. EX042-CALCULADORA-CIENTIFICA.
       
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 OPCAO PIC 99.
       01 NUM1 PIC S9(5)V99.
       01 NUM2 PIC S9(5)V99.
       01 RESULTADO PIC S9(10)V99.
       
       PROCEDURE DIVISION.
           PERFORM UNTIL OPCAO = 0
               DISPLAY '===== CALCULADORA CIENTIFICA ====='.
               DISPLAY '1 - RAIZ QUADRADA'.
               DISPLAY '2 - POTENCIA'.
               DISPLAY '3 - SENO'.
               DISPLAY '4 - COSSENO'.
               DISPLAY '5 - LOGARITMO'.
               DISPLAY '6 - EXPONENCIAL'.
               DISPLAY '0 - SAIR'.
               ACCEPT OPCAO
               
               EVALUATE OPCAO
                   WHEN 1
                       DISPLAY 'NUMERO:  '
                       ACCEPT NUM1
                       COMPUTE RESULTADO = FUNCTION SQRT(NUM1)
                       DISPLAY 'RAIZ:  ' RESULTADO
                   WHEN 2
                       DISPLAY 'BASE: '
                       ACCEPT NUM1
                       DISPLAY 'EXPOENTE: '
                       ACCEPT NUM2
                       COMPUTE RESULTADO = NUM1 ** NUM2
                       DISPLAY 'RESULTADO: ' RESULTADO
                   WHEN 3
                       DISPLAY 'ANGULO (radianos): '
                       ACCEPT NUM1
                       COMPUTE RESULTADO = FUNCTION SIN(NUM1)
                       DISPLAY 'SENO:  ' RESULTADO
                   WHEN 4
                       DISPLAY 'ANGULO (radianos): '
                       ACCEPT NUM1
                       COMPUTE RESULTADO = FUNCTION COS(NUM1)
                       DISPLAY 'COSSENO: ' RESULTADO
                   WHEN 5
                       DISPLAY 'NUMERO: '
                       ACCEPT NUM1
                       COMPUTE RESULTADO = FUNCTION LOG(NUM1)
                       DISPLAY 'LOG: ' RESULTADO
                   WHEN 6
                       DISPLAY 'NUMERO: '
                       ACCEPT NUM1
                       COMPUTE RESULTADO = FUNCTION EXP(NUM1)
                       DISPLAY 'e^x: ' RESULTADO
               END-EVALUATE
           END-PERFORM.
           STOP RUN.
```

#### **#43-50: Projetos Finais**

```cobol
      *> #43 - Sistema de Biblioteca (empréstimos, devoluções)
      *> #44 - Conversor de Moedas com taxas
      *> #45 - Gerador de Relatórios (arquivos)
      *> #46 - Validador de Cartão de Crédito (Luhn)
      *> #47 - Criptografia Caesar
      *> #48 - Sistema de Notas Fiscais
      *> #49 - Agenda de Contatos Completa
      *> #50 - Mini Banco (contas, transações, saldo)
```

---


## 🎯 RESUMO FINAL - CHEAT SHEET

```cobol
      *> ============ ESTRUTURA ============
       IDENTIFICATION DIVISION.
       PROGRAM-ID. nome. 
       DATA DIVISION.
       WORKING-STORAGE SECTION. 
       PROCEDURE DIVISION.
       
      *> ============ VARIÁVEIS ============
       





# 🎯 EXPLICAÇÃO DETALHADA DA SINTAXE COBOL

Vou destrinchar **CADA PALAVRA, CADA SÍMBOLO** do COBOL para você!  

---

## 📚 ESTRUTURA BÁSICA - PALAVRA POR PALAVRA

```cobol
      *> Este é um comentário
       IDENTIFICATION DIVISION.
       PROGRAM-ID. MEU-PROGRAMA.
       
       ENVIRONMENT DIVISION.
       
       DATA DIVISION.
       WORKING-STORAGE SECTION. 
       01 NOME PIC X(30) VALUE 'TESTE'.
       
       PROCEDURE DIVISION.
           DISPLAY 'OLA'.
           STOP RUN. 
```

### 🔍 DISSECANDO LINHA POR LINHA: 

---

#### **`*>` = COMENTÁRIO MODERNO**
```cobol
      *> Este texto é ignorado pelo compilador
```
- **`*>`** = Marca comentário de linha (COBOL 2002+)
- **Alternativa antiga:** `*` na coluna 7

```cobol
      * Comentário antigo (coluna 7)
```

---

#### **`IDENTIFICATION DIVISION. ` = CABEÇALHO DO PROGRAMA**

```cobol
       IDENTIFICATION DIVISION.
```

| Palavra | Significado |
|---------|-------------|
| **IDENTIFICATION** | "Identificação" - seção de metadados |
| **DIVISION** | "Divisão" - uma das 4 partes obrigatórias |
| **.** | **OBRIGATÓRIO! ** Todo comando COBOL termina com ponto |

**🚨 REGRA:** Começa na **ÁREA A** (colunas 8-11)

---

#### **`PROGRAM-ID.  MEU-PROGRAMA.` = NOME DO PROGRAMA**

```cobol
       PROGRAM-ID. MEU-PROGRAMA. 
```

| Palavra | Significado |
|---------|-------------|
| **PROGRAM-ID** | "ID do programa" - identificador único |
| **.** | Separador (obrigatório após PROGRAM-ID) |
| **MEU-PROGRAMA** | Nome que você escolhe (sem espaços, use hífen `-`) |
| **.** | Fim do comando |

**✅ VÁLIDO:** `PROGRAM-ID.  CALC-01. `  
**❌ INVÁLIDO:** `PROGRAM-ID. CALC 01.` (tem espaço!)

---

#### **`DATA DIVISION.` = ONDE VOCÊ DECLARA VARIÁVEIS**

```cobol
       DATA DIVISION.
       WORKING-STORAGE SECTION. 
```

| Palavra | Significado |
|---------|-------------|
| **DATA** | "Dados" |
| **DIVISION** | É uma das 4 divisões principais |
| **WORKING-STORAGE** | Área de memória para variáveis temporárias |
| **SECTION** | Subdivisão dentro de DATA DIVISION |

**📌 Outras SECTIONS possíveis:**
- `FILE SECTION` → Arquivos
- `LINKAGE SECTION` → Parâmetros recebidos
- `LOCAL-STORAGE SECTION` → Variáveis locais

---

#### **`01 NOME PIC X(30) VALUE 'TESTE'.` = DECLARAÇÃO DE VARIÁVEL**

```cobol
       01 NOME PIC X(30) VALUE 'TESTE'.
```

Vamos **explodir** essa linha: 

| Parte | O que é | Explicação |
|-------|---------|-----------|
| **`01`** | **Nível hierárquico** | Número que define estrutura (01, 05, 10, 77, 88) |
| **`NOME`** | **Nome da variável** | Identificador único (você escolhe) |
| **`PIC`** | **PICTURE** | Define o "formato" da variável |
| **`X(30)`** | **Tipo e tamanho** | X = alfanumérico, 30 = 30 caracteres |
| **`VALUE`** | **Valor inicial** | Opcional:  inicializa a variável |
| **`'TESTE'`** | **Texto literal** | Aspas simples para strings |
| **`.`** | **Fim do comando** | SEMPRE termina com ponto!  |

---

### 🔢 NÍVEIS HIERÁRQUICOS EXPLICADOS

```cobol
       01 CLIENTE.                     ← Grupo principal (começa área A)
           05 DADOS-PESSOAIS.         ← Subgrupo (área B)
               10 NOME PIC X(40).     ← Campo individual
               10 IDADE PIC 99.       ← Campo individual
           05 DADOS-PROFISSIONAIS.    ← Outro subgrupo
               10 CARGO PIC X(30).
```

**📊 HIERARQUIA:**

```
01 = RAIZ (maior nível)
  ├── 05 = SUB-NÍVEL
  │     ├── 10 = FOLHA (menor nível)
  │     └── 10 = FOLHA
  └── 05 = SUB-NÍVEL
        └── 10 = FOLHA
```

**🎯 REGRA DE OURO:**
- Números **MENORES** = níveis **SUPERIORES**
- Números **MAIORES** = níveis **INFERIORES**

---

### 🖼️ PICTURE (PIC) - O CORAÇÃO DO COBOL

#### **`PIC 9` = NÚMERO**

```cobol
       01 IDADE PIC 99.              → 2 dígitos:  00 a 99
       01 PRECO PIC 9(5).            → 5 dígitos: 00000 a 99999
       01 CEP PIC 9(8).              → 8 dígitos:  00000000 a 99999999
```

| Código | Significado |
|--------|-------------|
| **`9`** | Um dígito numérico (0-9) |
| **`9(5)`** | 5 dígitos numéricos |
| **`99`** | Mesma coisa que `9(2)` |

---

#### **`PIC X` = ALFANUMÉRICO (QUALQUER CARACTERE)**

```cobol
       01 NOME PIC X(50).            → 50 caracteres
       01 SIGLA PIC XX.              → 2 caracteres
       01 MENSAGEM PIC X(100).       → 100 caracteres
```

| Código | Aceita |
|--------|--------|
| **`X`** | Letras, números, símbolos, TUDO! |

---

#### **`PIC A` = ALFABÉTICO (SÓ LETRAS)**

```cobol
       01 INICIAL PIC A.             → 1 letra
       01 ESTADO PIC AA.             → 2 letras (ex: SP, RJ)
```

| Código | Aceita |
|--------|--------|
| **`A`** | Apenas A-Z e espaço (sem números!) |

---

#### **`PIC S` = COM SINAL (+ ou -)**

```cobol
       01 TEMPERATURA PIC S999.      → -999 a +999
       01 SALDO PIC S9(7)V99.        �� -9999999. 99 a +9999999.99
```

| Código | Significado |
|--------|-------------|
| **`S`** | Aceita número **negativo** |

---

#### **`PIC V` = PONTO DECIMAL IMPLÍCITO**

```cobol
       01 PRECO PIC 9(5)V99.         → 99999.99 (sem ocupar espaço)
       01 TAXA PIC 99V999.           → 99. 999
```

**⚠️ ATENÇÃO:**
- O `V` **NÃO** é armazenado na memória! 
- É só um marcador de posição do ponto decimal
- Para **exibir** o ponto, use edição:  `PIC 9(5).99`

```cobol
       01 PRECO-INTERNO PIC 9(5)V99 VALUE 12345.67.
       01 PRECO-EXIBIR PIC $$,$$$,$$9.99.
       
       MOVE PRECO-INTERNO TO PRECO-EXIBIR. 
       DISPLAY PRECO-EXIBIR.   → $123,45.67
```

---

#### **PICTURES EDITADOS (FORMATAÇÃO)**

```cobol
       01 CPF-EDITADO PIC 999.999.999-99.        → 123.456.789-01
       01 TELEFONE PIC (99)9999-9999.            → (11)9876-5432
       01 DATA PIC 99/99/9999.                   → 07/01/2026
       01 PRECO PIC $$$,$$9.99.                  → $1,234.56
       01 PERCENTUAL PIC ZZ9.99%.                 → 12.50%
```

| Símbolo | O que faz |
|---------|-----------|
| **`.`** | Ponto fixo |
| **`/`** | Barra fixa |
| **`-`** | Hífen fixo |
| **`$`** | Cifrão flutuante |
| **`Z`** | Zero é substituído por espaço |
| **`,`** | Vírgula (separador de milhar) |

---

### 🎯 VALUE - INICIALIZAÇÃO

```cobol
       01 CONTADOR PIC 999 VALUE ZERO.
       01 MENSAGEM PIC X(20) VALUE 'BEM-VINDO'.
       01 PI PIC 9V9999 VALUE 3.1416.
       01 ATIVO PIC X VALUE 'S'.
```

| Palavra especial | Equivale a |
|------------------|------------|
| **ZERO** ou **ZEROS** ou **ZEROES** | 0 |
| **SPACE** ou **SPACES** | ' ' (espaços) |
| **QUOTE** ou **QUOTES** | " |
| **HIGH-VALUE** | Maior valor possível |
| **LOW-VALUE** | Menor valor possível |

---

## 🔧 COMANDOS - PROCEDURE DIVISION

### 📺 **DISPLAY** = IMPRIMIR NA TELA

```cobol
       DISPLAY 'TEXTO FIXO'.
       DISPLAY VARIAVEL.
       DISPLAY 'NOME: ' VARIAVEL.
       DISPLAY 'A:  ' A ' B: ' B. 
```

| Parte | O que faz |
|-------|-----------|
| **DISPLAY** | Comando para exibir |
| **'TEXTO'** | Texto literal (aspas simples) |
| **VARIAVEL** | Mostra conteúdo da variável |
| **UPON CONSOLE** | (Opcional) Especifica saída |

**Opções avançadas:**
```cobol
       DISPLAY 'NOME: ' WITH NO ADVANCING.  → Não pula linha
       ACCEPT NOME.                         → Continua na mesma linha
```

---

### ⌨️ **ACCEPT** = LER DA ENTRADA

```cobol
       ACCEPT NOME.
       ACCEPT IDADE.
       ACCEPT DATA FROM DATE YYYYMMDD.
       ACCEPT HORA FROM TIME. 
```

| Parte | O que faz |
|-------|-----------|
| **ACCEPT** | Comando para ler |
| **VARIAVEL** | Onde armazenar o valor |
| **FROM DATE** | Pega data do sistema |
| **FROM TIME** | Pega hora do sistema |

---

### 📦 **MOVE** = COPIAR DADOS

```cobol
       MOVE 100 TO IDADE.
       MOVE 'JOAO' TO NOME.
       MOVE ORIGEM TO DESTINO.
       MOVE ZERO TO CONTADOR.
       MOVE SPACES TO MENSAGEM.
```

**Sintaxe:** `MOVE <origem> TO <destino>`

| Palavra | Significado |
|---------|-------------|
| **MOVE** | Comando de cópia |
| **TO** | "Para" (destino) |

**⚠️ IMPORTANT:** MOVE **COPIA**, não move! 

```cobol
       01 A PIC 999 VALUE 100.
       01 B PIC 999.
       
       MOVE A TO B.
       *> Agora:  A=100, B=100 (A continua com 100!)
```

---

### ➕ **ADD** = SOMAR

#### **Formato 1: ADD ...  TO**
```cobol
       ADD 10 TO IDADE.              → IDADE = IDADE + 10
       ADD A TO B.                   → B = B + A
```

**Sintaxe:** `ADD <valor> TO <variável>`
- **Modifica** a variável após TO

#### **Formato 2: ADD ... GIVING**
```cobol
       ADD A B GIVING C.             → C = A + B
       ADD 10 20 30 GIVING SOMA.     → SOMA = 60
```

**Sintaxe:** `ADD <valores... > GIVING <resultado>`
- **NÃO modifica** A nem B
- Resultado vai para C

---

### ➖ **SUBTRACT** = SUBTRAIR

```cobol
       SUBTRACT 5 FROM IDADE.        → IDADE = IDADE - 5
       SUBTRACT A FROM B GIVING C.   → C = B - A
```

**⚠️ ATENÇÃO À ORDEM:** `SUBTRACT A FROM B` = B - A (não A - B!)

---

### ✖️ **MULTIPLY** = MULTIPLICAR

```cobol
       MULTIPLY 2 BY PRECO.          → PRECO = PRECO * 2
       MULTIPLY A BY B GIVING C.     → C = A * B
```

---

### ➗ **DIVIDE** = DIVIDIR

```cobol
       DIVIDE IDADE BY 2.                    → IDADE = IDADE / 2
       DIVIDE A BY B GIVING C.               → C = A / B
       DIVIDE 10 BY 3 GIVING Q REMAINDER R.   → Q=3, R=1
```

| Cláusula | O que faz |
|----------|-----------|
| **GIVING** | Recebe o quociente |
| **REMAINDER** | Recebe o resto |

---

### 🧮 **COMPUTE** = EXPRESSÃO MATEMÁTICA

```cobol
       COMPUTE RESULTADO = (A + B) * C.
       COMPUTE AREA = 3.14 * RAIO ** 2.
       COMPUTE MEDIA = (N1 + N2 + N3) / 3.
```

| Operador | Significado |
|----------|-------------|
| **`+`** | Adição |
| **`-`** | Subtração |
| **`*`** | Multiplicação |
| **`/`** | Divisão |
| **`**`** | Potência |

**Ordem de precedência:**
1. `**` (potência)
2. `*` `/` (multiplicação/divisão)
3. `+` `-` (adição/subtração)
4. Use `()` para mudar a ordem! 

---

### 🔀 **IF** = CONDIÇÃO

```cobol
       IF IDADE >= 18
           DISPLAY 'MAIOR'
       ELSE
           DISPLAY 'MENOR'
       END-IF.
```

| Parte | Significado |
|-------|-------------|
| **IF** | "Se" (condição) |
| **THEN** | (Opcional) "Então" |
| **ELSE** | "Senão" |
| **END-IF** | **OBRIGATÓRIO** marca fim do IF |

**Operadores de comparação:**

```cobol
       IF A = B          → Igual
       IF A > B          → Maior que
       IF A < B          → Menor que
       IF A >= B         → Maior ou igual
       IF A <= B         → Menor ou igual
       IF A NOT = B      → Diferente
```

**Operadores lógicos:**

```cobol
       IF A > 10 AND B < 20          → E (ambos verdadeiros)
       IF A = 5 OR B = 5             → OU (pelo menos um verdadeiro)
       IF NOT (A = B)                → NÃO (inverte)
```

---

### 🎯 **EVALUATE** = SWITCH/CASE

```cobol
       EVALUATE OPCAO
           WHEN 1
               DISPLAY 'UM'
           WHEN 2
               DISPLAY 'DOIS'
           WHEN OTHER
               DISPLAY 'OUTRO'
       END-EVALUATE.
```

| Palavra | Significado |
|---------|-------------|
| **EVALUATE** | "Avaliar" |
| **WHEN** | "Quando" (caso) |
| **OTHER** | "Outros" (default) |
| **END-EVALUATE** | Fim do bloco |

**Recursos avançados:**

```cobol
       EVALUATE NOTA
           WHEN 90 THRU 100          → Range (90 a 100)
               DISPLAY 'A'
           WHEN 80 THRU 89
               DISPLAY 'B'
       END-EVALUATE.
       
       EVALUATE TRUE                  → Múltiplas condições
           WHEN IDADE < 18
               DISPLAY 'CRIANCA'
           WHEN IDADE < 60
               DISPLAY 'ADULTO'
       END-EVALUATE.
```

---

### 🔁 **PERFORM** = LOOP/CHAMAR PARÁGRAFO

#### **1. PERFORM SIMPLES (chamar função)**
```cobol
       PERFORM CALCULAR-TOTAL. 
       STOP RUN.
       
       CALCULAR-TOTAL.
           ADD A B GIVING TOTAL.
```

#### **2. PERFORM TIMES (repetir N vezes)**
```cobol
       PERFORM 10 TIMES
           DISPLAY 'OLA'
       END-PERFORM. 
```

#### **3. PERFORM UNTIL (while)**
```cobol
       PERFORM UNTIL CONTADOR > 10
           DISPLAY CONTADOR
           ADD 1 TO CONTADOR
       END-PERFORM.
```

#### **4. PERFORM VARYING (for)**
```cobol
       PERFORM VARYING I FROM 1 BY 1 UNTIL I > 10
           DISPLAY I
       END-PERFORM.
```

| Palavra | Significado |
|---------|-------------|
| **PERFORM** | Executar |
| **TIMES** | Vezes |
| **UNTIL** | Até que |
| **VARYING** | Variando |
| **FROM** | Desde |
| **BY** | De (passo) |

---

### 🧹 **INITIALIZE** = LIMPAR VARIÁVEL

```cobol
       INITIALIZE CLIENTE.
```

**O que faz:**
- Números → `0`
- Textos → `SPACES`

```cobol
       01 PESSOA. 
           05 NOME PIC X(30) VALUE 'JOAO'.
           05 IDADE PIC 99 VALUE 25.
       
       INITIALIZE PESSOA. 
       *> Agora: NOME = '    ', IDADE = 0
```

---

### 🛑 **STOP RUN** = ENCERRAR PROGRAMA

```cobol
       STOP RUN.
```

**SEMPRE** coloque no final do programa!

---

## 🏗️ NÍVEIS ESPECIAIS

### **NÍVEL 77 = VARIÁVEL INDEPENDENTE**

```cobol
       77 CONTADOR PIC 999 VALUE ZERO.
       77 FLAG PIC X VALUE 'N'.
```

**Não pode ter subitens!**

---

### **NÍVEL 88 = CONDIÇÃO**

```cobol
       01 STATUS PIC 9.
           88 ATIVO VALUE 1.
           88 INATIVO VALUE 0.
       
       PROCEDURE DIVISION.
           MOVE 1 TO STATUS.
           
           IF ATIVO
               DISPLAY 'ESTA ATIVO'
           END-IF.
```

| Parte | Significado |
|-------|-------------|
| **88** | Nível de condição |
| **VALUE** | Valor que torna verdadeiro |

**É um "apelido" para comparação! **

```cobol
       IF ATIVO             → Igual a:  IF STATUS = 1
```

---

## 📊 RESUMO - TABELA DE SÍMBOLOS

| Símbolo | Nome | Uso |
|---------|------|-----|
| `.` | Ponto | Termina comandos |
| `*>` | Comentário | Ignora linha |
| `-` | Hífen | Separa palavras em nomes |
| `'texto'` | Aspas simples | Texto literal |
| `()` | Parênteses | Agrupamento/Repetição |
| `PIC` | Picture | Define formato |
| `01-49` | Níveis | Hierarquia de dados |
| `77` | Nível especial | Variável independente |
| `88` | Nível especial | Condição |

---

## 🎓 EXEMPLO COMPLETO COMENTADO

```cobol
      *> ===== CABEÇALHO =====
       IDENTIFICATION DIVISION.              ← Divisão 1:  Identificação
       PROGRAM-ID. EXEMPLO-COMPLETO.         ← Nome do programa
       AUTHOR.  RODRIGO.                       ← Autor (opcional)
       DATE-WRITTEN. 2026-01-07.             ← Data (opcional)
       
      *> ===== CONFIGURAÇÃO =====
       ENVIRONMENT DIVISION.                 ← Divisão 2: Ambiente
       
      *> ===== DECLARAÇÃO DE VARIÁVEIS =====
       DATA DIVISION.                        ← Divisão 3: Dados
       WORKING-STORAGE SECTION.              ← Área de memória
       
      *> Variáveis simples (nível 77)
       77 CONTADOR PIC 999 VALUE ZERO.       ← Inteiro de 0 a 999
       77 MENSAGEM PIC X(50).                ← Texto de 50 caracteres
       
      *> Estrutura hierárquica (nível 01)
       01 CLIENTE.                           ← Grupo principal
           05 NOME PIC X(40).                ← Subitem:  Nome
           05 IDADE PIC 99.                  ← Subitem: Idade (0-99)
           05 SALARIO PIC 9(5)V99.           ← Subitem: Salário (99999.99)
           05 STATUS-ATIVO PIC 9.            ← Subitem: Status (0-9)
               88 ATIVO VALUE 1.             ← Condição: se STATUS=1
               88 INATIVO VALUE 0.           ← Condição: se STATUS=0
       
      *> ===== LÓGICA DO PROGRAMA =====
       PROCEDURE DIVISION.                   ← Divisão 4: Procedimentos
       
      *> Parágrafo principal
       INICIO.                               ← Nome do parágrafo
           DISPLAY '=== SISTEMA ==='.        ← Exibe texto
           
           MOVE 'JOAO SILVA' TO NOME.        ← Atribui valor
           MOVE 30 TO IDADE.                 ← Atribui número
           MOVE 5000.50 TO SALARIO.          ← Atribui decimal
           MOVE 1 TO STATUS-ATIVO.           ← Ativa cliente
           
           PERFORM EXIBIR-DADOS.             ← Chama parágrafo
           PERFORM CALCULAR-BONUS.           ← Chama outro parágrafo
           
           STOP RUN.                         ← Encerra programa
       
      *> Parágrafo secundário
       EXIBIR-DADOS. 
           DISPLAY 'NOME: ' NOME.
           DISPLAY 'IDADE: ' IDADE.
           DISPLAY 'SALARIO: ' SALARIO.
           
           IF ATIVO                          ← Usa condição 88
               DISPLAY 'STATUS:  ATIVO'
           ELSE
               DISPLAY 'STATUS: INATIVO'
           END-IF.                           ← Fecha IF
       
      *> Outro parágrafo
       CALCULAR-BONUS.
           IF SALARIO > 3000                 ← Se salário > 3000
               COMPUTE SALARIO = SALARIO * 1.10  ← +10%
               DISPLAY 'BONUS APLICADO!'
           END-IF.
```

---
# 🚀 COBOL AVANÇADO - GUIA COMPLETO

Vou te ensinar **TUDO** sobre esses 5 tópicos avançados!  Prepare-se!  💪

---

# 1️⃣ ARQUIVOS (FILE HANDLING)

## 📂 CONCEITOS BÁSICOS

COBOL trabalha com **3 tipos de arquivos:**

| Tipo | Descrição | Uso |
|------|-----------|-----|
| **SEQUENTIAL** | Leitura linha por linha (do início ao fim) | Logs, relatórios |
| **INDEXED** | Acesso direto por chave (como banco de dados) | Cadastros |
| **RELATIVE** | Acesso por número de registro | Raro hoje |

---

## 📝 ESTRUTURA COMPLETA DE ARQUIVO SEQUENCIAL

```cobol
       IDENTIFICATION DIVISION.
       PROGRAM-ID. ARQUIVO-SEQUENCIAL.
       
      *> ===== CONFIGURAÇÃO DO ARQUIVO =====
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT ARQUIVO-CLIENTES            ← Nome lógico
               ASSIGN TO 'clientes.txt'       ← Nome físico (arquivo real)
               ORGANIZATION IS SEQUENTIAL     ← Tipo:  Sequencial
               ACCESS MODE IS SEQUENTIAL      ← Modo de acesso
               FILE STATUS IS WS-FILE-STATUS.  ← Variável de status
       
      *> ===== DECLARAÇÃO DE VARIÁVEIS =====
       DATA DIVISION.
       
      *> Estrutura do arquivo
       FILE SECTION.
       FD ARQUIVO-CLIENTES.                    ← File Description
       01 REGISTRO-CLIENTE. 
           05 CLI-ID       PIC 9(5).
           05 CLI-NOME     PIC X(40).
           05 CLI-IDADE    PIC 99.
           05 CLI-CIDADE   PIC X(30).
       
      *> Variáveis de trabalho
       WORKING-STORAGE SECTION. 
       01 WS-FILE-STATUS   PIC XX.
           88 WS-OK        VALUE '00'.        ← Sucesso
           88 WS-EOF       VALUE '10'.        ← Fim do arquivo
           88 WS-ERRO      VALUE '30' THRU '99'. ← Erro
       
       01 WS-CONTADOR      PIC 9(5) VALUE ZERO.
       
      *> ===== LÓGICA =====
       PROCEDURE DIVISION. 
       
       INICIO.
           PERFORM CRIAR-ARQUIVO.
           PERFORM LER-ARQUIVO.
           STOP RUN.
       
      *> ========== CRIAR E ESCREVER ==========
       CRIAR-ARQUIVO.
           OPEN OUTPUT ARQUIVO-CLIENTES.       ← Abre para ESCRITA
           
           IF NOT WS-OK
               DISPLAY 'ERRO AO ABRIR:  ' WS-FILE-STATUS
               STOP RUN
           END-IF. 
           
           DISPLAY 'ARQUIVO ABERTO PARA ESCRITA'.
           
      *> Escrever registro 1
           MOVE 00001 TO CLI-ID.
           MOVE 'JOAO SILVA' TO CLI-NOME.
           MOVE 30 TO CLI-IDADE. 
           MOVE 'SAO PAULO' TO CLI-CIDADE. 
           WRITE REGISTRO-CLIENTE.
           
      *> Escrever registro 2
           MOVE 00002 TO CLI-ID.
           MOVE 'MARIA SANTOS' TO CLI-NOME. 
           MOVE 25 TO CLI-IDADE.
           MOVE 'RIO DE JANEIRO' TO CLI-CIDADE.
           WRITE REGISTRO-CLIENTE.
           
      *> Escrever registro 3
           MOVE 00003 TO CLI-ID.
           MOVE 'PEDRO OLIVEIRA' TO CLI-NOME.
           MOVE 40 TO CLI-IDADE. 
           MOVE 'BELO HORIZONTE' TO CLI-CIDADE.
           WRITE REGISTRO-CLIENTE.
           
           CLOSE ARQUIVO-CLIENTES.            ← SEMPRE feche!
           DISPLAY 'ARQUIVO CRIADO COM SUCESSO!  '. 
       
      *> ========== LER ARQUIVO ==========
       LER-ARQUIVO.
           OPEN INPUT ARQUIVO-CLIENTES.       ← Abre para LEITURA
           
           IF NOT WS-OK
               DISPLAY 'ERRO AO ABRIR: ' WS-FILE-STATUS
               STOP RUN
           END-IF.
           
           DISPLAY '===== LENDO CLIENTES ====='.
           
           PERFORM UNTIL WS-EOF
               READ ARQUIVO-CLIENTES
                   AT END
                       CONTINUE               ← Fim do arquivo
                   NOT AT END
                       ADD 1 TO WS-CONTADOR
                       DISPLAY 'CLIENTE #' WS-CONTADOR
                       DISPLAY '  ID: ' CLI-ID
                       DISPLAY '  NOME: ' CLI-NOME
                       DISPLAY '  IDADE: ' CLI-IDADE
                       DISPLAY '  CIDADE: ' CLI-CIDADE
                       DISPLAY '--------------------'
               END-READ
           END-PERFORM.
           
           CLOSE ARQUIVO-CLIENTES.
           DISPLAY 'TOTAL DE CLIENTES: ' WS-CONTADOR.
```

---

## 🔑 EXPLICAÇÃO PALAVRA POR PALAVRA

### **SELECT - Declarar Arquivo**

```cobol
       SELECT ARQUIVO-CLIENTES
           ASSIGN TO 'clientes.txt'
           ORGANIZATION IS SEQUENTIAL
           ACCESS MODE IS SEQUENTIAL
           FILE STATUS IS WS-FILE-STATUS.
```

| Cláusula | O que faz |
|----------|-----------|
| **SELECT** | Declara nome lógico do arquivo |
| **ASSIGN TO** | Liga ao arquivo físico (disco) |
| **ORGANIZATION** | Tipo:  SEQUENTIAL, INDEXED, RELATIVE |
| **ACCESS MODE** | Como acessar:  SEQUENTIAL, RANDOM, DYNAMIC |
| **FILE STATUS** | Variável que recebe código de erro |

---

### **FD - File Description**

```cobol
       FILE SECTION.
       FD ARQUIVO-CLIENTES.
       01 REGISTRO-CLIENTE. 
           05 CLI-ID PIC 9(5).
```

| Palavra | Significado |
|---------|-------------|
| **FD** | File Description (descreve estrutura) |
| **01** | Registro do arquivo (layout) |

---

### **OPEN - Abrir Arquivo**

```cobol
       OPEN INPUT ARQUIVO-CLIENTES.    ← Leitura
       OPEN OUTPUT ARQUIVO-CLIENTES.   ← Escrita (cria novo)
       OPEN I-O ARQUIVO-CLIENTES.      ← Leitura E escrita
       OPEN EXTEND ARQUIVO-CLIENTES.   ← Adicionar ao final
```

| Modo | O que faz |
|------|-----------|
| **INPUT** | Somente leitura |
| **OUTPUT** | Somente escrita (apaga arquivo existente!) |
| **I-O** | Leitura e escrita (arquivos indexed) |
| **EXTEND** | Adiciona registros ao final |

---

### **WRITE - Escrever Registro**

```cobol
       WRITE REGISTRO-CLIENTE.
       
       WRITE REGISTRO-CLIENTE
           INVALID KEY
               DISPLAY 'CHAVE DUPLICADA'
       END-WRITE.
```

**⚠️ ATENÇÃO:** Use `WRITE` para **criar** registros. 

---

### **READ - Ler Registro**

```cobol
       READ ARQUIVO-CLIENTES
           AT END
               DISPLAY 'FIM DO ARQUIVO'
           NOT AT END
               DISPLAY CLI-NOME
       END-READ.
```

| Cláusula | Quando ocorre |
|----------|---------------|
| **AT END** | Chegou ao fim do arquivo |
| **NOT AT END** | Leu com sucesso |

---

### **CLOSE - Fechar Arquivo**

```cobol
       CLOSE ARQUIVO-CLIENTES. 
```

**🚨 CRÍTICO:** SEMPRE feche arquivos ou **perde dados**!

---

### **FILE STATUS - Códigos de Erro**

```cobol
       01 WS-FILE-STATUS PIC XX.
```

| Código | Significado |
|--------|-------------|
| **00** | Sucesso |
| **10** | Fim do arquivo (EOF) |
| **21** | Chave duplicada |
| **23** | Registro não encontrado |
| **30** | Erro permanente (arquivo não existe) |
| **34** | Espaço em disco insuficiente |
| **35** | Arquivo não encontrado |

---

## 🗂️ ARQUIVO INDEXED (Acesso Direto)

```cobol
       IDENTIFICATION DIVISION.
       PROGRAM-ID. ARQUIVO-INDEXED. 
       
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT PRODUTOS
               ASSIGN TO 'produtos. dat'
               ORGANIZATION IS INDEXED        ← Tipo: Indexado
               ACCESS MODE IS DYNAMIC         ← Sequencial OU direto
               RECORD KEY IS PROD-ID          ← Chave primária
               ALTERNATE RECORD KEY IS PROD-NOME  ← Chave alternativa
                   WITH DUPLICATES
               FILE STATUS IS WS-STATUS.
       
       DATA DIVISION.
       FILE SECTION. 
       FD PRODUTOS.
       01 REGISTRO-PRODUTO.
           05 PROD-ID      PIC 9(5).          ← CHAVE PRIMÁRIA
           05 PROD-NOME    PIC X(30).         ← CHAVE ALTERNATIVA
           05 PROD-PRECO   PIC 9(5)V99.
           05 PROD-ESTOQUE PIC 9(5).
       
       WORKING-STORAGE SECTION. 
       01 WS-STATUS        PIC XX.
       01 WS-ID-BUSCA      PIC 9(5).
       
       PROCEDURE DIVISION.
       
       INICIO.
           PERFORM CRIAR-PRODUTOS.
           PERFORM BUSCAR-POR-ID.
           PERFORM ATUALIZAR-ESTOQUE. 
           PERFORM DELETAR-PRODUTO.
           STOP RUN. 
       
      *> ========== CRIAR REGISTROS ==========
       CRIAR-PRODUTOS.
           OPEN OUTPUT PRODUTOS.
           
           MOVE 00001 TO PROD-ID. 
           MOVE 'NOTEBOOK' TO PROD-NOME. 
           MOVE 2500. 00 TO PROD-PRECO.
           MOVE 10 TO PROD-ESTOQUE.
           WRITE REGISTRO-PRODUTO
               INVALID KEY
                   DISPLAY 'ERRO:  CHAVE DUPLICADA'
           END-WRITE.
           
           MOVE 00002 TO PROD-ID.
           MOVE 'MOUSE' TO PROD-NOME.
           MOVE 50. 00 TO PROD-PRECO.
           MOVE 100 TO PROD-ESTOQUE.
           WRITE REGISTRO-PRODUTO. 
           
           CLOSE PRODUTOS.
           DISPLAY 'PRODUTOS CRIADOS!  '.
       
      *> ========== BUSCAR POR CHAVE ==========
       BUSCAR-POR-ID. 
           OPEN I-O PRODUTOS.                 ← I-O para ler e escrever
           
           MOVE 00001 TO PROD-ID.
           READ PRODUTOS
               KEY IS PROD-ID                 ← Busca direta por ID
               INVALID KEY
                   DISPLAY 'PRODUTO NAO ENCONTRADO'
               NOT INVALID KEY
                   DISPLAY 'ENCONTRADO: ' PROD-NOME
                   DISPLAY 'PRECO: ' PROD-PRECO
           END-READ.
           
           CLOSE PRODUTOS.
       
      *> ========== ATUALIZAR REGISTRO ==========
       ATUALIZAR-ESTOQUE.
           OPEN I-O PRODUTOS.
           
           MOVE 00001 TO PROD-ID.
           READ PRODUTOS
               KEY IS PROD-ID
               NOT INVALID KEY
                   ADD 5 TO PROD-ESTOQUE
                   REWRITE REGISTRO-PRODUTO    ← REWRITE atualiza! 
                       INVALID KEY
                           DISPLAY 'ERRO AO ATUALIZAR'
                   END-REWRITE
                   DISPLAY 'ESTOQUE ATUALIZADO:  ' PROD-ESTOQUE
           END-READ.
           
           CLOSE PRODUTOS.
       
      *> ========== DELETAR REGISTRO ==========
       DELETAR-PRODUTO.
           OPEN I-O PRODUTOS.
           
           MOVE 00002 TO PROD-ID. 
           DELETE PRODUTOS
               INVALID KEY
                   DISPLAY 'ERRO AO DELETAR'
               NOT INVALID KEY
                   DISPLAY 'PRODUTO DELETADO'
           END-DELETE.
           
           CLOSE PRODUTOS. 
```

---

## 🎯 RESUMO - OPERAÇÕES EM ARQUIVOS

| Operação | Sequencial | Indexed |
|----------|------------|---------|
| **Criar** | WRITE | WRITE |
| **Ler** | READ (sequencial) | READ KEY IS |
| **Atualizar** | ❌ (recria arquivo) | REWRITE |
| **Deletar** | ❌ | DELETE |

---

# 2️⃣ STRING MANIPULATION

## 🔤 COMANDOS DE MANIPULAÇÃO DE STRINGS

### **INSPECT - Contar/Substituir Caracteres**

```cobol
       IDENTIFICATION DIVISION.
       PROGRAM-ID.  INSPECT-DEMO.
       
       DATA DIVISION.
       WORKING-STORAGE SECTION. 
       01 TEXTO        PIC X(50) VALUE 'COBOL E MUITO BOM!  '.
       01 CONTADOR     PIC 99 VALUE ZERO.
       01 VOGAIS       PIC 99 VALUE ZERO.
       
       PROCEDURE DIVISION.
       
      *> ========== CONTAR CARACTERES ==========
       EXEMPLO-1.
           INSPECT TEXTO
               TALLYING CONTADOR FOR ALL 'O'. 
           
           DISPLAY 'LETRA O APARECE ' CONTADOR ' VEZES'.
           *> Resultado: 4 vezes
       
      *> ========== CONTAR MÚLTIPLOS CARACTERES ==========
       EXEMPLO-2.
           MOVE ZERO TO VOGAIS.
           
           INSPECT TEXTO
               TALLYING VOGAIS FOR ALL 'A'
               TALLYING VOGAIS FOR ALL 'E'
               TALLYING VOGAIS FOR ALL 'I'
               TALLYING VOGAIS FOR ALL 'O'
               TALLYING VOGAIS FOR ALL 'U'. 
           
           DISPLAY 'TOTAL DE VOGAIS: ' VOGAIS. 
       
      *> ========== SUBSTITUIR CARACTERES ==========
       EXEMPLO-3.
           MOVE 'COBOL E DIFICIL' TO TEXTO.
           
           INSPECT TEXTO
               REPLACING ALL 'DIFICIL' BY 'FACIL  '. 
           
           DISPLAY TEXTO.  *> COBOL E FACIL
       
      *> ========== SUBSTITUIR PRIMEIRO ==========
       EXEMPLO-4.
           MOVE 'BANANA NANICA' TO TEXTO.
           
           INSPECT TEXTO
               REPLACING FIRST 'NA' BY 'XX'. 
           
           DISPLAY TEXTO.  *> BAXANA NANICA (só o primeiro NA)
       
      *> ========== SUBSTITUIR ANTES/DEPOIS ==========
       EXEMPLO-5.
           MOVE 'ABC123DEF456' TO TEXTO.
           
           INSPECT TEXTO
               REPLACING ALL '1' BY 'X'
               BEFORE INITIAL 'D'.       ← Só antes de 'D'
           
           DISPLAY TEXTO.  *> ABCX23DEF456
       
      *> ========== CONVERTER MAIÚSCULAS ==========
       EXEMPLO-6.
           MOVE 'cobol' TO TEXTO.
           
           INSPECT TEXTO
               CONVERTING 'abcdefghijklmnopqrstuvwxyz'
               TO         'ABCDEFGHIJKLMNOPQRSTUVWXYZ'.
           
           DISPLAY TEXTO.  *> COBOL
       
           STOP RUN.
```

---

### **STRING - Concatenar Strings**

```cobol
       IDENTIFICATION DIVISION. 
       PROGRAM-ID. STRING-DEMO.
       
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 NOME         PIC X(20) VALUE 'RODRIGO'. 
       01 SOBRENOME    PIC X(20) VALUE 'SILVA'.
       01 IDADE        PIC 99 VALUE 25.
       01 RESULTADO    PIC X(100).
       01 PONTEIRO     PIC 99.
       
       PROCEDURE DIVISION.
       
      *> ========== CONCATENAÇÃO BÁSICA ==========
       EXEMPLO-1.
           STRING
               NOME DELIMITED BY SPACE    ← Até encontrar espaço
               ' '                        ← Adiciona espaço
               SOBRENOME DELIMITED BY SIZE ← Tudo (tamanho total)
               INTO RESULTADO
           END-STRING.
           
           DISPLAY RESULTADO.  *> RODRIGO SILVA
       
      *> ========== COM CONTADOR DE POSIÇÃO ==========
       EXEMPLO-2.
           STRING
               'NOME:  ' DELIMITED BY SIZE
               NOME DELIMITED BY SPACE
               ' - IDADE: ' DELIMITED BY SIZE
               IDADE DELIMITED BY SIZE
               INTO RESULTADO
               WITH POINTER PONTEIRO     ← Posição final
           END-STRING.
           
           DISPLAY RESULTADO. 
           DISPLAY 'TERMINOU NA POSICAO: ' PONTEIRO. 
       
      *> ========== TRATAMENTO DE OVERFLOW ==========
       EXEMPLO-3.
           MOVE SPACES TO RESULTADO.
           
           STRING
               'TEXTO MUITO LONGO QUE NAO CABE'
               DELIMITED BY SIZE
               INTO RESULTADO
               ON OVERFLOW
                   DISPLAY 'ERRO: TEXTO MUITO GRANDE!  '
               NOT ON OVERFLOW
                   DISPLAY RESULTADO
           END-STRING. 
       
           STOP RUN.
```

### **Sintaxe STRING:**

```cobol
       STRING
           <origem1> DELIMITED BY {SIZE | <delimitador>}
           <origem2> DELIMITED BY {SIZE | <delimitador>}
           INTO <destino>
           [WITH POINTER <contador>]
           [ON OVERFLOW <comandos>]
       END-STRING
```

---

### **UNSTRING - Dividir Strings**

```cobol
       IDENTIFICATION DIVISION. 
       PROGRAM-ID. UNSTRING-DEMO.
       
       DATA DIVISION.
       WORKING-STORAGE SECTION. 
       01 ENTRADA      PIC X(50) VALUE 'JOAO;SILVA;30;SAO PAULO'.
       01 NOME         PIC X(20).
       01 SOBRENOME    PIC X(20).
       01 IDADE        PIC 99.
       01 CIDADE       PIC X(30).
       01 CONTADOR     PIC 99.
       
       01 CSV-LINE     PIC X(100) VALUE 'PROD1,50. 00,10'. 
       01 PRODUTO      PIC X(20).
       01 PRECO        PIC 9(5)V99.
       01 ESTOQUE      PIC 999.
       
       PROCEDURE DIVISION.
       
      *> ========== DIVIDIR POR DELIMITADOR ==========
       EXEMPLO-1.
           UNSTRING ENTRADA
               DELIMITED BY ';'           ← Separador
               INTO NOME
                    SOBRENOME
                    IDADE
                    CIDADE
           END-UNSTRING.
           
           DISPLAY 'NOME: ' NOME. 
           DISPLAY 'SOBRENOME: ' SOBRENOME.
           DISPLAY 'IDADE: ' IDADE.
           DISPLAY 'CIDADE: ' CIDADE.
       
      *> ========== CONTAR CAMPOS ==========
       EXEMPLO-2.
           UNSTRING ENTRADA
               DELIMITED BY ';'
               INTO NOME
                    SOBRENOME
                    IDADE
                    CIDADE
               TALLYING IN CONTADOR      ← Conta quantos campos
           END-UNSTRING.
           
           DISPLAY 'TOTAL DE CAMPOS: ' CONTADOR. 
       
      *> ========== PROCESSAR CSV ==========
       EXEMPLO-3.
           UNSTRING CSV-LINE
               DELIMITED BY ','
               INTO PRODUTO
                    PRECO
                    ESTOQUE
           END-UNSTRING.
           
           DISPLAY 'PRODUTO: ' PRODUTO.
           DISPLAY 'PRECO: ' PRECO.
           DISPLAY 'ESTOQUE: ' ESTOQUE.
       
      *> ========== MÚLTIPLOS DELIMITADORES ==========
       EXEMPLO-4.
           MOVE 'NOME: JOAO|IDADE:30' TO ENTRADA.
           
           UNSTRING ENTRADA
               DELIMITED BY ': ' OR '|'   ← Aceita :  ou |
               INTO NOME
                    SOBRENOME
                    IDADE
                    CIDADE
           END-UNSTRING.
       
           STOP RUN.
```

---

## 📐 REFERENCE MODIFICATION (Substring)

```cobol
       IDENTIFICATION DIVISION.
       PROGRAM-ID. SUBSTRING-DEMO.
       
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 TEXTO        PIC X(20) VALUE 'COBOL2026'.
       01 PARTE        PIC X(10).
       
       PROCEDURE DIVISION.
       
      *> SINTAXE:  VARIAVEL(início: tamanho)
       
      *> Extrair 'COBOL'
           MOVE TEXTO(1:5) TO PARTE.
           DISPLAY PARTE.  *> COBOL
       
      *> Extrair '2026'
           MOVE TEXTO(6:4) TO PARTE.
           DISPLAY PARTE.  *> 2026
       
      *> Substituir caracteres
           MOVE 'XXX' TO TEXTO(1:3).
           DISPLAY TEXTO.   *> XXXOL2026
       
      *> Pegar último caractere
           MOVE TEXTO(20: 1) TO PARTE.
           
           STOP RUN.
```

---

# 3️⃣ FUNÇÕES INTRÍNSECAS

COBOL tem **100+ funções built-in**! Vou mostrar as mais úteis:

```cobol
       IDENTIFICATION DIVISION.
       PROGRAM-ID.  FUNCOES-INTRINSECAS.
       
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 TEXTO        PIC X(50) VALUE 'Cobol 2026'.
       01 NUMERO       PIC 9(5)V99 VALUE 12345.67.
       01 RESULTADO    PIC X(50).
       01 NUM-RESULT   PIC 9(10)V99.
       
       PROCEDURE DIVISION.
       
      *> ========== FUNÇÕES DE STRING ==========
       
      *> UPPER-CASE - Maiúsculas
           MOVE FUNCTION UPPER-CASE(TEXTO) TO RESULTADO.
           DISPLAY RESULTADO.  *> COBOL 2026
       
      *> LOWER-CASE - Minúsculas
           MOVE FUNCTION LOWER-CASE(TEXTO) TO RESULTADO.
           DISPLAY RESULTADO.  *> cobol 2026
       
      *> REVERSE - Inverter
           MOVE FUNCTION REVERSE(TEXTO) TO RESULTADO.
           DISPLAY RESULTADO.   *> 6202 loboC
       
      *> LENGTH - Tamanho
           DISPLAY FUNCTION LENGTH(TEXTO).  *> 50
       
      *> TRIM - Remover espaços
           MOVE '   TESTE   ' TO TEXTO.
           MOVE FUNCTION TRIM(TEXTO) TO RESULTADO.
           DISPLAY '[' RESULTADO ']'.   *> [TESTE]
       
      *> TRIM específico
           MOVE FUNCTION TRIM(TEXTO, LEADING) TO RESULTADO.  *> Remove à esquerda
           MOVE FUNCTION TRIM(TEXTO, TRAILING) TO RESULTADO. *> Remove à direita
       
      *> ========== FUNÇÕES MATEMÁTICAS ==========
       
      *> MAX - Máximo
           COMPUTE NUM-RESULT = FUNCTION MAX(10, 50, 30, 25).
           DISPLAY NUM-RESULT.  *> 50
       
      *> MIN - Mínimo
           COMPUTE NUM-RESULT = FUNCTION MIN(10, 50, 30, 25).
           DISPLAY NUM-RESULT.  *> 10
       
      *> SUM - Soma
           COMPUTE NUM-RESULT = FUNCTION SUM(10, 20, 30).
           DISPLAY NUM-RESULT.  *> 60
       
      *> MEAN - Média
           COMPUTE NUM-RESULT = FUNCTION MEAN(10, 20, 30).
           DISPLAY NUM-RESULT.  *> 20
       
      *> MEDIAN - Mediana
           COMPUTE NUM-RESULT = FUNCTION MEDIAN(10, 20, 30, 40, 50).
           DISPLAY NUM-RESULT.  *> 30
       
      *> ABS - Valor absoluto
           COMPUTE NUM-RESULT = FUNCTION ABS(-25).
           DISPLAY NUM-RESULT.  *> 25
       
      *> SQRT - Raiz quadrada
           COMPUTE NUM-RESULT = FUNCTION SQRT(16).
           DISPLAY NUM-RESULT.  *> 4
       
      *> MOD - Resto da divisão
           COMPUTE NUM-RESULT = FUNCTION MOD(17, 5).
           DISPLAY NUM-RESULT.  *> 2
       
      *> INTEGER - Parte inteira
           COMPUTE NUM-RESULT = FUNCTION INTEGER(12345.67).
           DISPLAY NUM-RESULT.  *> 12345
       
      *> REM - Resto
           COMPUTE NUM-RESULT = FUNCTION REM(17, 5).
           DISPLAY NUM-RESULT.  *> 2
       
      *> ========== FUNÇÕES TRIGONOMÉTRICAS ==========
       
      *> SIN, COS, TAN
           COMPUTE NUM-RESULT = FUNCTION SIN(1.5708).  *> ~1 (90°)
           COMPUTE NUM-RESULT = FUNCTION COS(0).       *> 1
           COMPUTE NUM-RESULT = FUNCTION TAN(0.7854).  *> ~1 (45°)
       
      *> ASIN, ACOS, ATAN - Inversas
           COMPUTE NUM-RESULT = FUNCTION ASIN(1).
       
      *> LOG, LOG10, EXP
           COMPUTE NUM-RESULT = FUNCTION LOG(2. 71828).    *> ~1
           COMPUTE NUM-RESULT = FUNCTION LOG10(100).      *> 2
           COMPUTE NUM-RESULT = FUNCTION EXP(1).          *> ~2. 718
       
      *> ========== FUNÇÕES DE DATA/HORA ==========
       
      *> CURRENT-DATE - Data/hora atual (21 caracteres)
           MOVE FUNCTION CURRENT-DATE TO RESULTADO.
           DISPLAY RESULTADO.  *> 20260107120000000-0300
           
      *> Formato:  YYYYMMDDHHMMSSSS±HHMM
      *>          2026 01 07 12 00 00 000 -03 00
       
      *> INTEGER-OF-DATE - Converter para número
           COMPUTE NUM-RESULT = FUNCTION INTEGER-OF-DATE(20260107).
           DISPLAY NUM-RESULT.  *> Dias desde 31/12/1600
       
      *> DATE-OF-INTEGER - Converter de número
           COMPUTE NUM-RESULT = FUNCTION DATE-OF-INTEGER(155000).
       
      *> ========== FUNÇÕES DE CONVERSÃO ==========
       
      *> NUMVAL - String para número
           MOVE '1234.56' TO TEXTO.
           COMPUTE NUM-RESULT = FUNCTION NUMVAL(TEXTO).
           DISPLAY NUM-RESULT.  *> 1234.56
       
      *> NUMVAL-C - Com símbolos de moeda
           MOVE '$1,234.56' TO TEXTO.
           COMPUTE NUM-RESULT = FUNCTION NUMVAL-C(TEXTO).
           DISPLAY NUM-RESULT.  *> 1234.56
       
      *> ========== FUNÇÕES ESTATÍSTICAS ==========
       
      *> RANGE - Amplitude
           COMPUTE NUM-RESULT = FUNCTION RANGE(10, 50, 30).
           DISPLAY NUM-RESULT.  *> 40 (50-10)
       
      *> VARIANCE - Variância
           COMPUTE NUM-RESULT = FUNCTION VARIANCE(10, 20, 30).
       
      *> STANDARD-DEVIATION - Desvio padrão
           COMPUTE NUM-RESULT = FUNCTION STANDARD-DEVIATION(10, 20, 30).
       
      *> ========== OUTRAS FUNÇÕES ÚTEIS ==========
       
      *> RANDOM - Número aleatório (0 a 1)
           COMPUTE NUM-RESULT = FUNCTION RANDOM. 
           DISPLAY NUM-RESULT. 
       
      *> RANDOM com seed
           COMPUTE NUM-RESULT = FUNCTION RANDOM(12345).
       
      *> ORD - Código ASCII
           DISPLAY FUNCTION ORD('A').  *> 65
       
      *> CHAR - Caractere do código
           DISPLAY FUNCTION CHAR(65).  *> A
       
      *> WHEN-COMPILED - Data/hora da compilação
           DISPLAY FUNCTION WHEN-COMPILED.
       
           STOP RUN.
```

---

## 📊 TABELA DE FUNÇÕES MAIS USADAS

| Categoria | Função | O que faz |
|-----------|--------|-----------|
| **String** | UPPER-CASE | Maiúsculas |
| | LOWER-CASE | Minúsculas |
| | TRIM | Remove espaços |
| | LENGTH | Tamanho |
| | REVERSE | Inverte |
| **Matemática** | MAX | Máximo |
| | MIN | Mínimo |
| | SUM | Soma |
| | MEAN | Média |
| | ABS | Valor absoluto |
| | SQRT | Raiz quadrada |
| | MOD | Resto |
| **Data/Hora** | CURRENT-DATE | Data/hora atual |
| | INTEGER-OF-DATE | Data → número |
| | DATE-OF-INTEGER | Número → data |
| **Conversão** | NUMVAL | String → número |
| | NUMVAL-C | String formatada → número |

---

# 4️⃣ SUBPROGRAMAS (CALL/LINKAGE)

## 📞 CHAMANDO OUTROS PROGRAMAS

```cobol
      *> ========== PROGRAMA PRINCIPAL ==========
       IDENTIFICATION DIVISION.
       PROGRAM-ID. PROGRAMA-PRINCIPAL.
       
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-NUMERO1   PIC 99 VALUE 10.
       01 WS-NUMERO2   PIC 99 VALUE 20.
       01 WS-RESULTADO PIC 999. 
       
       PROCEDURE DIVISION.
       
           DISPLAY '===== PROGRAMA PRINCIPAL ====='.
           
      *> Chamar subprograma passando parâmetros
           CALL 'SUBPROG-SOMA'
               USING WS-NUMERO1        ← Parâmetro 1
                     WS-NUMERO2        ← Parâmetro 2
                     WS-RESULTADO.      ← Parâmetro 3 (retorno)
           
           DISPLAY 'RESULTADO DA SOMA: ' WS-RESULTADO.
           
      *> Chamar com tratamento de erro
           CALL 'SUBPROG-VALIDAR'
               USING WS-NUMERO1
               ON EXCEPTION
                   DISPLAY 'ERRO: PROGRAMA NAO ENCONTRADO'
               NOT ON EXCEPTION
                   DISPLAY 'CHAMADA COM SUCESSO'
           END-CALL.
           
           STOP RUN.
```

```cobol
      *> ========== SUBPROGRAMA ==========
       IDENTIFICATION DIVISION. 
       PROGRAM-ID.  SUBPROG-SOMA. 
       
       DATA DIVISION. 
       LINKAGE SECTION.               ← Parâmetros recebidos
       01 LS-NUM1      PIC 99.
       01 LS-NUM2      PIC 99.
       01 LS-RESULTADO PIC 999.
       
       PROCEDURE DIVISION USING LS-NUM1 LS-NUM2 LS-RESULTADO.
       
           DISPLAY '===== SUBPROGRAMA SOMA ====='.
           ADD LS-NUM1 LS-NUM2 GIVING LS-RESULTADO. 
           DISPLAY 'SOMA INTERNA: ' LS-RESULTADO.
           
           EXIT PROGRAM.               ← Retorna ao chamador
           *> ou GOBACK
```

---

## 🔄 MODOS DE PASSAGEM DE PARÂMETROS

```cobol
      *> ========== BY REFERENCE (padrão) ==========
      *> Passa o ENDEREÇO da variável (modifica o original)
       
       CALL 'SUBPROG'
           USING BY REFERENCE WS-NUMERO. 
       
      *> ========== BY CONTENT ==========
      *> Passa uma CÓPIA (não modifica o original)
       
       CALL 'SUBPROG'
           USING BY CONTENT WS-NUMERO. 
       
      *> ========== BY VALUE ==========
      *> Passa o VALOR diretamente (compatibilidade C)
       
       CALL 'SUBPROG'
           USING BY VALUE WS-NUMERO.
```

---

## 🧩 EXEMPLO COMPLETO - SISTEMA MODULAR

```cobol
      *> ========== PROGRAMA PRINCIPAL ==========
       IDENTIFICATION DIVISION.
       PROGRAM-ID. SISTEMA-VENDAS.
       
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-CLIENTE. 
           05 WS-ID        PIC 9(5).
           05 WS-NOME      PIC X(40).
           05 WS-LIMITE    PIC 9(7)V99.
       
       01 WS-VALOR-COMPRA  PIC 9(7)V99.
       01 WS-APROVADO      PIC X VALUE 'N'.
           88 APROVADO     VALUE 'S'.
           88 REPROVADO    VALUE 'N'.
       
       PROCEDURE DIVISION.
       
           MOVE 12345 TO WS-ID.
           MOVE 'JOAO SILVA' TO WS-NOME.
           MOVE 5000.00 TO WS-LIMITE.
           MOVE 3000.00 TO WS-VALOR-COMPRA.
           
      *> Validar cliente
           CALL 'VALIDA-CLIENTE'
               USING BY REFERENCE WS-CLIENTE
                     BY CONTENT WS-VALOR-COMPRA
                     BY REFERENCE WS-APROVADO. 
           
           IF APROVADO
               DISPLAY 'COMPRA APROVADA!  '
               CALL 'PROCESSAR-VENDA'
                   USING WS-CLIENTE WS-VALOR-COMPRA
           ELSE
               DISPLAY 'COMPRA NEGADA:  LIMITE INSUFICIENTE'
           END-IF.
           
           STOP RUN.
```

```cobol
      *> ========== SUBPROGRAMA VALIDADOR ==========
       IDENTIFICATION DIVISION.
       PROGRAM-ID.  VALIDA-CLIENTE. 
       
       DATA DIVISION. 
       LINKAGE SECTION. 
       01 LS-CLIENTE. 
           05 LS-ID        PIC 9(5).
           05 LS-NOME      PIC X(40).
           05 LS-LIMITE    PIC 9(7)V99.
       01 LS-VALOR         PIC 9(7)V99.
       01 LS-STATUS        PIC X.
       
       PROCEDURE DIVISION USING LS-CLIENTE LS-VALOR LS-STATUS.
       
           DISPLAY 'VALIDANDO CLIENTE:  ' LS-NOME.
           DISPLAY 'LIMITE:  ' LS-LIMITE. 
           DISPLAY 'VALOR DA COMPRA: ' LS-VALOR.
           
           IF LS-VALOR <= LS-LIMITE
               MOVE 'S' TO LS-STATUS
               DISPLAY 'VALIDACAO:  OK'
           ELSE
               MOVE 'N' TO LS-STATUS
               DISPLAY 'VALIDACAO: LIMITE EXCEDIDO'
           END-IF.
           
           GOBACK. 
```

```cobol
      *> ========== SUBPROGRAMA PROCESSADOR ==========
       IDENTIFICATION DIVISION.
       PROGRAM-ID. PROCESSAR-VENDA.
       
       DATA DIVISION.
       LINKAGE SECTION.
       01 LS-CLIENTE.
           05 LS-ID        PIC 9(5).
           05 LS-NOME      PIC X(40).
           05 LS-LIMITE    PIC 9(7)V99.
       01 LS-VALOR         PIC 9(7)V99.
       
       WORKING-STORAGE SECTION.
       01 WS-NOVO-LIMITE   PIC 9(7)V99.
       
       PROCEDURE DIVISION USING LS-CLIENTE LS-VALOR.
       
           DISPLAY '===== PROCESSANDO VENDA ====='.
           DISPLAY 'CLIENTE: ' LS-NOME.
           DISPLAY 'VALOR: ' LS-VALOR. 
           
      *> Atualizar limite
           SUBTRACT LS-VALOR FROM LS-LIMITE GIVING WS-NOVO-LIMITE.
           MOVE WS-NOVO-LIMITE TO LS-LIMITE. 
           
           DISPLAY 'NOVO LIMITE: ' LS-LIMITE.
           DISPLAY 'VENDA CONCLUIDA!  '. 
           
           GOBACK. 
```

---

## 🔑 COMANDOS IMPORTANTES

| Comando | O que faz |
|---------|-----------|
| **CALL** | Chama subprograma |
| **USING** | Passa parâmetros |
| **BY REFERENCE** | Passa endereço (modifica original) |
| **BY CONTENT** | Passa cópia (não modifica) |
| **BY VALUE** | Passa valor direto |
| **LINKAGE SECTION** | Declara parâmetros recebidos |
| **EXIT PROGRAM** | Retorna ao chamador |
| **GOBACK** | Retorna (mais moderno) |
| **STOP RUN** | Encerra TODO o programa |

---

# 5️⃣ SQL EMBARCADO (COBOL + DB2/Oracle)

## 💾 COBOL COM BANCO DE DADOS

```cobol
       IDENTIFICATION DIVISION.
       PROGRAM-ID.  COBOL-SQL-DEMO.
       
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       
      *> ========== VARIÁVEIS PARA SQL ==========
       01 WS-CLIENTE-ID    PIC 9(5).
       01 WS-NOME          PIC X(40).
       01 WS-IDADE         PIC 99.
       01 WS-CIDADE        PIC X(30).
       
      *> ========== SQLCA (SQL Communication Area) ==========
           EXEC SQL
               INCLUDE SQLCA
           END-EXEC.
       
      *> Ou declarar manualmente: 
       01 SQLCODE          PIC S9(9) COMP. 
           88 SQL-OK       VALUE 0.
           88 SQL-NOTFOUND VALUE 100.
           88 SQL-ERROR    VALUE -999 THRU -1.
       
      *> ========== CURSOR (para múltiplos registros) ==========
           EXEC SQL
               DECLARE CURSOR-CLIENTES CURSOR FOR
               SELECT ID, NOME, IDADE, CIDADE
               FROM CLIENTES
               WHERE IDADE >= :WS-IDADE
           END-EXEC.
       
       PROCEDURE DIVISION.
       
      *> ========== CONECTAR AO BANCO ==========
       CONECTAR-DB. 
           EXEC SQL
               CONNECT TO 'MEUBANCO'
               USER 'admin'
               USING 'senha123'
           END-EXEC. 
           
           IF SQL-OK
               DISPLAY 'CONECTADO AO BANCO!  '
           ELSE
               DISPLAY 'ERRO AO CONECTAR:  ' SQLCODE
               STOP RUN
           END-IF. 
       
      *> ========== INSERT ==========
       INSERIR-CLIENTE.
           MOVE 12345 TO WS-CLIENTE-ID.
           MOVE 'JOAO SILVA' TO WS-NOME.
           MOVE 30 TO WS-IDADE. 
           MOVE 'SAO PAULO' TO WS-CIDADE.
           
           EXEC SQL
               INSERT INTO CLIENTES
                   (ID, NOME, IDADE, CIDADE)
               VALUES
                   (:WS-CLIENTE-ID,
                    :WS-NOME,
                    :WS-IDADE,
                    : WS-CIDADE)
           END-EXEC.
           
           EVALUATE SQLCODE
               WHEN 0
                   DISPLAY 'CLIENTE INSERIDO! '
               WHEN -803
                   DISPLAY 'ERRO: CHAVE DUPLICADA'
               WHEN OTHER
                   DISPLAY 'ERRO: ' SQLCODE
           END-EVALUATE.
           
           EXEC SQL COMMIT END-EXEC.
       
      *> ========== SELECT (um registro) ==========
       BUSCAR-CLIENTE.
           MOVE 12345 TO WS-CLIENTE-ID.
           
           EXEC SQL
               SELECT NOME, IDADE, CIDADE
               INTO :WS-NOME, : WS-IDADE, :WS-CIDADE
               FROM CLIENTES
               WHERE ID = : WS-CLIENTE-ID
           END-EXEC.
           
           IF SQL-OK
               DISPLAY 'NOME: ' WS-NOME
               DISPLAY 'IDADE:  ' WS-IDADE
               DISPLAY 'CIDADE: ' WS-CIDADE
           ELSE IF SQL-NOTFOUND
               DISPLAY 'CLIENTE NAO ENCONTRADO'
           ELSE
               DISPLAY 'ERRO SQL: ' SQLCODE
           END-IF.
       
      *> ========== UPDATE ==========
       ATUALIZAR-CLIENTE.
           MOVE 12345 TO WS-CLIENTE-ID.
           MOVE 31 TO WS-IDADE. 
           
           EXEC SQL
               UPDATE CLIENTES
               SET IDADE = :WS-IDADE
               WHERE ID = :WS-CLIENTE-ID
           END-EXEC.
           
           IF SQL-OK
               DISPLAY 'CLIENTE ATUALIZADO! '
               EXEC SQL COMMIT END-EXEC
           ELSE
               DISPLAY 'ERRO:  ' SQLCODE
               EXEC SQL ROLLBACK END-EXEC
           END-IF.
       
      *> ========== DELETE ==========
       DELETAR-CLIENTE.
           MOVE 12345 TO WS-CLIENTE-ID.
           
           EXEC SQL
               DELETE FROM CLIENTES
               WHERE ID = : WS-CLIENTE-ID
           END-EXEC.
           
           IF SQL-OK
               DISPLAY 'CLIENTE DELETADO! '
               EXEC SQL COMMIT END-EXEC
           END-IF.
       
      *> ========== CURSOR (múltiplos registros) ==========
       LISTAR-CLIENTES.
           MOVE 18 TO WS-IDADE.
           
      *> Abrir cursor
           EXEC SQL
               OPEN CURSOR-CLIENTES
           END-EXEC. 
           
           IF SQL-OK
               DISPLAY '===== LISTANDO CLIENTES ====='
               PERFORM FETCH-CLIENTES UNTIL SQL-NOTFOUND
           END-IF.
           
      *> Fechar cursor
           EXEC SQL
               CLOSE CURSOR-CLIENTES
           END-EXEC. 
       
       FETCH-CLIENTES.
           EXEC SQL
               FETCH CURSOR-CLIENTES
               INTO :WS-CLIENTE-ID,
                    :WS-NOME,
                    :WS-IDADE,
                    : WS-CIDADE
           END-EXEC.
           
           IF SQL-OK
               DISPLAY 'ID: ' WS-CLIENTE-ID
               DISPLAY 'NOME: ' WS-NOME
               DISPLAY 'IDADE: ' WS-IDADE
               DISPLAY 'CIDADE:  ' WS-CIDADE
               DISPLAY '--------------------'
           END-IF.
       
      *> ========== TRANSAÇÕES ==========
       TRANSACAO-EXEMPLO.
           EXEC SQL
               BEGIN WORK
           END-EXEC.
           
           PERFORM INSERIR-CLIENTE. 
           PERFORM ATUALIZAR-CLIENTE.
           
           IF SQL-OK
               EXEC SQL COMMIT END-EXEC
               DISPLAY 'TRANSACAO CONFIRMADA'
           ELSE
               EXEC SQL ROLLBACK END-EXEC
               DISPLAY 'TRANSACAO CANCELADA'
           END-IF.
       
      *> ========== DESCONECTAR ==========
       DESCONECTAR-DB. 
           EXEC SQL
               DISCONNECT
           END-EXEC.
           
           DISPLAY 'DESCONECTADO DO BANCO'. 
           STOP RUN.
```

---

## 🔑 CONCEITOS-CHAVE SQL EMBARCADO

### **`:WS-VARIAVEL` = Host Variable**
- O `:` indica que é uma variável COBOL
- Liga COBOL com SQL

### **SQLCODE = Código de retorno**

| Código | Significado |
|--------|-------------|
| **0** | Sucesso |
| **100** | Não encontrado (NOT FOUND) |
| **-803** | Chave duplicada |
| **-911** | Deadlock |
| **-204** | Tabela não existe |

### **CURSOR = Ponteiro para múltiplos registros**

1. **DECLARE** → Declara o cursor
2. **OPEN** → Abre e executa a query
3. **FETCH** → Pega próximo registro
4. **CLOSE** → Fecha o cursor

---

## 🎯 EXEMPLO COMPLETO - SISTEMA DE VENDAS COM DB

```cobol
       IDENTIFICATION DIVISION.
       PROGRAM-ID. SISTEMA-VENDAS-DB.
       
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       
      *> Variáveis
       01 WS-PRODUTO-ID    PIC 9(5).
       01 WS-NOME-PRODUTO  PIC X(50).
       01 WS-PRECO         PIC 9(7)V99.
       01 WS-ESTOQUE       PIC 9(5).
       01 WS-QUANTIDADE    PIC 9(5).
       01 WS-TOTAL         PIC 9(9)V99.
       
       01 SQLCODE          PIC S9(9) COMP.
       
      *> Cursor para produtos
           EXEC SQL
               DECLARE C-PRODUTOS CURSOR FOR
               SELECT ID, NOME, PRECO, ESTOQUE
               FROM PRODUTOS
               WHERE ESTOQUE > 0
               ORDER BY NOME
           END-EXEC.
       
       PROCEDURE DIVISION.
       
       INICIO.
           PERFORM CONECTAR. 
           PERFORM LISTAR-PRODUTOS.
           PERFORM PROCESSAR-VENDA.
           PERFORM DESCONECTAR.
           STOP RUN.
       
       CONECTAR.
           EXEC SQL
               CONNECT TO 'LOJA'
               USER 'vendedor'
               USING 'senha'
           END-EXEC. 
       
       LISTAR-PRODUTOS.
           EXEC SQL OPEN C-PRODUTOS END-EXEC.
           
           DISPLAY '===== PRODUTOS DISPONIVEIS ====='.
           
           PERFORM UNTIL SQLCODE = 100
               EXEC SQL
                   FETCH C-PRODUTOS
                   INTO :WS-PRODUTO-ID,
                        : WS-NOME-PRODUTO,
                        :WS-PRECO,
                        : WS-ESTOQUE
               END-EXEC
               
               IF SQLCODE = 0
                   DISPLAY 'ID: ' WS-PRODUTO-ID
                       ' | ' WS-NOME-PRODUTO
                       ' | R$ ' WS-PRECO
                       ' | ESTOQUE: ' WS-ESTOQUE
               END-IF
           END-PERFORM.
           
           EXEC SQL CLOSE C-PRODUTOS END-EXEC.
       
       PROCESSAR-VENDA. 
           MOVE 101 TO WS-PRODUTO-ID.
           MOVE 5 TO WS-QUANTIDADE. 
           
      *> Verificar estoque
           EXEC SQL
               SELECT PRECO, ESTOQUE
               INTO :WS-PRECO, :WS-ESTOQUE
               FROM PRODUTOS
               WHERE ID = :WS-PRODUTO-ID
           END-EXEC. 
           
           IF SQLCODE = 0
               IF WS-QUANTIDADE <= WS-ESTOQUE
                   COMPUTE WS-TOTAL = WS-PRECO * WS-QUANTIDADE
                   DISPLAY 'TOTAL: R$ ' WS-TOTAL
                   
      *> Atualizar estoque
                   EXEC SQL
                       UPDATE PRODUTOS
                       SET ESTOQUE = ESTOQUE - : WS-QUANTIDADE
                       WHERE ID = :WS-PRODUTO-ID
                   END-EXEC
                   
                   EXEC SQL COMMIT END-EXEC
                   DISPLAY 'VENDA REALIZADA! '
               ELSE
                   DISPLAY 'ESTOQUE INSUFICIENTE'
               END-IF
           END-IF.
       
       DESCONECTAR. 
           EXEC SQL DISCONNECT END-EXEC.
```

---

### **Arquivos:**
- `SELECT` → `FD` → `OPEN` → `READ`/`WRITE` → `CLOSE`

### **Strings:**
- `INSPECT` → Contar/substituir
- `STRING` → Concatenar
- `UNSTRING` → Dividir
- `(início: tamanho)` → Substring

### **Funções:**
- `FUNCTION UPPER-CASE`, `FUNCTION SUM`, `FUNCTION CURRENT-DATE`

### **Subprogramas:**
- `CALL 'NOME' USING parâmetros`
- `LINKAGE SECTION` → recebe parâmetros
- `GOBACK` → retorna

### **SQL:**
- `EXEC SQL ... END-EXEC`
- `:WS-VAR` → host variables
- `CURSOR` → múltiplos registros
- `SQLCODE` → verificar erros

---
