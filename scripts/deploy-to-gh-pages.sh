#!/bin/bash
set -o errexit

rm -rf docs

# config
git config --global user.email "antondavydov.o@gmail.com"
git config --global user.name "Anton Davydov"

# build
git clone -b gh-pages "https://${GH_TOKEN}@github.com/hanami/docs.git" ./docs
./bin/build

# deploy
cd docs
git add .
git commit -m "Deploy to Github Pages"
git remote add origin-pages https://${GH_TOKEN}@github.com/hanami/docs.git
git push --quiet origin-pages gh-pages 
