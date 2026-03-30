# sp_RetornoLiberaPedido

![Saídas](https://img.shields.io/badge/Módulo-Saídas-blue)
![Evento](https://img.shields.io/badge/Evento-Exclusão-red)

Quando um pedido é excluído, o Wms notifica o ERP que ele está novamente disponível, retornando-o para a view correspondente.

---

## Parâmetros

| Parâmetro | Tipo | Descrição |
|---|---|---|
| `@codFilialErp` | `varchar(20)` | Código da filial no ERP |
| `@codPedidoErp` | `varchar(20)` | Código do pedido no ERP |

---

## Código
```sql
CREATE procedure [dbo].[sp_RetornoLiberaPedido] 
@codFiliaErp varchar(20), @codPedidoErp varchar(20) as

begin
  update PEDIDO SET WMS = 0
  WHERE 
    codFilialERP = @codFilialErp and 
    codPedidoErp = @codPedidoErp
end
```

!!! warning "O que ela faz"
    Atualiza o campo `WMS = 0` na tabela `PEDIDO`, devolvendo o pedido para a fila de importação da view.