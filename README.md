# Lingtu AI Agent Kit

Lingtu AI Agent Kit packages reusable Lingtu AI capabilities for different AI agents and model providers. The core packages are model-agnostic; adapters provide thin instructions for tools such as Codex, Claude Code, Cursor, and workflow platforms.

## Packages

- `packages/content-create`: create product images, reference images, ecommerce videos, and viral-remake media through Lingtu AI.
- `packages/tkshop-query`: query and analyze TK shop data, daily reports, shop lists, and operations questions.

## Repository Layout

```text
packages/
  content-create/
  tkshop-query/
adapters/
  codex/
  claude/
  cursor/
  dify/
  openai/
install.sh
README.md
```

## Requirements

Set `LINGTU_AI_API_KEY` in the runtime environment before using any package:

```bash
export LINGTU_AI_API_KEY="..."
```

Requests send the key as:

```text
x-api-key: <key>
```

Do not commit customer API keys, private media, or generated business data.

## Install

Clone this repository, then install the adapter that matches the customer's agent.

```bash
git clone https://github.com/<your-org>/lingtu-skills.git
cd lingtu-skills
./install.sh codex
```

Supported targets:

```bash
./install.sh codex
./install.sh claude /path/to/customer/project
./install.sh cursor /path/to/customer/project
./install.sh openai /path/to/customer/project
./install.sh dify /path/to/export/dir
```

## Customer Delivery

Recommended delivery modes:

- Private GitHub repository with read access for the customer.
- Versioned GitHub Releases for stable installs and rollback.
- Zip archive generated from a release tag.
- Service or Docker deployment when implementation details should stay private.

For commercial delivery, treat the GitHub URL as the entry point and the release tag as the contract, for example `v1.0.0`.

## Development Notes

Keep core logic in `packages/`. Adapters should stay thin and only translate the package instructions into each agent's expected format. When an API contract changes, update the package `references/api.md` first, then update the script and adapter notes.
