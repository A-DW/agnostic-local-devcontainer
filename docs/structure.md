# Structure

The repository is organized so that environment configuration lives at the top level while the actual Next.js application lives in `web/`. Organizing related material into clear directories improves readability and makes it easier for contributors to understand where to work and where supporting documentation belongs.

## Repository layout

```text
.
├── .devcontainer/          # Dev Container configuration
│   ├── devcontainer.json
│   ├── Dockerfile
│   └── post-create.sh
├── docs/                   # Setup notes and troubleshooting
├── web/                    # Next.js application
│   ├── app/
│   ├── public/
│   ├── package.json
│   ├── tsconfig.json
│   ├── next.config.ts
│   └── ...
├── .gitignore
└── README.md
```

The main application code lives in `web/`, while repository-level configuration and supporting documentation stay at the top level.

## Key files in `web/`

- `app/layout.tsx` — root application layout and global style import.
- `app/globals.css` — global styles and Tailwind integration.
- `app/page.tsx` — initial homepage and early validation page.
- `package.json` — scripts and project dependencies.
- `tsconfig.json` — TypeScript project configuration.
- `next-env.d.ts` — Next.js type references.
- `postcss.config.mjs` — Tailwind PostCSS integration.
- `next.config.ts` — central Next.js configuration entry point.
- `eslint.config.mjs` — ESLint configuration from the scaffold.

## Why the app lives in `web/`

The application was intentionally created in a dedicated subfolder because creating it at the repository root caused conflicts with existing root-level content such as `.devcontainer/`. Keeping the app in `web/` separates environment tooling from application code and makes the repository easier to evolve over time.
