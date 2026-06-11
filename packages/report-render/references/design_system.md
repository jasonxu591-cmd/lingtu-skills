# Lingtu Report Design System

This file is fed to the HTML composer as the visual contract. Every generated report must follow these tokens. Update conservatively — every change here changes every generated image.

## Goals

- Optimised for screenshot sharing in Feishu, WeChat groups, and DMs.
- Information hierarchy readable in under 10 seconds.
- Modern, calm, trustworthy. Not flashy.
- Pure inline CSS. No external assets, fonts, scripts, or iframes.

## Canvas

- Width: fixed `1080px`.
- Height: auto, content-driven (`<body>` grows; screenshot uses `full_page`).
- Outer page background: `#F5F7FB`.
- Outer padding: `48px` top/bottom, `40px` left/right.
- Card radius: `20px`. Card shadow: `0 8px 24px rgba(15, 23, 42, 0.06)`.

## Color tokens

| Token         | Hex       | Usage                                           |
|---------------|-----------|-------------------------------------------------|
| `--bg`        | `#F5F7FB` | Page background                                 |
| `--surface`   | `#FFFFFF` | Card background                                 |
| `--surface-2` | `#F8FAFC` | Inset / metric tile background                  |
| `--ink-1`     | `#0F172A` | Primary text, big numbers, headings             |
| `--ink-2`     | `#334155` | Body text                                       |
| `--ink-3`     | `#64748B` | Captions, labels, secondary metadata            |
| `--brand`     | `#2563EB` | Primary brand (Lingtu blue), key highlights     |
| `--brand-2`   | `#7C3AED` | Secondary accent (use sparingly)                |
| `--success`   | `#16A34A` | Positive trend, growth                          |
| `--warn`      | `#F59E0B` | Attention, watchlist                            |
| `--danger`    | `#DC2626` | Negative trend, alert                           |
| `--divider`   | `#E2E8F0` | Hairline borders                                |

Trend rule: positive deltas use `--success`, negative use `--danger`, flat use `--ink-3`. Always prefix with arrow glyphs `↑ ↓ →`.

## Typography

Use the system stack — Feishu/微信 render correctly without webfonts:

```
font-family: -apple-system, BlinkMacSystemFont, "PingFang SC", "Hiragino Sans GB",
             "Microsoft YaHei", "Helvetica Neue", Arial, sans-serif;
```

| Role          | Size   | Weight | Color       |
|---------------|--------|--------|-------------|
| Page title    | 40px   | 700    | `--ink-1`   |
| Subtitle      | 20px   | 500    | `--ink-3`   |
| Section title | 26px   | 600    | `--ink-1`   |
| Body          | 18px   | 400    | `--ink-2`   |
| Metric label  | 16px   | 500    | `--ink-3`   |
| Metric value  | 44px   | 700    | `--ink-1`   |
| Metric delta  | 18px   | 600    | trend color |
| Caption       | 14px   | 400    | `--ink-3`   |

Line height: `1.55` for body, `1.2` for numerals.

Numbers (`tabular-nums`): use `font-variant-numeric: tabular-nums;` so columns line up.

## Spacing scale

`8 / 12 / 16 / 24 / 32 / 48`. Don't invent intermediate values. Use `gap` and `margin` consistently.

## Components

### Header band

- Brand strip on top: 6px tall gradient `linear-gradient(90deg, #2563EB 0%, #7C3AED 100%)`.
- Title row: page title left, date/subtitle right.
- A 1px divider `--divider` below.

### Summary card

- Single white card, full width.
- Optional emoji at start of summary (one only, e.g. 📊 🚀 ⚠️).
- Body text 18px, 2-3 lines max.

### Metrics grid

- 2, 3, or 4 columns depending on count. Default to 4 when ≥ 4 metrics, 3 when 3, 2 when ≤ 2.
- Each tile: `--surface-2` background, `16px` radius, `24px` padding.
- Stack: label (top), value (center, big), delta (bottom, small with arrow).

### Insights list

- White card titled "洞察 / Insights".
- Each item: bullet dot in `--brand`, then text.
- Max 5 items. If more, show top 5 and add `… 还有 N 条` caption.

### Footer

- Single line, caption size, `--ink-3`.
- Format: `Powered by Lingtu · {{generated_at}}`.

## Emoji rules

- Use sparingly: at most one per card title and one in summary.
- Allowed for status: 🚀 (growth), ⚠️ (attention), 📉 (decline), 🛒 (shop), 🎯 (target), ✨ (highlight).
- Never use as bullets in lists — use the brand dot instead.

## Forbidden

- No `<script>`, `<iframe>`, `<link rel="import">`, `<object>`, `<embed>`.
- No external URLs (no `http://`, `https://`, `//cdn`, `data:` images larger than 4KB).
- No web fonts (`@font-face`, Google Fonts, Typekit).
- No CSS frameworks (Tailwind, Bootstrap CDN).
- No inline event handlers (`onclick=`, `onload=`).
- No JavaScript of any kind.
- No remote tracking pixels.

## Output contract

The composer must return a full HTML document beginning with `<!DOCTYPE html>` and ending with `</html>`. No markdown fences, no explanations, no extra text.
