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
cat $SCRIPTPATH/files/.eslintrc > .eslintrc.json

echo "${GREEN}✔ Config eslint successfully!${NC}"

# Config prettier
cat $SCRIPTPATH/files/.prettierrc > .prettierrc

echo "${GREEN}✔ Config prettier successfully!${NC}"

# Config lint-staged
cat $SCRIPTPATH/files/.lintstagedrc > .lintstagedrc

echo "${GREEN}✔ Config lint-staged successfully!${NC}"

pnpm exec husky init

cat $SCRIPTPATH/files/.husky/pre-commit > .husky/pre-commit

cat $SCRIPTPATH/files/.husky/commit-msg > .husky/commit-msg

echo "${GREEN}✔ Config husky successfully!${NC}"

cat $SCRIPTPATH/files/.commitlintrc.json > .commitlintrc.json

echo "${GREEN}✔ Config commitlint successfully!${NC}"

mkdir .vscode
cat $SCRIPTPATH/files/.vscode/settings.json > .vscode/settings.json

echo "${GREEN}✔ Config vscode successfully!${NC}"

echo "${GREEN}✔ Project setup successfully!${NC}"