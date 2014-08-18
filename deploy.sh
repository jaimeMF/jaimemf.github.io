#!/bin/sh

make build

cp -rf _site/* gh-pages
(

    date=$(date -u "+%Y-%m-%d %H:%M UTC")
    cd gh-pages
    git add *
    git commit -m "Site updated at $date"
    git push origin master
)
