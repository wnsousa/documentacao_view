# sp_RetornoLiberaEntrada

![Entradas](https://img.shields.io/badge/Módulo-Entradas-blue)
![Evento](https://img.shields.io/badge/Evento-Exclusão-red)

Quando um movimento é excluído, o Wms notifica o ERP que ele está novamente disponível, retornando-o para a view correspondente.

---

## Parâmetros

| Parâmetro | Tipo | Descrição |
|---|---|---|
| `@codFilialErp` | `varchar(20)` | Código da filial no ERP |
| `@codNotaFiscalErp` | `varchar(20)` | Código da nota fiscal no ERP |
| `@codFornecedorErp` | `varchar(20)` | Código do fornecedor no ERP |
| `@serie` | `int` | Série da nota fiscal |

---

## Código
```sql
CREATE procedure [dbo].[sp_RetornoLiberaEntrada] 
@codFilialErp varchar(20), @codNotaFiscalErp varchar(20), 
@codFornecedorErp varchar(20), @serie int as

begin
  update NOTAFISCALENTRADA SET WMS = 0 
  WHERE 
    codFilialERP = @codFilialErp and 
    codNotaFiscalErp = @codNotaFiscalErp and 
    codFornecedorErp = @codFornecedorErp and
    serie = @serie
end
```

!!! warning "O que ela faz"
    Atualiza o campo `WMS = 0` na tabela `NOTAFISCALENTRADA`, devolvendo o movimento para a fila de importação da view.