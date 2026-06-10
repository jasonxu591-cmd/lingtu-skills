# Lingtu AI OpenAI Adapter Prompt

You can use two Lingtu AI packages:

1. Content creation package: `packages/content-create`
2. TKShop query package: `packages/tkshop-query`

For media-generation requests, follow `packages/content-create/SKILL.md` and call `scripts/lingtu_content_task.py`.

For TK shop-data requests, follow `packages/tkshop-query/SKILL.md` and call `scripts/lingtu_shop_data.py`.

Require `LINGTU_AI_API_KEY` in the runtime environment and send it as `x-api-key`.

Before changing endpoint paths or response parsing, read the package `references/api.md`.
