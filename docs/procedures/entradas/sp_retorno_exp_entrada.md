# sp_RetornoExpEntrada

![Entradas](https://img.shields.io/badge/Módulo-Entradas-blue)
![Evento](https://img.shields.io/badge/Evento-Finalização-green)

Ao concluir um movimento, o Wms envia ao ERP as informações de cabeçalho e itens, atualizando o status para que o fluxo siga normalmente.

---

## Cabeçalho — sp_RetornoExpEntrada

### Parâmetros

| Parâmetro | Tipo | Descrição |
|---|---|---|
| `@codFilialErp` | `varchar(20)` | Código da filial no ERP |
| `@codNotaFiscalErp` | `varchar(20)` | Código da nota fiscal no ERP |
| `@codFornecedorErp` | `varchar(20)` | Código do fornecedor no ERP |
| `@serie` | `int` | Série da nota fiscal |
| `@dataFimConferencia` | `datetime` | Data e hora do fim da conferência |

### Código
```sql
CREATE procedure [dbo].[sp_RetornoExpEntrada] 
@codFiliaErp varchar(20), @codNotaFiscalErp varchar(20), 
@codFornecedorErp varchar(20), @serie int, @dataFimConferencia datetime as

begin
  update NOTAFISCALENTRADA SET DataFimConferencia = @dataFimConferencia 
  WHERE 
    codFilialERP = @codFilialErp and 
    codNotaFiscalErp = @codNotaFiscalErp and 
    codFornecedorErp = @codFornecedorErp and
    serie = @serie
end
```

---

## Itens — sp_RetornoExpEntradaItem

### Parâmetros

| Parâmetro | Tipo | Descrição |
|---|---|---|
| `@codFilialErp` | `varchar(20)` | Código da filial no ERP |
| `@codNotaFiscalErp` | `varchar(20)` | Código da nota fiscal no ERP |
| `@codFornecedorErp` | `varchar(20)` | Código do fornecedor no ERP |
| `@serie` | `int` | Série da nota fiscal |
| `@codProdutoErp` | `varchar(20)` | Código do produto no ERP |
| `@qtdRecebida` | `numeric(10,4)` | Quantidade recebida na conferência |
| `@codFuncConf` | `varchar(20)` | Código do funcionário conferente |
| `@dtConferencia` | `datetime` | Data e hora da conferência |

### Código
```sql
CREATE procedure [dbo].[sp_RetornoExpEntradaItem] 
@codFilialErp varchar(20), @codNotaFiscalErp varchar(20), 
@codFornecedorErp varchar(20), @serie int, @codProdutoErp varchar(20), 
@qtdRecebida numeric(10,4), @codFuncConf varchar(20), @dtConferencia datetime as

Declare ItensEntrada Cursor for
  Select codProdutoErp, qtdRecebida, codFuncConf, dtConferencia
    from ItensNotaFiscalEntrada
   where 
    codFilialErp = @codFilialErp and 
    codNotaFiscalErp = @codNotaFiscalErp and 
    codFornecedorErp = @codFornecedorErp and 
    serie = @serie
Open ItensEntrada
fetch next from ItensEntrada into @codProdutoErp, @qtdRecebida, @codFuncConf, @dtConferencia
while @@Fetch_Status = 0
begin
  Update ItensNotaFiscalEntrada set
    qtdRecebida = @qtdRecebida,
    codFuncConf = @codFuncConf,
    dtConferencia = @dtConferencia
  where codProdutoErp = @codProdutoErp
end
```

!!! success "O que ela faz"
    Percorre todos os itens da nota via **cursor** e atualiza quantidade recebida, funcionário conferente e data de conferência.