# TKShop Query

TKShop Query is a reusable agent package for TK shop operations data. It supports shop list lookup, daily shop reports, and AI business questions through Lingtu AI APIs.

Current package version: `0.1.0`. Remote installers can compare the `version` field in [`SKILL.md`](./SKILL.md) frontmatter to decide whether an installed copy needs updating.

## What It Does

- Lists available shops through Lingtu AI.
- Fetches a shop daily report by shop id, shop name, and date.
- Answers shop operations questions through the Lingtu AI chat API.
- Provides deterministic script entry points for agents that can run local tools.

## Requirements

Set `LINGTU_AI_API_KEY` before running API calls:

```bash
export LINGTU_AI_API_KEY="..."
```

The package sends the key as:

```text
x-api-key: <key>
```

Do not commit API keys or private business data.

## Script Usage

List shops:

```bash
python3 scripts/lingtu_shop_data.py list-shops
```

Fetch a daily report:

```bash
python3 scripts/lingtu_shop_data.py daily-report --date 2026-06-09
```

Ask a shop operations question:

```bash
python3 scripts/lingtu_shop_data.py ask "这个店铺最近经营有什么问题？"
```

## API Reference

Read [`references/api.md`](./references/api.md) before changing endpoint paths, request fields, response fields, or streaming parsing.
