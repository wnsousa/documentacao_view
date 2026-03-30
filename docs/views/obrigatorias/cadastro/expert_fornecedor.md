# expert_fornecedor

![Obrigatória](https://img.shields.io/badge/View-Obrigatória-red)
![Módulo](https://img.shields.io/badge/Módulo-Cadastro-blue)

> A view de fornecedor tem como proposito trazer os dados cadastrais do fornecedor para o sistema WMS.

---

## Campos Obrigatórios

| Campo | Tipo | Descrição |
|-------|------|-----------|
| `id` | `int` | Sequência de linhas no retorno da view. |
| `codigofornecedor` | `varchar(30)` | Código do fornecedor, o valor enviado deve ser o mesmo que será utilizado na view expert_entrada e o valor e o que será apresentado nas rotinas do sistema. |
| `nome` | `varchar(100)` | Nome do fornecedor que deseja que seja apresentado no sistema. |
| `cpfcnpj` | `varchar(14)` | Dado de CPF ou CNPJ do fornecedor, o dado deve vir sem caracteres especiais. |

---

## Consulta Mínima Obrigatória

```sql
SELECT
    id,
    codigofornecedor,
    nome,
    cpfcnpj
FROM expert_fornecedor
```

!!! danger "Atenção"
    Esta view é **obrigatória** para o funcionamento da integração.
    A ausência dela impedirá o processo de importação.
