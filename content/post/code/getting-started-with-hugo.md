+++
tags = ["hugo", "blog" ]
categories = [ "code" ]
date = "2016-05-24T09:27:14-04:00"
description = "Getting Started With Hugo, a static site generator"
keywords = ["hugo", "blog", "static site", "github pages", "github", "hyde-x"]
title = "Getting Started With Hugo"

+++

# Overview
Setting up a website these days can be done at no cost other than a bit of time. I thought it would be interesting to spend a weekend playing around with some of the available tools. This article covers how I set up my site, using [Hugo](http://hugo.spf13.com/) to generate my content, and [GitHub Pages](https://pages.github.com/) to host.

# Hugo
For simple sites, such as blogs, there are good reasons to prefer static site generators:

* **Better security**: everything becomes simple static content so it significantly limits the areas of exposure to hackers; there are no logins, passwords, etc.
* **Performance**: the site will load quickly and be responsive
* **Offline editing**: I can continue to create content when I'm offline, although that is becoming less and less of an issue these days 

[Hugo](http://hugo.spf13.com/) is a static site generator written in Go. I chose Hugo because it was open source with an active community, and because I also have an interest in learning the Go language (not that you need worry about that when building your website with Hugo).


# Hugo Workflow

Using Hugo was an absolute pleasure. There are [good tutorials](https://gohugo.io/overview/quickstart/) on Hugo available, so I will just cover some of the highlights here to demonstrate how easy it is.

## Creating a new site
One simple command will create you a new site 

	hugo new site mySiteName

This will create a new folder called `mySiteName/` and bootstrap it with the required directory structure.

## Create new content
Creating a new post is as simple as

	hugo new post/my-post-name.md

The post file `my-post-name.md` appears in the `mySiteName/content/post/` directory.

The basic premise of Hugo is that your content is organized in a specific way on purpose. Hence the filesystem organization of your content matches the URL at which it is hosted. For example content file at `content/foo/bar/myFirstPost.md` will be hosted at `<site>/foo/bar/myFirstPost` (By default - however that is fully configurable).

## Editing content
Post content is generally a plain text file (which means I am writing everything in vim, hooray!). Hugo has native support for [Markdown](http://daringfireball.net/projects/markdown/basics) language. 

Every content file begins with a section of metadata that allows you to specify information about the content, like the title, date, tags, or any arbitrary data you would use to classify your content.

## Pick a Theme

Next you pick a theme for your site. I used **[hyde-x](https://github.com/zyro/hyde-x)**, with a few tweaks (more to come on that in a later post).

## Preview Your Site

Alright, we have some content now, let's test it out. Hugo comes with a built-in HTTP server. Launch the server with a simple command

	hugo serve

And connect a browser to the endpoint to view your site. Boom! 

Could it be any easier?

Here's a cool feature: your browser *automatically updates instantly* as you edit your site's content! This makes your web development cycle a very tight loop.

## Publish Your Site

Once you're satisfied with your site, it's time to publish. Running the command

	hugo

Generates a folder `public/` with all the static HTML, CSS, etc needed for your site.  That folder can then be dropped onto a web server, or hosted by an external service (such as GitHub Pages - I will be going into that in my next post).

# My Hugo Content 

For reference, the Hugo code for this website can be found on my github repo [here](https://github.com/chad-g-adams/chad-g-adams-hugo)

