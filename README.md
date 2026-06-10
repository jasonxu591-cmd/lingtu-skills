# 灵途 AI 能力套件 / Lingtu AI Agent Kit

将灵途 AI 能力封装为可复用的技能包，适配 Codex、Claude Code、Cursor、Dify、OpenAI 等不同智能体和平台。核心包与模型无关，适配器仅做薄层翻译。

<details>
<summary>:page_facing_up: English Version (click to expand)</summary>

Packages reusable Lingtu AI capabilities for different AI agents and platforms. Core packages are model-agnostic; adapters provide thin translation layers.

---

## What's Inside

- **`packages/content-create`** — generate product images, AI video reference packs, ecommerce/UGC selling videos, and viral-remake media through Lingtu AI.
- **`packages/tkshop-query`** — query TK shop data: daily reports, shop lists, and AI-powered operations Q&A.

## Repository Layout

```text
packages/
  content-create/   # Image & video generation
  tkshop-query/     # TK shop data & analytics
adapters/
  codex/            # Codex skill installation
  claude/           # Claude Code CLAUDE.md
  cursor/           # Cursor AGENTS.md
  dify/             # Dify workflow export
  openai/           # OpenAI custom GPT prompt
install.sh          # One-command installer
```

## Prerequisites

Set `LINGTU_AI_API_KEY` before using any package:

```bash
export LINGTU_AI_API_KEY="..."
```

| Platform | Command |
|----------|---------|
| macOS (app) | `launchctl setenv LINGTU_AI_API_KEY "..."` |
| Windows (app) | `setx LINGTU_AI_API_KEY "..."` |

Requests send the key as header `x-api-key`. Never commit API keys or generated business data.

## Install

```bash
git clone https://github.com/<your-org>/lingtu-skills.git
cd lingtu-skills
./install.sh                               # Auto-detect platform, then ask which packages to install
```

Or specify a target and packages explicitly:

```bash
./install.sh codex all
./install.sh codex content-create tkshop-query
./install.sh claude /path/to/project content-create
./install.sh cursor /path/to/project all
./install.sh openai /path/to/export/dir tkshop-query
./install.sh dify /path/to/export/dir all
```

When no package is specified, the installer shows a selection guide. Customers can enter `all`, a package name, or package numbers such as `1,2`.

## Quick Start — Content Create

```bash
cd packages/content-create

# Generate product images
python3 scripts/lingtu_content_task.py \
  --kind image \
  --prompt "A clean product hero image on white background" \
  --model gpt-image-2 \
  --aspect-ratio 1:1 \
  --nums 3 \
  --reference-image /path/to/product.png

# Generate ecommerce video
python3 scripts/lingtu_content_task.py \
  --kind video \
  --prompt "A clean product reveal video" \
  --model gemini-omni-video \
  --seconds 10 \
  --size 720x1280 \
  --reference-image /path/to/ref-1.png \
  --reference-image /path/to/ref-2.png
```

## Quick Start — TKShop Query

```bash
cd packages/tkshop-query

# List all shops
python3 scripts/lingtu_shop_data.py list-shops

# Get daily report
python3 scripts/lingtu_shop_data.py daily-report --date 2026-06-09

# Get a specific shop's report
python3 scripts/lingtu_shop_data.py daily-report --date 2026-06-09 --shop-name "Your Shop"

# Ask an AI operations question
python3 scripts/lingtu_shop_data.py ask "店铺最近经营有什么问题？"
```

## Delivery

- Private GitHub repository with read access.
- Versioned GitHub Releases (`v1.0.0`) as the contract.
- Zip archive from a release tag.
- Service or Docker deployment for private implementations.

## Development

Keep core logic in `packages/`. Keep adapters thin. When an API contract changes, update `references/api.md` first, then the script and adapter notes.

</details>

---

## 简介

将灵途 AI 的能力封装为可复用的技能包，适配以下平台：

| 适配器 | 目标 |
|--------|------|
| Codex | 安装为 Codex Skills |
| Claude Code | 注入 CLAUDE.md |
| Cursor | 注入 AGENTS.md |
| Dify | 导出工作流配置 |
| OpenAI | 导出 GPT 提示词 |

## 包含哪些能力

- **`packages/content-create`** — 生成商品图、AI 视频参考图、电商卖货视频、爆款复刻视频等。
- **`packages/tkshop-query`** — 查询 TK 店铺数据：日报、店铺列表、AI 经营问答。

## 目录结构

```text
packages/
  content-create/   # 图片与视频生成
  tkshop-query/     # TK 店铺数据查询
adapters/
  codex/            # Codex 技能安装
  claude/           # Claude Code 适配
  cursor/           # Cursor 适配
  dify/             # Dify 工作流导出
  openai/           # OpenAI GPT 适配
install.sh          # 一键安装脚本
```

## 环境准备

使用前需配置 `LINGTU_AI_API_KEY`：

```bash
export LINGTU_AI_API_KEY="你的密钥"
```

| 平台 | 持久化设置命令 |
|------|---------------|
| macOS（桌面应用） | `launchctl setenv LINGTU_AI_API_KEY "你的密钥"` |
| Windows（桌面应用） | `setx LINGTU_AI_API_KEY "你的密钥"` |

设置后重启对应的应用或终端。请求通过请求头 `x-api-key` 传递密钥。切勿将密钥或业务数据提交到 Git。

## 安装

```bash
git clone https://github.com/<your-org>/lingtu-skills.git
cd lingtu-skills
./install.sh                               # 自动识别平台，然后引导选择要安装的能力
```

也可手动指定目标平台和能力包：

```bash
./install.sh codex all
./install.sh codex content-create tkshop-query
./install.sh claude /path/to/project content-create
./install.sh cursor /path/to/project all
./install.sh openai /path/to/export/dir tkshop-query
./install.sh dify /path/to/export/dir all
```

不指定能力包时，安装脚本会显示选择引导。客户可以输入 `all`、能力包名称，或输入 `1,2` 这样的编号多选。

## 快速开始

### 内容生成（Content Create）

```bash
cd packages/content-create

# 生成商品图
python3 scripts/lingtu_content_task.py \
  --kind image \
  --prompt "一张白色背景的产品主图" \
  --model gpt-image-2 \
  --aspect-ratio 1:1 \
  --nums 3 \
  --reference-image /path/to/product.png

# 生成电商视频
python3 scripts/lingtu_content_task.py \
  --kind video \
  --prompt "一个简洁的产品展示视频" \
  --model gemini-omni-video \
  --seconds 10 \
  --size 720x1280 \
  --reference-image /path/to/ref-1.png \
  --reference-image /path/to/ref-2.png
```

### 店铺查询（TKShop Query）

```bash
cd packages/tkshop-query

# 查看店铺列表
python3 scripts/lingtu_shop_data.py list-shops

# 获取默认店铺日报
python3 scripts/lingtu_shop_data.py daily-report --date 2026-06-09

# 获取指定店铺日报
python3 scripts/lingtu_shop_data.py daily-report --date 2026-06-09 --shop-name "店铺名称"

# 向 AI 提问经营问题
python3 scripts/lingtu_shop_data.py ask "店铺最近经营有什么问题？"
```

## 交付方式

- **私有仓库**：GitHub 私有仓库，授予客户只读权限。
- **版本发布**：以版本号（如 `v1.0.0`）为交付契约，客户可回滚。
- **Zip 包**：从 Release Tag 导出压缩包分发。
- **服务部署**：需要隐藏实现细节时，以服务或 Docker 方式交付。

## 开发说明

- 核心逻辑放在 `packages/` 中，适配器保持轻量。
- API 变更时，先更新对应包的 `references/api.md`，再更新脚本和适配器。
- 不要向客户暴露 API 密钥。
