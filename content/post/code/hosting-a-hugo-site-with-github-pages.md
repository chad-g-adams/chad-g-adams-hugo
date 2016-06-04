+++
categories = [ "code" ]
tags = [ "github pages", "hugo", "tutorial", "blog" ]
date = "2016-05-26T11:57:11-04:00"
description = "Hosting a Hugo site on GitHub Pages"
keywords = []
title = "Hosting a Hugo site on GitHub Pages"

+++
[previous post]: {{< ref "getting-started-with-hugo.md" >}}
[githubWeb]: https://github.com/chad-g-adams/chad-g-adams.github.io
[githubHugo]: https://github.com/chad-g-adams/chad-g-adams-hugo
[git submodules]: https://git-scm.com/book/en/v2/Git-Tools-Submodules

In my [previous post], I created a static website using Hugo. This article explains how to host such a site for free, using GitHub Pages.

# GitHub Pages

GitHub Pages is a website hosting service provided by GitHub. If you are willing to publish your website in a git repository on GitHub then GitHub Pages will serve your website for free.

The requirements are that your github repo must be named `<username>.github.io` and the repo should contain an index.html file. 

# GitHub Pages and Hugo

As mentioned in my [previous post] Hugo generates a `public/` directory with the full contents of the website. In order to host that on GitHub Pages, we'll simply need to put the contents of the `public/` folder in an appropriately named github repo: 

* [chad-g-adams.github.io][githubWeb]

After a few minutes, the website will be live at <http://chad-g-adams.github.io/>

# Syncing Hugo content with GitHub Pages

Now we have two git repositories.

* One for holding the website content: [chad-g-adams-hugo][githubHugo]
* And one for holding the actual generated website which is used for hosting: [chad-g-adams.github.io][githubWeb]

The issue is, when I make changes to my site content (by working in the first repo), I would like to see those changes applied to second repo so that it can take effect on <http://chad-g-adams.github.io/>

While inside my first repository, when I generate my website using command `hugo serve`a folder called `public/` is generated in the working directory. Wouldn't it be great if that folder could be automatically part of the second git repo? In other words, having one git repo inside of another?  

This can be accomplished in different ways. Probably the simplest way is to add `public/` to `.gitignore` of the parent repo, and then clone the child repo separately into that directory.  

Another way is to use [git submodules]. This allows you to keep a git repository as a subdirectory of another git repository. The advantage is that when you run `git status` in the parent repo it will now also summarize the status of the child repo to remind you if there are outstanding changes

	modified:   public/ (new commits, modified content)

Either way, Hugo will now generate the site content directly into the second repo where it can then be easily committed and pushed.

## A note on Hugo generation

Hugo assumes the `public/` directory is empty when it generates the content. For that reason you should clean out the directory before re-generation or you risk deleted posts/pages living on.

# Automating the Deploy Steps

In order to automate the various steps required to deploy my website, I created a simple script `deploy.sh` to run all the steps in one shot.

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

