
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
