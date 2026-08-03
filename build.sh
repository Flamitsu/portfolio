#!/usr/bin/env bash
set -e
echo "Compiling with Zola"
zola build
echo "Deleting not used CSS"
npx -y purgecss --css public/css/styles.css --content "public/**/*.html" --output public/css/
echo "Minify all files"
if [ ! -f ./minify ]; then
  curl -sL https://github.com/tdewolff/minify/releases/download/v2.21.0/minify_linux_amd64.tar.gz | tar -xz minify
fi
./minify -r -o public/ public/
echo "Build completed"
