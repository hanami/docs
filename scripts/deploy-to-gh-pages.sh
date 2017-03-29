#!/bin/bash
set -o errexit

rm -rf public
mkdir public

# config
git config --global user.email "antondavydov.o@gmail.com"
git config --global user.name "Anton Davydov"

# build
git clone -b gh-pages git@github.com:hanami/docs.git ./docs
./bin/build

# deploy
cd docs
git add .
git commit -m "Deploy to Github Pages"
git push --force --quiet "https://${GITHUB_TOKEN}@$github.com/${GITHUB_REPO}.git" master:gh-pages > /dev/null 2>&1
