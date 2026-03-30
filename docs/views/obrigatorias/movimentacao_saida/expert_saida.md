# expert_saida

![Obrigatória](https://img.shields.io/badge/View-Obrigatória-red)
![Módulo](https://img.shields.io/badge/Módulo-Saída-blue)

> View que representa todos os tipos de saida (Venda, retira, transferencia, etc).

---

## Campos Obrigatórios

| Campo | Tipo | Descrição |
|-------|------|-----------|
| `id` | `int` | Sequência de linhas no retorno da view. |
| `codigo` | `varchar(30)` | Codigo do pedido que sera apresentado nas rotinas do WMS. |
| `codigo_cliente` | `varchar(30)` | Codigo do cliente, deve ser o mesmo que esta na view expert_cliente. |
| `codigo_filial` | `varchar(30)` | Codigo da filial do pedido. |
| `data` | `date` | Data de geração do pedido. |
| `total_pedido` | `numeric(10,4)` | Valor total do pedido. |
| `tipo_pedido` | `int` | Codigo do tipo do pedido (1 = Venda, 2 = Retira, 3 = Transferencia). |

---

---

## Campos Opcionais

| Campo | Tipo | Descrição |
|-------|------|-----------|
| `vendedor` | `int` | Nome do vendedor do pedido. |
| `codigo_carregamento` | `varchar(30)` | Codigo do carregamento que o pedidos esta vinculado, para ser funcional deve existir a view expert_carregamento. |
| `ordem_pedido` | `varchar(30)` | Ordem do pedido dentro do carregamento. |
| `prioridade` | `varchar(30)` | Prioridade do pedido (2 = Alta, 3 = Normal, 4 = Baixa). |
| `descricao_consumidor` | `date` | Descrição do consumidor quando o cliente não tem cadastro especifico. |
| `container` | `numeric(10,4)` | Numero do container que o pedido esta vinculado. |
| `di` | `numeric(10,4)` | DI que o pedido esta vinculado. |
| `codigo_processo` | `numeric(10,4)` | Codigo do processo que o pedido esta vinculado. |
| `codigo_rota` | `int` | Codigo da rota que o pedido esta vinculado, para funcionar deve exitir a view expert_rota. |

---

## Consulta Mínima Obrigatória

```sql
SELECT
    id,
    codigo,
    codigo_cliente,
    codigo_filial,
    data,
    total_pedido
FROM expert_saida
```

!!! danger "Atenção"
    Esta view é **obrigatória** para o funcionamento da integração.
    A ausência dela impedirá o processo de importação.
