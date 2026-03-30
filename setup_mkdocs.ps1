# ============================================================
# Setup do projeto MkDocs - Documentação de Integração
# Execute: .\setup_mkdocs.ps1
# ============================================================

$PROJECT = "."
$ErrorActionPreference = "Stop"

Write-Host "🚀 Criando estrutura do projeto" -ForegroundColor Cyan

# --- Pastas ---
$folders = @(
    "docs/views/obrigatorias/cadastro",
    "docs/views/obrigatorias/movimentacao",
    "docs/views/opcionais"
)

foreach ($folder in $folders) {
    $fullPath = Join-Path $PROJECT $folder
    if (-not (Test-Path $fullPath)) {
        New-Item -ItemType Directory -Path $fullPath -Force | Out-Null
    }
}

Write-Host "📁 Pastas criadas" -ForegroundColor Green

# ============================================================
# mkdocs.yml
# ============================================================
$mkdocsYaml = 'site_name: Documentação de Integração
site_description: Documentação técnica das views de integração
site_author: Seu Time

theme:
  name: material
  language: pt-BR
  palette:
    - scheme: default
      primary: indigo
      accent: indigo
      toggle:
        icon: material/brightness-7
        name: Modo escuro
    - scheme: slate
      primary: indigo
      accent: indigo
      toggle:
        icon: material/brightness-4
        name: Modo claro
  features:
    - navigation.tabs
    - navigation.sections
    - navigation.expand
    - navigation.top
    - search.highlight
    - search.suggest
    - content.code.copy

markdown_extensions:
  - admonition
  - pymdownx.highlight:
      anchor_linenums: true
  - pymdownx.superfences
  - pymdownx.tabbed:
      alternate_style: true
  - tables
  - attr_list

nav:
  - Início: index.md
  - Obrigatórias:
    - Visão Geral: views/obrigatorias/index.md
    - Cadastro:
      - expert_cliente: views/obrigatorias/cadastro/expert_cliente.md
      - expert_fornecedor: views/obrigatorias/cadastro/expert_fornecedor.md
      - expert_produto: views/obrigatorias/cadastro/expert_produto.md
    - Movimentação:
      - expert_pedido: views/obrigatorias/movimentacao/expert_pedido.md
      - expert_pedidoitem: views/obrigatorias/movimentacao/expert_pedidoitem.md
      - expert_nota: views/obrigatorias/movimentacao/expert_nota.md
      - expert_notaitem: views/obrigatorias/movimentacao/expert_notaitem.md
  - Opcionais:
    - Visão Geral: views/opcionais/index.md
    - expert_grupo: views/opcionais/expert_grupo.md
    - expert_embalagem: views/opcionais/expert_embalagem.md
    - expert_carregamento: views/opcionais/expert_carregamento.md
    - expert_carga: views/opcionais/expert_carga.md
    - expert_rota: views/opcionais/expert_rota.md
    - expert_regiao: views/opcionais/expert_regiao.md'

Set-Content -Path (Join-Path $PROJECT "mkdocs.yml") -Value $mkdocsYaml -Encoding UTF8
Write-Host "✅ mkdocs.yml criado" -ForegroundColor Green

# ============================================================
# index.md principal
# ============================================================
$indexContent = @"
# Documentação de Integração

Bem-vindo à documentação técnica das views de integração.

## Como usar

Navegue pelas seções no menu ou utilize a **barra de busca** para encontrar uma view específica.

## Seções disponíveis

| Seção | Descrição |
|---|---|
| 🔴 **Obrigatórias** | Views essenciais para o funcionamento da integração |
| 🟢 **Opcionais** | Views que enriquecem os dados, mas não bloqueiam a integração |

!!! danger "Atenção"
    As views marcadas como **Obrigatórias** devem estar implementadas antes de iniciar a integração.

!!! tip "Dica"
    As views **Opcionais** podem ser implementadas em fases posteriores.
"@

Set-Content -Path (Join-Path $PROJECT "docs/index.md") -Value $indexContent -Encoding UTF8

# ============================================================
# index.md - Obrigatórias
# ============================================================
$obrigatoriaIndexContent = @"
# Views Obrigatórias

![Obrigatória](https://img.shields.io/badge/Status-Obrigatória-red)

As views abaixo são **essenciais** para o funcionamento da integração.

## Cadastro

| View | Descrição |
|---|---|
| [expert_cliente](cadastro/expert_cliente.md) | Dados cadastrais dos clientes |
| [expert_fornecedor](cadastro/expert_fornecedor.md) | Dados cadastrais dos fornecedores |
| [expert_produto](cadastro/expert_produto.md) | Dados cadastrais dos produtos |

## Movimentação

| View | Descrição |
|---|---|
| [expert_pedido](movimentacao/expert_pedido.md) | Cabeçalho dos pedidos |
| [expert_pedidoitem](movimentacao/expert_pedidoitem.md) | Itens dos pedidos |
| [expert_nota](movimentacao/expert_nota.md) | Cabeçalho das notas fiscais |
| [expert_notaitem](movimentacao/expert_notaitem.md) | Itens das notas fiscais |

!!! danger "Atenção"
    A ausência de qualquer uma dessas views **impedirá** o processo de importação.
"@

Set-Content -Path (Join-Path $PROJECT "docs/views/obrigatorias/index.md") -Value $obrigatoriaIndexContent -Encoding UTF8

# ============================================================
# index.md - Opcionais
# ============================================================
$opcionaiIndexContent = @"
# Views Opcionais

![Opcional](https://img.shields.io/badge/Status-Opcional-green)

As views abaixo **complementam** os dados da integração, mas não são obrigatórias.

## Listagem

| View | Descrição |
|---|---|
| [expert_grupo](expert_grupo.md) | Grupos de produtos |
| [expert_embalagem](expert_embalagem.md) | Tipos de embalagem |
| [expert_carregamento](expert_carregamento.md) | Dados de carregamento |
| [expert_carga](expert_carga.md) | Informações de carga |
| [expert_rota](expert_rota.md) | Rotas de entrega |
| [expert_regiao](expert_regiao.md) | Regiões de atendimento |

!!! tip "Dica"
    Os campos dessas views enriquecem os dados no sistema mas **não bloqueiam** a integração caso não sejam enviados.
"@

Set-Content -Path (Join-Path $PROJECT "docs/views/opcionais/index.md") -Value $opcionaiIndexContent -Encoding UTF8

Write-Host "✅ Arquivos index.md criados" -ForegroundColor Green

# ============================================================
# Template - View Obrigatória
# ============================================================
$templateObrig = @"
# {VIEW}

![Obrigatória](https://img.shields.io/badge/View-Obrigatória-red)
![Módulo](https://img.shields.io/badge/Módulo-{MODULO}-blue)

> Descreva aqui o propósito desta view na integração.

---

## Campos Obrigatórios

| Campo | Tipo | Descrição |
|-------|------|-----------|
| ``id`` | ``int`` | Sequência de linhas no retorno da view. |

---

## Consulta Mínima Obrigatória

\`\`\`sql
SELECT
    id
    -- adicione os demais campos obrigatórios
FROM {VIEW}
\`\`\`

!!! danger "Atenção"
    Esta view é **obrigatória** para o funcionamento da integração.
    A ausência dela impedirá o processo de importação.
"@

# ============================================================
# Template - View Opcional
# ============================================================
$templateOpcl = @"
# {VIEW}

![Opcional](https://img.shields.io/badge/View-Opcional-green)
![Módulo](https://img.shields.io/badge/Módulo-Opcional-green)

> Descreva aqui o propósito desta view na integração.

---

## Campos Obrigatórios

| Campo | Tipo | Descrição |
|-------|------|-----------|
| ``id`` | ``int`` | Sequência de linhas no retorno da view. |

---

## Campos Opcionais

| Campo | Tipo | Descrição |
|-------|------|-----------|
| ``campo1`` | ``varchar(100)`` | Descrição do campo. |

---

## Consulta Completa

\`\`\`sql
SELECT
    id,
    campo1
    -- adicione todos os campos disponíveis
FROM {VIEW}
\`\`\`

!!! tip "Dica"
    Os campos desta view enriquecem os dados no sistema mas **não bloqueiam** a integração.
"@

# ============================================================
# Gerar views Obrigatórias - Cadastro
# ============================================================
$cadastroViews = @("expert_cliente", "expert_fornecedor", "expert_produto")
foreach ($view in $cadastroViews) {
    $content = $templateObrig -replace "{VIEW}", $view -replace "{MODULO}", "Cadastro"
    Set-Content -Path (Join-Path $PROJECT "docs/views/obrigatorias/cadastro/$view.md") -Value $content -Encoding UTF8
}

# ============================================================
# Gerar views Obrigatórias - Movimentação
# ============================================================
$movimentacaoViews = @("expert_pedido", "expert_pedidoitem", "expert_nota", "expert_notaitem")
foreach ($view in $movimentacaoViews) {
    $content = $templateObrig -replace "{VIEW}", $view -replace "{MODULO}", "Movimentação"
    Set-Content -Path (Join-Path $PROJECT "docs/views/obrigatorias/movimentacao/$view.md") -Value $content -Encoding UTF8
}

# ============================================================
# Gerar views Opcionais
# ============================================================
$opcionaisViews = @("expert_grupo", "expert_embalagem", "expert_carregamento", "expert_carga", "expert_rota", "expert_regiao")
foreach ($view in $opcionaisViews) {
    $content = $templateOpcl -replace "{VIEW}", $view
    Set-Content -Path (Join-Path $PROJECT "docs/views/opcionais/$view.md") -Value $content -Encoding UTF8
}

Write-Host "✅ Todas as views criadas" -ForegroundColor Green

# ============================================================
# requirements.txt
# ============================================================
$requirementsContent = @"
mkdocs-material>=9.0.0
"@

Set-Content -Path (Join-Path $PROJECT "requirements.txt") -Value $requirementsContent -Encoding UTF8
Write-Host "✅ requirements.txt criado" -ForegroundColor Green

# ============================================================
# Resumo final
# ============================================================
Write-Host ""
Write-Host "============================================" -ForegroundColor Cyan
Write-Host "✅ Projeto criado com sucesso!" -ForegroundColor Green
Write-Host "============================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "Próximos passos:" -ForegroundColor Yellow
Write-Host ""
Write-Host "  1. Instalar dependências:" -ForegroundColor White
Write-Host "     pip install -r requirements.txt" -ForegroundColor Gray
Write-Host ""
Write-Host "  2. Rodar localmente:" -ForegroundColor White
Write-Host "     mkdocs serve" -ForegroundColor Gray
Write-Host ""
Write-Host "  3. Acessar no navegador:" -ForegroundColor White
Write-Host "     http://127.0.0.1:8000" -ForegroundColor Gray
Write-Host ""
Write-Host "  4. Publicar no GitHub Pages:" -ForegroundColor White
Write-Host "     mkdocs gh-deploy" -ForegroundColor Gray
Write-Host "============================================" -ForegroundColor Cyan
