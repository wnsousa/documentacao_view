# expert_rota

![Opcional](https://img.shields.io/badge/View-Opcional-green)
![Módulo](https://img.shields.io/badge/Módulo-Cadastro-green)

> View que representa a rota que esta vinculada aos pedidos.

---

## Campos Obrigatórios

| Campo | Tipo | Descrição |
|-------|------|-----------|
| `id` | `int` | Sequência de linhas no retorno da view. |
| `codigo` | `varchar(30)` | Codigo da rota. |
| `nome` | `varchar(100)` | Nome da rota. |
| `codigo_regiao` | `varchar(30)` | Codigo da região que a rota e vinculada. |

---


## Consulta Completa

```sql
SELECT
    id,
    codigo,
    nome,
    codigo_regiao
FROM expert_rota
```

!!! tip "Dica"
    Os campos desta view enriquecem os dados no sistema mas **não bloqueiam** a integração.
