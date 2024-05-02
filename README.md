# About project

This project contains scripts to setup a Next.js project with all the necessary configurations in my own way.

## What is next-app-complete included?

This project contains the following dependencies:

- Next.js (latest version)
- pnpm (install if you don't have it)
- tailwindcss
- eslint
- @typescript-eslint/parser
- @typescript-eslint/eslint-plugin
- prettier
- eslint-config-prettier
- eslint-plugin-prettier
- prettier-plugin-tailwindcss eslint-plugin-simple-import-sort
- lint-staged
- husky
- @commitlint/config-conventional
- @commitlint/cli

## How to use it?

I recommended you install in global mode:

```bash
npm install -g next-app-complete
```

After that, you can run the script to setup your project:

```bash
next-app-complete ${your-project-name}
```

If you don't specify a project name, it will be 'ui-base' by default.
