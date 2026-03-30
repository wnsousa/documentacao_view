# expert_produto

![Obrigatória](https://img.shields.io/badge/View-Obrigatória-red)
![Módulo](https://img.shields.io/badge/Módulo-Cadastro-blue)

> A view de produto tem como proposito trazer os dados cadastrais do produto para o sistema WMS.

---

## Campos Obrigatórios

| Campo | Tipo | Descrição |
|-------|------|-----------|
| `id` | `int` | Sequência de linhas no retorno da view. |
| `codigoproduto` | `varchar(30)` | Código do produto, o valor enviado deve ser o mesmo que será utilizado nas views de movimentação, esse valor e o que sera apresentado nas rotinas do sistema. |
| `nome` | `varchar(100)` | Nome do produto que deseja que seja apresentado no sistema. |
| `qtd_caixa` | `numeric(14,2)` | Quantidade unitaria que vem em uma caixa do produto, valor minimo aceitavel e 1. |
| `qtd_palete` | `numeric(14,2)` | Quantidade unitaria que vem em uma caixa do produto, caso não tenha, mandar como 0. |

---

---

## Campos Opcionais

| Campo | Tipo | Descrição |
|-------|------|-----------|
| `codigo_fornecedor` | `varchar(30)` | Codigo do fornecedor do produto. |
| `codreferencia` | `varchar(30)` | Referencia do produto, esse valor não sera apresentado nas rotinas. |
| `codigo_grupo` | `varchar(30)` | Codigo do grupo do produto. |
| `shelflife` | `varchar(150)` | Dias de shelf do produto. |
| `diasquarentena` | `varchar(20)` | Quantidade de dias que o produto permanece em quarentena. |

---

## Consulta Mínima Obrigatória

```sql
SELECT
    id,
    codigoproduto,
    nome,
    qtd_caixa,
    qtd_palete
FROM expert_produto
```

!!! danger "Atenção"
    Esta view é **obrigatória** para o funcionamento da integração.
    A ausência dela impedirá o processo de importação.
