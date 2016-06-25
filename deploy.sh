#!/usr/bin/sh

# clean any old website data
rm -r public/*

# generate new website data
hugo

# generate CNAME file for custom domain name
echo 'www.cadams.ca' > public/CNAME

# commit and push the new content
cd public
git add -A
git commit -m "website update"
git push origin master
