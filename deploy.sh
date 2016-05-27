#!/usr/bin/sh

# clean any old website data
rm -r public/*

# generate new website data
hugo

# commit and push the new content
cd public
git add -A
git commit -m "website update"
git push origin master
