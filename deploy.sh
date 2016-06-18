#!/bin/sh

make clean build

cp -rf build/* gh-pages
(

    date=$(date -u "+%Y-%m-%d %H:%M UTC")
    cd gh-pages
    git add --all
    git commit -m "Site updated at $date"
    git push origin master
)
