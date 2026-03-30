# expert_entrada

![Obrigatória](https://img.shields.io/badge/View-Obrigatória-red)
![Módulo](https://img.shields.io/badge/Módulo-Entrada-blue)

> View que representa todos os movimentos de entrada (compra, devolução, transferencia, etc).

---

## Campos Obrigatórios

| Campo | Tipo | Descrição |
|-------|------|-----------|
| `id` | `int` | Sequência de linhas no retorno da view. |
| `codigo` | `varchar(30)` | Codigo da nota fiscal que vai ficar visivel no sistema. |
| `codigo_filial` | `varchar(30)` | Codigo da filial de entrada da nota. |
| `codigo_fornecedor` | `varchar(30)` | Codigo do fornecedor. |
| `data` | `date` | Data de entrada da nota fiscal. |
| `tipo_entrada` | `int` | ID que representa o tipo de entrada ( 2 = Compra, 3 = Devolução, 4 = Produção, 6 = Transferencia). |

---

---

## Campos Opcionais

| Campo | Tipo | Descrição |
|-------|------|-----------|
| `serie` | `varchar(50)` | Serie da nota fiscal. |
| `quantidade_volume` | `int` | Total de volumes registrado na nota fiscal. |
| `valor_total` | `numeric(10,3)` | Valor total da nota fiscal. |
| `peso_brutp` | `numeric(10,3)` | Peso bruto total. |
| `peso_liquido` | `numeric(10,3)` | Peso liquido total. |
| `observacao` | `varchar(255)` | Outras informações. |
| `container` | `varchar(50)` | Numero de container vinculado a nota fiscal. |
| `codigoprocesso` | `varchar(50)` | Codigo do processo vinculado a nota fiscal. |
| `codigo_carga` | `varchar(50)` | Codigo da carga de recebimento que a nota esta vinculada, para ser valido a view expert_carga deve existir. |

---

## Consulta Mínima Obrigatória

```sql
SELECT
    id,
    codigo,
    codigo_filial,
    codigo_fornecedor,
    data,
    tipo_entrada
FROM expert_entrada
```

!!! danger "Atenção"
    Esta view é **obrigatória** para o funcionamento da integração.
    A ausência dela impedirá o processo de importação.
