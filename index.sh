#! /bin/sh
set -e

projectName=$1
GREEN='\e[0;32m'
CYAN='\e[0;36m'
NC='\e[0m'
SCRIPTPATH="$(dirname "$(readlink -f "$0")")"
if [ -z $projectName ]
  then
    projectName=ui-base
fi

# Create project
pnpm create next-app $projectName --ts --tailwind --eslint --app --src-dir --import-alias "@/*" --use-pnpm

echo "${SCRIPTPATH}"

# Go to project folder
cd ./$projectName

git init

echo "\nInstalling devDependencies:"
echo "- ${CYAN}@typescript-eslint/parser${NC}"
echo "- ${CYAN}@typescript-eslint/eslint-plugin${NC}"
echo "- ${CYAN}prettier${NC}"
echo "- ${CYAN}eslint-config-prettier${NC}"
echo "- ${CYAN}eslint-plugin-prettier${NC}"
echo "- ${CYAN}prettier-plugin-tailwindcss${NC}"
echo "- ${CYAN}eslint-plugin-simple-import-sort${NC}"
echo "- ${CYAN}lint-staged${NC}"
echo "- ${CYAN}@commitlint/config-conventional${NC}"
echo "- ${CYAN}@commitlint/cli${NC}"
echo ""

# Install dependencies
pnpm add -D @typescript-eslint/parser @typescript-eslint/eslint-plugin prettier eslint-config-prettier eslint-plugin-prettier prettier-plugin-tailwindcss eslint-plugin-simple-import-sort lint-staged husky @commitlint/config-conventional @commitlint/cli

echo "${GREEN}✔ Install dependencies successfully!${NC}"


# Config eslint
cat $SCRIPTPATH/client/.eslintrc.json > .eslintrc.json

echo "${GREEN}✔ Config eslint successfully!${NC}"

# Config prettier
cat $SCRIPTPATH/client/.prettierrc > .prettierrc

echo "${GREEN}✔ Config prettier successfully!${NC}"

# Config lint-staged
cat $SCRIPTPATH/client/.lintstagedrc > .lintstagedrc

echo "${GREEN}✔ Config lint-staged successfully!${NC}"

# Config tsconfig
cat $SCRIPTPATH/client/tsconfig.json > tsconfig.json

echo "${GREEN}✔ Config tsconfig successfully!${NC}"

# Config tailwind
cat $SCRIPTPATH/client/tailwind.config.ts > tailwind.config.ts

echo "${GREEN}✔ Config tailwind successfully!${NC}"

# Config next.config.mjs
cat $SCRIPTPATH/client/next.config.mjs > next.config.mjs

echo "${GREEN}✔ Config next.config.mjs successfully!${NC}"

pnpm exec husky init

cat $SCRIPTPATH/client/.husky/pre-commit > .husky/pre-commit

cat $SCRIPTPATH/client/.husky/commit-msg > .husky/commit-msg

echo "${GREEN}✔ Config husky successfully!${NC}"

cat $SCRIPTPATH/client/.commitlintrc.json > .commitlintrc.json

echo "${GREEN}✔ Config commitlint successfully!${NC}"

mkdir .vscode
cat $SCRIPTPATH/client/.vscode/settings.json > .vscode/settings.json

echo "${GREEN}✔ Config vscode successfully!${NC}"

# Config UI Base
echo "Configuring UI Base"
pnpm add class-variance-authority @radix-ui/react-accordion @radix-ui/react-slot @radix-ui/react-alert-dialog lucide-react react-day-picker embla-carousel-react @radix-ui/react-checkbox tailwind-merge clsx @radix-ui/react-collapsible @radix-ui/react-dialog cmdk @radix-ui/react-context-menu vaul @radix-ui/react-dropdown-menu @radix-ui/react-label react-hook-form @radix-ui/react-navigation-menu @radix-ui/react-popover @radix-ui/react-radio-group @radix-ui/react-scroll-area @radix-ui/react-select sonner @hookform/resolvers zod @svgr/webpack tailwindcss-animate next-intl

rm -rf public
cp -rf $SCRIPTPATH/client/public public
rm -rf src
cp -rf $SCRIPTPATH/client/src src

echo "${GREEN}✔ Config UI Base successfully!${NC}"

echo "${GREEN}✔ Project setup successfully!${NC}"
