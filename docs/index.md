# Documentação de Integração — Wms Expert

Bem-vindo à documentação técnica de integração do **Wms Expert**. Este guia reúne todas as informações necessárias para implementar, configurar e manter a integração entre o Wms Expert e o ERP do cliente.

---

## Visão Geral

A integração é realizada por meio de **views** e **procedures** que estabelecem a comunicação entre os sistemas. As views fornecem os dados necessários para o Wms Expert, enquanto as procedures garantem o retorno das informações ao ERP após cada operação.

---

## Como usar esta documentação

Navegue pelas seções no menu lateral ou utilize a **barra de busca** para localizar uma view ou procedure específica. A documentação está organizada em três grandes categorias:

| Seção | Tipo | Descrição |
|---|---|---|
| 🔴 **Obrigatórias** | Views | Essenciais para o funcionamento da integração |
| 🟢 **Opcionais** | Views | Enriquecem os dados sem bloquear a integração |
| 🔵 **Procedures** | Stored Procedures | Garantem o retorno de informações ao ERP |

---

## Fluxo da Integração
```
ERP  ──►  Views (Obrigatórias + Opcionais)  ──►  Wms Expert
Wms Expert  ──►  Procedures de Retorno  ──►  ERP
```

---

## Seções

### 🔴 Views Obrigatórias
Views essenciais que devem estar implementadas antes do início da integração. Estão divididas em:

- **Cadastro** — Clientes, fornecedores e produtos
- **Movimentação Entrada** — Notas fiscais de entrada
- **Movimentação Saída** — Pedidos de saída

### 🟢 Views Opcionais
Views que complementam os dados no sistema e podem ser implementadas em fases posteriores. Estão divididas em:

- **Cadastros** — Grupos, regiões, rotas e embalagens
- **Movimentação Entrada** — Dados complementares de entrada
- **Movimentação Saída** — Dados complementares de saída
- **Estoque** — Posição e movimentação de estoque
- **Auditoria** — Rastreabilidade de operações

### 🔵 Procedures de Retorno
Stored procedures responsáveis pela sincronia entre o Wms Expert e o ERP após cada operação. Estão divididas em:

- **Entradas** — Retorno de importação, exclusão e finalização de notas fiscais
- **Saídas** — Retorno de importação, exclusão e finalização de pedidos

---

!!! danger "Atenção"
    As views **Obrigatórias** devem estar implementadas e validadas antes de iniciar a integração. A ausência de qualquer uma delas impedirá o processo de importação.

!!! warning "Estrutura Modelo"
    Esta documentação representa uma **estrutura base** e pode ser adaptada conforme as necessidades específicas de cada cliente. Nomes de tabelas, campos e parâmetros devem ser ajustados de acordo com o modelo de dados do cliente.

!!! tip "Boas práticas"
    Recomenda-se implementar primeiro as views **Obrigatórias**, validar o fluxo completo e, em seguida, evoluir para as views **Opcionais** e configurar as **Procedures** de retorno.