# sp_RetornoExpPedido

![Saídas](https://img.shields.io/badge/Módulo-Saídas-blue)
![Evento](https://img.shields.io/badge/Evento-Finalização-green)

Ao concluir um pedido, o Wms envia ao ERP as informações de cabeçalho e itens, atualizando o status para que o fluxo siga normalmente.

---

## Cabeçalho — sp_RetornoExpPedido

### Parâmetros

| Parâmetro | Tipo | Descrição |
|---|---|---|
| `@codFilialErp` | `varchar(20)` | Código da filial no ERP |
| `@codPedidoErp` | `varchar(20)` | Código do pedido no ERP |
| `@dataFimConferencia` | `datetime` | Data e hora do fim da conferência |
| `@dataFimSeparacao` | `datetime` | Data e hora do fim da separação |

### Código
```sql
CREATE procedure [dbo].[sp_RetornoExpPedido] 
@codFiliaErp varchar(20), @codPedidoErp varchar(20), 
@dataFimConferencia datetime, @dataFimSeparacao datetime as

begin
  update PEDIDO SET 
    DataFimConferencia = @dataFimConferencia,
    DataFimSeparacao = @dataFimSeparacao 
  WHERE 
    codFilialERP = @codFilialErp and 
    codPedidoErp = @codPedidoErp
end
```

---

## Itens — sp_RetornoExpPedidoItem

### Parâmetros

| Parâmetro | Tipo | Descrição |
|---|---|---|
| `@codFilialErp` | `varchar(20)` | Código da filial no ERP |
| `@codPedidoErp` | `varchar(20)` | Código do pedido no ERP |
| `@codProdutoErp` | `varchar(20)` | Código do produto no ERP |
| `@item` | `varchar(5)` | Número do item no pedido |
| `@qtdSeparada` | `numeric(10,4)` | Quantidade separada |
| `@qtdConferida` | `numeric(10,4)` | Quantidade conferida |
| `@codFuncConf` | `varchar(20)` | Código do funcionário conferente |
| `@codFuncSep` | `varchar(20)` | Código do funcionário separador |
| `@dtFimConferencia` | `datetime` | Data e hora do fim da conferência |
| `@dtFimSeparacao` | `datetime` | Data e hora do fim da separação |

### Código
```sql
CREATE procedure [dbo].[sp_RetornoExpPedidoItem] 
@codFilialErp varchar(20), @codPedidoErp varchar(20), 
@codProdutoErp varchar(20), @item varchar(5), 
@qtdSeparada numeric(10,4), @qtdConferida numeric(10,4), 
@codFuncConf varchar(20), @codFuncSep varchar(20), 
@dtFimConferencia datetime, @dtFimSeparacao datetime as

Declare ItensPedido Cursor for
  Select codProdutoErp, qtdSeparada, qtdConferida, codFuncConf, 
         codFuncSep, dtFimConferencia, dtFimSeparacao, item
    from ItensPedido
   where 
    codFilialErp = @codFilialErp and 
    codPedidoErp = @codPedidoErp
Open ItensPedido
fetch next from ItensPedido into @codProdutoErp, @qtdSeparada, 
    @qtdConferida, @codFuncConf, @codFuncSep, @dtFimConferencia, 
    @dtFimSeparacao, @item
while @@Fetch_Status = 0
begin
  Update ItensPedido set
    qtdSeparada = @qtdSeparada,
    qtdConferida = @qtdConferida,
    codFuncConf = @codFuncConf,
    codFuncSep = @codFuncSep,
    dtFimConferencia = @dtFimConferencia,
    dtFimSeparacao = @dtFimSeparacao
  where 
    codProdutoErp = @codProdutoErp and
    item = @item
end
```

!!! success "O que ela faz"
    Percorre todos os itens do pedido via **cursor** e atualiza quantidades separada e conferida, funcionários responsáveis e datas de finalização.