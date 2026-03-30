# expert_embalagem

![Opcional](https://img.shields.io/badge/View-Opcional-green)
![Módulo](https://img.shields.io/badge/Módulo-Cadastro-green)

> View responsavel pela relações de codigos de barras do produto.

---

## Campos Obrigatórios

| Campo | Tipo | Descrição |
|-------|------|-----------|
| `id` | `int` | Sequência de linhas no retorno da view. |
| `codigo_produto` | `varchar(30)` | Codigo do produto conforme registrado na view expert_produto. |
| `codbarra` | `varchar(20)` | Codigo de barras do produto. |
| `embalagem` | `varchar(20)` | Descricao da embalagem (Caixa, Unidade, Palete). |
| `quantidade` | `numeric(14,4)` | Quantidade de unidades na embalagem. |
| `tipo_embalagem` | `int` | Tipo da embalagem (1 = Unidade, 2 = Caixa). |

---

---

## Campos Opcionais

| Campo | Tipo | Descrição |
|-------|------|-----------|
| `peso_bruto` | `numeric(14,4)` | Peso bruto da embalagem. |
| `pedo_liquido` | `numeric(14,4)` | Peso liquido da embalagem. |
| `m3` | `numeric(14,4)` | Metros cubicos da embalagem. |
| `altura` | `numeric(14,4)` | Altura da embalagem. |
| `largura` | `numeric(14,4)` | Largura da embalagem. |
| `profundidade` | `numeric(14,4)` | Profundidade da embalagem. |

---

## Consulta Mínima Obrigatória

```sql
SELECT
    id,
    codigo_produto,
    codbarra,
    embalagem,
    quantidade,
    tipo_embalagem
FROM expert_embalagem
```

!!! tip "Dica"
    Os campos desta view enriquecem os dados no sistema mas **não bloqueiam** a integração.
