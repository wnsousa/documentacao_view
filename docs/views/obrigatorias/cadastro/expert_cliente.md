# expert_cliente

![Obrigatória](https://img.shields.io/badge/View-Obrigatória-red)
![Módulo](https://img.shields.io/badge/Módulo-Cadastro-blue)

> A view de cliente tem como proposito trazer os dados cadastrais do cliente para o sistema WMS, nesse caso o cliente e considerado toda e qualquer entidade que possa vir no processo de expedição.

---

## Campos Obrigatórios

| Campo | Tipo | Descrição |
|-------|------|-----------|
| `id` | `int` | Sequência de linhas no retorno da view. |
| `codigocliente` | `varchar(30)` | Código do cliente, o valor enviado deve ser o mesmo que será utilizado na view expert_saida e o valor e o que será apresentado nas rotinas do sistema. |
| `nome` | `varchar(100)` | Nome do cliente que deseja que seja apresentado no sistema. |
| `cpfcnpj` | `varchar(14)` | Dado de CPF ou CNPJ do cliente, o dado deve vir sem caracteres especiais. |

---

---

## Campos Opcionais

| Campo | Tipo | Descrição |
|-------|------|-----------|
| `ie` | `varchar(10)` | Inscrição estadual do cliente. |
| `nomecidade` | `varchar(100)` | Nome da cidade. |
| `bairro` | `varchar(120)` | Nome do bairro |
| `endereco` | `varchar(150)` | Endereço do cliente. |
| `numero` | `varchar(20)` | Numero da residencia ou comercio. |
| `complemento` | `varchar(150)` | Dados complementares. |
| `cep` | `varchar(8)` | Cep do cliente, o dado deve vir sem caracteres especiais. |
| `telefone` | `varchar(14)` | Telefone do cliente, o dado deve vir sem caracteres especiais. |
| `shelflife` | `varchar(14)` | Regra de Shelf de expedição para o cliente. |

---

## Consulta Mínima Obrigatória

```sql
SELECT
    id
    codigocliente,
    nome,
    cpfcnpj
FROM expert_cliente
```

!!! danger "Atenção"
    Esta view é **obrigatória** para o funcionamento da integração.
    A ausência dela impedirá o processo de importação.
