# expert_carregamento

![Opcional](https://img.shields.io/badge/View-Opcional-green)
![Módulo](https://img.shields.io/badge/Módulo-Saída-green)

> View reponssavel pelo agrupamento de pedidos no processo de expedição ou embarque.

---

## Campos Obrigatórios

| Campo | Tipo | Descrição |
|-------|------|-----------|
| `id` | `int` | Sequência de linhas no retorno da view. |
| `codigo` | `varchar(30)` | Codigo do carregamento. |
| `codigo_pedido` | `varchar(30)` | Codigo do pedido vinculado ao carregamento. |
| `ordem_pedido` | `int` | Ordem do pedido no processo de embarque. |
| `codigo_filial` | `varchar(30)` | Codigo da filial que o pedido esta vinculado. |
| `data` | `date` | Data da montagem do carregamento. |

---

## Consulta Completa

```sql
SELECT
    id,
    codigo,
    codigo_pedido,
    ordem_pedido,
    codigo_filial,
    data
FROM expert_carregamento
```

!!! tip "Dica"
    Os campos desta view enriquecem os dados no sistema mas **não bloqueiam** a integração.
