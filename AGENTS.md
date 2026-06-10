# Lingtu AI Agent Instructions

Use this repository when a user asks for Lingtu AI content generation or TK shop data analysis.

## Available Packages

- `packages/content-create`: media generation, product reference images, ecommerce videos, and viral remake workflows.
- `packages/tkshop-query`: TK shop list lookup, daily reports, and shop operations analysis.

## Shared Rules

- Require `LINGTU_AI_API_KEY` in the process environment.
- Send the key as `x-api-key`.
- Read the package `references/api.md` before changing endpoint paths, request fields, response fields, or status handling.
- Prefer the package scripts over ad hoc API calls.
- Do not store customer API keys in this repository.

## Routing

Use `packages/content-create` for product images, image references, ecommerce videos, viral remakes, and media-generation tasks.

Use `packages/tkshop-query` for shop lists, daily reports, merchant/store metrics, and business-operation questions.
