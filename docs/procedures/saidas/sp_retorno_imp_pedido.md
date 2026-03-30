# sp_RetornoImpPedido

![Saídas](https://img.shields.io/badge/Módulo-Saídas-blue)
![Evento](https://img.shields.io/badge/Evento-Importação-orange)

Após importar um movimento de saída, o Wms notifica o ERP que o pedido foi recebido. A procedure valida o movimento e remove-o da view correspondente.

---

## Parâmetros

| Parâmetro | Tipo | Descrição |
|---|---|---|
| `@codFilialErp` | `varchar(20)` | Código da filial no ERP |
| `@codPedidoErp` | `varchar(20)` | Código do pedido no ERP |

---

## Código
```sql
CREATE procedure [dbo].[sp_RetornoImpPedido] 
@codFiliaErp varchar(20), @codPedidoErp varchar(20) as

begin
  update PEDIDO SET WMS = 1 
  WHERE 
    codFilialERP = @codFilialErp and 
    codPedidoErp = @codPedidoErp
end
```

!!! info "O que ela faz"
    Atualiza o campo `WMS = 1` na tabela `PEDIDO`, sinalizando que o pedido foi importado com sucesso pelo Wms.