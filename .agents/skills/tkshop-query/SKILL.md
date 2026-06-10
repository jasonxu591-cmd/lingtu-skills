---
name: tkshop-query
version: 0.1.0
description: Query TK shop data through Lingtu AI APIs. Use when a user asks Codex to look up, summarize, compare, or analyze TK store/shop data, merchant data, product/store metrics, order/customer/shop performance data, or other TK shop operations data; when the user asks for a shop daily report by date, shop name, or default shop; or when the user asks AI business questions about shop operations.
---

# TKShop Query

## Overview

Use this skill for TK shop/store data lookup and analysis requests.

Supported API flows:

- Shop daily report: `GET /v1/report/biz/detail?targetType=SHOP&targetId={shop_id}&reportDate={YYYY-MM-DD}`.
- Shop list: `GET /v1/shop/list`.
- AI business question: `POST /v1/ai/chat/create`, streaming response.

Read `references/api.md` before changing endpoint paths, request fields, response fields, or streaming parsing. Use `scripts/lingtu_shop_data.py` for deterministic calls.

## Configuration

Use the same authentication pattern as `lingtu-content-create`.

Set `LINGTU_AI_API_KEY` before making requests. For a one-off shell session:

```bash
export LINGTU_AI_API_KEY="..."
```

For macOS apps launched outside your shell, set a user launchd environment variable, then restart Codex:

```bash
launchctl setenv LINGTU_AI_API_KEY "..."
```

For Windows, set a user environment variable, then restart Codex or the terminal:

```powershell
setx LINGTU_AI_API_KEY "..."
```

Send the key as the request header `x-api-key: <key>`. Do not store user API keys in this skill directory or commit them to source control.

Use `https://api.ailingtu.com` as the default base URL unless a future API reference specifies another host.

## Workflow

1. Classify the request.
   - If the user asks for a shop daily report, use the daily report flow.
   - If the user asks to list shops, use the shop list flow.
   - If the user asks a shop operations/business question and is not asking to fetch a specific daily report, use the AI chat flow.
2. For daily reports, realtime-fetch the shop list first unless the user already provides a numeric shop id.
   - If no shop is specified, use the first shop from `/v1/shop/list`.
   - If the user gives a shop name, match it against the live shop list and use that shop id.
   - If the user does not specify a report date, ask for the date instead of guessing.
3. For AI business questions, call `/v1/ai/chat/create` with the user's question and stream the answer back. Do not call the daily report API unless the user explicitly asks to retrieve a report.
4. Return concise results. Include the resolved shop id/name and report date for daily reports so the data source is clear.

## Script Usage

List shops:

```bash
python3 scripts/lingtu_shop_data.py list-shops
```

Fetch the default first shop's daily report:

```bash
python3 scripts/lingtu_shop_data.py daily-report --date 2026-06-09
```

Fetch a named shop's daily report:

```bash
python3 scripts/lingtu_shop_data.py daily-report --date 2026-06-09 --shop-name "店铺名"
```

Ask an AI shop operations question:

```bash
python3 scripts/lingtu_shop_data.py ask "这个店铺最近经营有什么问题？"
```
