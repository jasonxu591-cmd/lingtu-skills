# Product Reference Workflow

Use this workflow when a user provides product images and wants Codex to choose, improve, or prepare reference images for AI-generated ecommerce videos.

## Goal

Turn messy source photos into a standard 3-image reference pack:

1. `01-product-main`: one clean product image that locks product appearance.
2. `02-selling-point`: one detail/action image that shows the key feature or use.
3. `03-lifestyle-scene`: one realistic scene image that defines context and atmosphere.

The reference pack is a means to improve later video generation, not a generic beautification task.

## Source Image Rules

- Use only images provided by the user as product references. Do not introduce external product photos.
- Inspect all candidate images before creating anything.
- Prefer clear single-product photos over packaging, posters, collages, screenshots, or heavily edited marketing graphics.
- Treat packaging as information reference only unless the user explicitly wants an unboxing or packaging shot.
- Do not directly use collage/poster images as video references when they contain multiple panels, text, icons, or layout graphics; use them only to infer features.
- If a scene image contains multiple duplicate products, optimize it to one clear main product before video generation.

## Image Role Selection

Choose the strongest available source material for each role:

- **Product main**: complete single product, clean angle, visible shape, material, color, controls, logo, or distinctive details.
- **Selling point/detail**: close-up, function demonstration, texture, touch interaction, before/after, emitted light, pouring, wearing, opening, or other feature-specific evidence.
- **Lifestyle scene**: realistic environment where the target buyer would use the product; scene should clarify mood and context without clutter.

For categories with body fit or personal use, prefer these substitutions:

- Clothing: full-body front image, detail/fabric image, on-body lifestyle image.
- Beauty: product packshot, texture/application image, face/hand use scene.
- Jewelry/accessories: product close-up, wearing detail, lifestyle/occasion scene.
- Lighting/home decor: single product lit/unlit main image, light effect/detail image, room/bedside/living scene.
- Food: package or dish main image, texture/close-up image, eating/serving scene.

## When To Ask For More Images

Ask the user for missing source images before generating when a reasonable output would otherwise be speculative:

- No complete single-product image.
- No angle showing the main functional side.
- No unboxed product image and the current material is only packaging.
- No use/action image for an important selling point.
- No lifestyle scene for a product where context matters.
- For clothing, beauty, jewelry, or wearable products: no on-body/on-face/wearing image when the requested video depends on fit or appearance on a person.

Do not ask for extra images if the current set can safely produce a useful 3-image pack.

## Generation Prompts

Keep prompts direct and preserve product identity. Include "use only the provided references" in reference optimization prompts.

### Product Main

```text
Create a clean AI video reference image for this product using only the provided references. Show one single product, centered, full object visible, clean studio background. Preserve exact shape, color, material, proportions, and key details. Remove packaging, text, labels, logos not on the product, clutter, extra products, and poster layout. Realistic commercial product photography.
```

### Selling Point

```text
Create an AI video reference image showing the key selling point of this product: [selling point]. Use only the provided references. Keep one main product and make the function/action clear. Preserve product structure, color, material, and key details. Remove all text, captions, icons, labels, packaging, and poster graphics. Realistic product demo scene, no subtitles, no on-screen text.
```

### Lifestyle Scene

```text
Create a clean lifestyle AI video reference image for this product in [scene]. Use only the provided references. Show one single main product as the clear focus, with a realistic environment and natural lighting. Preserve product appearance and key details. Remove extra duplicate products, text, packaging, poster elements, and clutter. Realistic commercial lifestyle photography.
```

## Validation Checklist

Before returning optimized references, inspect the results:

- Three roles are clear and non-overlapping.
- Product identity is consistent across all images.
- Main product appears once unless the user asked otherwise.
- No captions, subtitles, UI elements, poster layout, watermarks, or unrelated text.
- No packaging unless packaging is part of the requested shot.
- Key product details remain visible.
- File extension matches actual media type.
- Local absolute paths are returned when possible.

If one generated reference fails validation, regenerate only that role with a tighter prompt.
