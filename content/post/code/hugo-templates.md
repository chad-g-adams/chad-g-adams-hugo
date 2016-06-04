+++
categories = ["code"]
tags = ["hugo", "blog" ]
date = "2016-06-04T10:53:47-04:00"
description = "Working with Hugo templates"
keywords = ["hugo", "tutorial", "customization", "theme", "template", "hyde-x" ]
title = "Working with Hugo Templates"

+++
[previous post]: {{< ref "customizing-hugo-theme.md" >}}
[Hyde-X]: https://github.com/zyro/hyde-x
[pull request]: https://github.com/zyro/hyde-x/pull/65
[Go html/template]: https://golang.org/pkg/html/template/
[print function]: https://discuss.gohugo.io/t/concatenating-strings-with-print/711
[passing a map into a partial]: http://gohugo.io/templates/functions#dict
[Scratch]: https://gohugo.io/extras/scratch/

Hugo uses templates to generate HTML pages. This lets you control your generated HTML content with the help of simple logic. For example, logic such as ranging over all blog posts so that you can print them one at a time onto the page. Hugo uses the [Go html/template] library.

A template can describe an entire page, or just a small portion of a page (for example, just the copyright notice, the header, the footer, etc.). When this happens it is called a *partial template*, and that template can be reused just about anywhere else in your website.  Partials are especially useful in Hugo themes, as it gives you the option to override just a small part of the layout to suit your needs. As mentioned in my [previous post], overriding any file in a theme is as simple as dropping in your own version of the file with the same name. Thus templates can be overriden the same way.

# Modifying the Hyde-X theme

The [Hyde-X] theme by default provides nice looking links at the top of each post, based on the post's meta content (such as the links marked "hugo" and "blog" which you can see at the top of this post). However, Hyde-X only supports those links for *categories*, and I wanted links for *tags*, which are two different meta data taxonomies. 

This brought me to my first encounter with Hugo templating. 

To solve this, first I extracted the links section into its own partial template, where it could be customized independently from the rest of the theme. Then I made a configuration item to control which taxonomies to create links for. 

Here are some of the quirks I encountered along the way:

* *Appending strings*. The Hugo template language has limited support for many of the features available in Go. I needed to append the `/` character to a variable, but there is no append function. Turns out this can be done with [print function]: `(print $itemToLink "/")`
* *Passing values to partial templates*. After generating the links, the theme either needs to print a newline following the links (in case of blog post), or else print a dot separator (in case of list view, as seen when you click on one of the tag links). Hence I wanted to give a parameter to my partial template to specify how to handle the separator. Solution: this can be achieved by [passing a map into a partial].
* *Variable scope*. I needed a way to check if a post had any links to display, and so I wanted to store this in a flag variable. However, ranging over a collection creates a new scope and so all modifications to variables within (such as the flag) are lost outside this scope. The solution was to use Hugo's [Scratch] feature.


# Contributing back
Instead of overriding the theme just on my own personal website, I thought this feature could be generally useful to others who are using the theme. So I made a [pull request] to contribute this back to the community.
