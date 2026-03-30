# expert_estoque

![Opcional](https://img.shields.io/badge/View-Opcional-green)
![Módulo](https://img.shields.io/badge/Módulo-Estoque-green)

> View que representa as informações de estoque disponível.

---

## Campos Obrigatórios

| Campo | Tipo | Descrição |
|-------|------|-----------|
| `id` | `int` | Sequência de linhas no retorno da view. |
| `codigo_produto` | `varchar(30)` | Codigo do produto conforme registrado na view expert_produto. |
| `codigo_filial` | `varchar(50)` | Codigo da filial que pertence o estoque. |
| `quantidade` | `numeric(14,4)` | Quantidade disponível do produto. |

---

---

## Campos Opcionais

| Campo | Tipo | Descrição |
|-------|------|-----------|
| `lote` | `varchar(50)` | Lote do produto. |
| `validade` | `date` | Data de validade do produto. |
| `fabricacao` | `date` | Data de fabricação do produto. |

---

## Consulta Completa

```sql
SELECT
    id,
    codigo_produto,
    codigo_filial,
    quantidade,
    lote,
    validade,
    fabricacao
FROM expert_estoque
```

!!! tip "Dica"
    Os campos desta view enriquecem os dados no sistema mas **não bloqueiam** a integração.
