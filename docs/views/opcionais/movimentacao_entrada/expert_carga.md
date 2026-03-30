# expert_carga

![Opcional](https://img.shields.io/badge/View-Opcional-green)
![Módulo](https://img.shields.io/badge/Módulo-Entrada-green)

> View responsável pelo agrupamento de notas fiscais no recebimento de mercadoria.

---

## Campos Obrigatórios

| Campo | Tipo | Descrição |
|-------|------|-----------|
| `id` | `int` | Sequência de linhas no retorno da view. |
| `codigo_carga` | `varchar(30)` | Codigo da carga. |
| `codigo_filial` | `varchar(30)` | Codigo da filial. |
| `data` | `date` | Data de geração da carga. |

---

## Consulta Completa

```sql
SELECT
    id,
    codigo_carga,
    codigo_filial,
    data
FROM expert_carga
```

!!! tip "Dica"
    Os campos desta view enriquecem os dados no sistema mas **não bloqueiam** a integração.
