# Procedures — Saídas

![Saídas](https://img.shields.io/badge/Módulo-Saídas-blue)

Procedures responsáveis pela sincronia dos movimentos de **saída** entre o Wms Expert e o ERP.

| Procedure | Evento | Descrição |
|---|---|---|
| [sp_RetornoImpPedido](sp_retorno_imp_pedido.md) | Importação | Marca o movimento como recebido no ERP |
| [sp_RetornoLiberaPedido](sp_retorno_libera_pedido.md) | Exclusão | Retorna o movimento para a view |
| [sp_RetornoExpPedido](sp_retorno_exp_pedido.md) | Finalização | Envia cabeçalho e itens finalizados ao ERP |