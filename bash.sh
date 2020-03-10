#!/bin/sh
template_dir="$(cd "$(dirname "$0")" && pwd -P)/template"

project_name=${1}

npx create-react-app --template typescript "$project_name"
echo "eslint + prettier setting"

cd "$project_name" || exit 1
yarn add -D eslint @typescript-eslint/eslint-plugin @typescript-eslint/parser prettier eslint-config-prettier eslint-plugin-prettier eslint-config-airbnb
rm -rf src

rsync -r "$template_dir/" .
