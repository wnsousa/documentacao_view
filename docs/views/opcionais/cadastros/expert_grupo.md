# expert_grupo

![Opcional](https://img.shields.io/badge/View-Opcional-green)
![Módulo](https://img.shields.io/badge/Módulo-Cadastro-green)

> View que representa o cadastro de grupos, esse dado pode ser utilizado como filtro em algumas rotinas.

---

## Campos Obrigatórios

| Campo | Tipo | Descrição |
|-------|------|-----------|
| `id` | `int` | Sequência de linhas no retorno da view. |
| `codigo` | `varchar(30)` | Codigo do grupo. |
| `nome` | `varchar(100)` | Nome do grupo. |

---

## Consulta Completa

```sql
SELECT
    id,
    codigo,
    nome
FROM expert_grupo
```

!!! tip "Dica"
    Os campos desta view enriquecem os dados no sistema mas **não bloqueiam** a integração.
