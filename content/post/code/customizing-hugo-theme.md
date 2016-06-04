+++
categories = ["code"]
tags = ["hugo", "blog"]
date = "2016-05-29T15:46:05-04:00"
description = ""
keywords = ["hugo", "customization", "theme", "tutorial" ]
title = "Customizing Hugo Themes"

+++
[Hugo]: http://hugo.spf13.com/
[Hyde-X]: https://github.com/zyro/hyde-x
[earlier post]: {{< ref "getting-started-with-hugo.md" >}}
[Hugo Themes]: http://themes.gohugo.io/
[Hugo Customizing]: https://gohugo.io/themes/customizing/

[Hugo] has a straight forward yet powerful strategy for theming websites. 

The first step is to [choose a theme][Hugo Themes] to use, as your baseline. In an [earlier post], I mentioned that I picked [Hyde-X] for this website. I liked the general design of Hyde but wanted the extra features provided by Hyde-X such as pagination.

At this point your website will take on the default appearance of the theme. Most themes will also support some kind of configuration parameters out of the box, so this is usually the first step towards customization. For example, Hyde-X lets you configure your social media links, what syntax highlighting to use, and how you want your content paginated.

At some point you might want to tweak your website in a way that is not directly configurable through the theme. This is normal and expected, since everyone has unique needs for their sites.

Fortunately Hugo has a general convention for [overriding themes][Hugo Customizing]. Hugo lets you supplement or override any template or static file (which includes stuff like CSS, etc). Hence when you customize a theme, you don't edit the theme's files directly. Rather, you supply your own versions of those files, which then take precendence over that of the theme.

One simple example is the favicon. I simply dropped my custom icon into 

	static/favicon.png

And that takes precendence over the theme's file of the same name.

In my next post I will go a bit further into more complex customizations.
