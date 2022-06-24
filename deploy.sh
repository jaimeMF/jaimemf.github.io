#!/bin/sh

make clean build

CLONE_URL=git@github.com:jaimeMF/jaimemf.github.io.git

rm -rf gh-pages
git clone $CLONE_URL gh-pages --branch master

cp -rf build/* gh-pages
(

    date=$(date -u "+%Y-%m-%d %H:%M UTC")
    cd gh-pages
    git add --all
    git commit -m "Site updated at $date"
    git push origin master
)
