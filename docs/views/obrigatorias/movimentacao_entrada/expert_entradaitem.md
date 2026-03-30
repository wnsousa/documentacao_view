# expert_entradaitem

![Obrigatória](https://img.shields.io/badge/View-Obrigatória-red)
![Módulo](https://img.shields.io/badge/Módulo-Entrada-blue)

> View que representa os itens da nota fiscal de entrada.

---

## Campos Obrigatórios

| Campo | Tipo | Descrição |
|-------|------|-----------|
| `id` | `int` | Sequência de linhas no retorno da view. |
| `codigo_nota` | `varchar(30)` | Codigo da nota fiscal do item. |
| `codigo_filial` | `varchar(30)` | Codigo da filial da nota fiscal. |
| `codigo_fornecedor` | `varchar(30)` | Codigo do fornecedor da nota, mesmo utilizado na view expert_fornecedor. |
| `codigo_produto` | `varchar(30)` | Codigo do produto, mesmo utilizado na view expert_produto. |
| `sequencia` | `varchar(50)` | Sequencia do item na nota fical, não deve ter mais de um item na mesma nota com a mesma sequencia. |
| `quantidade` | `numeric(14,4)` | Quantidade do produto a ser recebida no processo de entrada. |

---

---

## Campos Opcionais

| Campo | Tipo | Descrição |
|-------|------|-----------|
| `valor_unitario` | `numeric(14,3)` | Valor do produto por unidade. |
| `validade` | `date` | Validade a ser recebida do produto. |
| `fabricacao` | `date` | Fabricacao a ser recebida do produto. |
| `lote` | `varchar(50)` | Lote a ser recebido do produto. |
| `codigovolume` | `varchar(30)` | Codigo do volume vinculado ao item. |

---


## Consulta Mínima Obrigatória

```sql
SELECT
    id,
    codigo_nota,
    codigo_filial,
    codigo_fornecedor,
    codigo_produto,
    sequencia,
    quantidade
FROM expert_entradaitem
```

!!! danger "Atenção"
    Esta view é **obrigatória** para o funcionamento da integração.
    A ausência dela impedirá o processo de importação.
