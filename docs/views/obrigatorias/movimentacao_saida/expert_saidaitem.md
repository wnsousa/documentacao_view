# expert_saidaitem

![Obrigatória](https://img.shields.io/badge/View-Obrigatória-red)
![Módulo](https://img.shields.io/badge/Módulo-Saída-blue)

> View que trás os registros dos itens dos pedidos.

---

## Campos Obrigatórios

| Campo | Tipo | Descrição |
|-------|------|-----------|
| `id` | `int` | Sequência de linhas no retorno da view. |
| `codigo_pedido` | `varchar(30)` | Codigo do pedido que o item pertence. |
| `codigo_filial` | `varchar(30)` | Codigo da filial do pedido. |
| `codigo_produto` | `varchar(30)` | Codigo do produto o mesmo que esta na view expert_produto. |
| `sequencia` | `varchar(50)` | Sequencia do item dentro do pedido, essa sequencia nunca pode se repetir para o mesmo pedido. |
| `quantidade` | `numeric(14,4)` | Quantidade do produto a ser separado em unidade. |

---

---

## Campos Opcionais

| Campo | Tipo | Descrição |
|-------|------|-----------|
| `valor_unitario` | `numeric(14,4)` | Valor unitario do produto. |
| `codigo_volume` | `varchar(50)` | Codigo do volume que o item esta vinculado. |
| `dias_shelf` | `int` | Regra de shelf para a busca de estoque na separação do pedido. |

---

## Consulta Mínima Obrigatória

```sql
SELECT
    id,
    codigo_pedido,
    codigo_filial,
    codigo_produto,
    sequencia,
    quantidade
FROM expert_saidaitem
```

!!! danger "Atenção"
    Esta view é **obrigatória** para o funcionamento da integração.
    A ausência dela impedirá o processo de importação.
