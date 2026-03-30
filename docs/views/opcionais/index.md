# Views Opcionais

![Opcional](https://img.shields.io/badge/Status-Opcional-green)

As views abaixo **complementam** os dados da integração, mas não são obrigatórias.

## Cadastros

| View | Descrição |
|---|---|
| [expert_grupo](cadastros/expert_grupo.md) | Grupos de produtos |
| [expert_regiao](cadastros/expert_regiao.md) | Regiões de atendimento |
| [expert_rota](cadastros/expert_rota.md) | Rotas de entrega |
| [expert_embalagem](cadastros/expert_embalagem.md) | Tipos de embalagem |

## Movimentação

### Entrada

| View | Descrição |
|---|---|
| [expert_carga](movimentacao_entrada/expert_carga.md) | Agrupamento de notas fiscais no recebimento |

### Saída

| View | Descrição |
|---|---|
| [expert_carregamento](movimentacao_saida/expert_carregamento.md) | Agrupamento de pedidos no embarque |

## Estoque

| View | Descrição |
|---|---|
| [expert_estoque](estoque/expert_estoque.md) | Informações de estoque por localização |

## Auditoria

| View | Descrição |
|---|---|
| [expert_auditoria](auditoria/expert_auditoria.md) | Registros de auditoria de movimentações |

!!! tip "Dica"
    Os campos dessas views enriquecem os dados no sistema mas **não bloqueiam** a integração caso não sejam enviados.
