# expert_auditoria

![Opcional](https://img.shields.io/badge/View-Opcional-green)
![Módulo](https://img.shields.io/badge/Módulo-Auditoria-green)

!!! warning "Em Desenvolvimento"
    Esta view está em desenvolvimento e será documentada em futuras atualizações.

> View que registra todas as movimentações e alterações realizadas no WMS para fins de auditoria.

---

## Campos Obrigatórios

| Campo | Tipo | Descrição |
|-------|------|-----------|
| `id` | `int` | Sequência de linhas no retorno da view. |

---

## Consulta Completa

```sql
SELECT
    id
FROM expert_auditoria
```

!!! tip "Dica"
    Os campos desta view enriquecem os dados no sistema mas **não bloqueiam** a integração.
