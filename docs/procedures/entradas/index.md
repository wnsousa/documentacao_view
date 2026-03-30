# Procedures — Entradas

![Entradas](https://img.shields.io/badge/Módulo-Entradas-blue)

Procedures responsáveis pela sincronia dos movimentos de **entrada** entre o Wms Expert e o ERP.

| Procedure | Evento | Descrição |
|---|---|---|
| [sp_RetornoImpEntrada](sp_retorno_imp_entrada.md) | Importação | Marca o movimento como recebido no ERP |
| [sp_RetornoLiberaEntrada](sp_retorno_libera_entrada.md) | Exclusão | Retorna o movimento para a view |
| [sp_RetornoExpEntrada](sp_retorno_exp_entrada.md) | Finalização | Envia cabeçalho e itens finalizados ao ERP |