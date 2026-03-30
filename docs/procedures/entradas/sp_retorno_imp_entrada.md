# sp_RetornoImpEntrada

![Entradas](https://img.shields.io/badge/Módulo-Entradas-blue)
![Evento](https://img.shields.io/badge/Evento-Importação-orange)

Após importar um movimento, o Wms notifica o ERP que o movimento foi recebido. A procedure valida o movimento e remove-o da view correspondente.

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
CREATE procedure [dbo].[sp_RetornoImpEntrada] 
@codFilialErp varchar(20), @codNotaFiscalErp varchar(20), 
@codFornecedorErp varchar(20), @serie int as

begin
  update NOTAFISCALENTRADA SET WMS = 1 
  WHERE 
    codFilialERP = @codFilialErp and 
    codNotaFiscalErp = @codNotaFiscalErp and 
    codFornecedorErp = @codFornecedorErp and
    serie = @serie
end
```

!!! info "O que ela faz"
    Atualiza o campo `WMS = 1` na tabela `NOTAFISCALENTRADA`, sinalizando que o movimento foi importado com sucesso pelo Wms.