# Lingtu AI Agent Kit

Use this repository as a reusable Lingtu AI capability kit.

## Routing

- For image generation, product reference optimization, ecommerce videos, and viral-remake media workflows, read `packages/content-create/SKILL.md`.
- For TK shop data lookup, daily reports, shop lists, and operations analysis, read `packages/tkshop-query/SKILL.md`.

## Environment

Require `LINGTU_AI_API_KEY` in the process environment. Send it as the request header `x-api-key`.

## Execution

Use the scripts bundled in each package:

- `packages/content-create/scripts/lingtu_content_task.py`
- `packages/tkshop-query/scripts/lingtu_shop_data.py`

Read the relevant package `references/api.md` before changing API paths, schemas, response parsing, or status mappings.
