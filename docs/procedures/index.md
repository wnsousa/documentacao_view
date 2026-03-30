# Procedures de Retorno

![Procedures](https://img.shields.io/badge/Tipo-Procedures-purple)

As procedures de retorno garantem a sincronia entre o **Wms Expert** e o ERP, evitando ações manuais.

!!! info "Estrutura Base"
    Os exemplos apresentados nesta documentação servem como **referência inicial** para a integração.
    Nomes de tabelas, campos e parâmetros **devem ser ajustados** de acordo com o modelo de dados do cliente.

## Como funciona

| Evento | Ação |
|---|---|
| Importação de movimento | Notifica o ERP que o movimento foi recebido |
| Exclusão de movimento | Retorna o movimento para a view correspondente |
| Finalização de movimento | Envia cabeçalho e itens atualizados ao ERP |

## Seções

| Seção | Descrição |
|---|---|
| [Entradas](entradas/index.md) | Procedures para movimentos de entrada (Notas Fiscais) |
| [Saídas](saidas/index.md) | Procedures para movimentos de saída (Pedidos) |

!!! info "Importante"
    Todas as procedures são executadas via **stored procedure** diretamente no banco de dados do ERP.