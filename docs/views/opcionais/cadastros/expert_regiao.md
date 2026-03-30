# expert_regiao

![Opcional](https://img.shields.io/badge/View-Opcional-green)
![Módulo](https://img.shields.io/badge/Módulo-Cadastro-green)

> View que representa a relação de regiões.

---

## Campos Obrigatórios

| Campo | Tipo | Descrição |
|-------|------|-----------|
| `id` | `int` | Sequência de linhas no retorno da view. |
| `codigo` | `varchar(30)` | Codigo da região. |
| `nome` | `varchar(100)` | Nome da região. |

---


## Consulta Completa

```sql
SELECT
    id,
    codigo,
    nome
FROM expert_regiao
```

!!! tip "Dica"
    Os campos desta view enriquecem os dados no sistema mas **não bloqueiam** a integração.
