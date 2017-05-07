+++
categories = []
tags = ["password manager", "keepass"]
date = "2017-05-07T15:39:27-04:00"
description = ""
keywords = ["password manager", "keepass"]
title = "Setting up a (free) Password Manager"

+++

After years of remaining skeptical about password managers (do I really want to put all my eggs in one basket?), I finally caved after realizing that (a) there were simply too many accounts to remember and (b) my email is effectively a basket holding all the eggs already (anyone who gains access to your email account can use the password reset feature to access your other accounts). With that in mind a password manager didn't seem to increase my risk profile any further from it's current state.

Companies like the popular _1Password_ offer cloud-based password management across all your devices.. at a cost. $3/month for their basic plan. I was looking for something cheaper than that. Free, ideally.

So I found [_KeePass_](http://keepass.info/index.html), a lightweight open source password manager. The Windows client is so lightweight you don't even have to install it. It's just an `exe` file that sits in a folder. After opening KeePass, you add new entries for each of your passwords, or you can import passwords from other password managers (although I was starting from scratch so I didn't explore this further). The resulting password database is just an encrypted file that is safe to move around.

If you want to make your passwords available to other devices, you'll need to share this file with those devices. For my purposes, my phone is the only other device I deal with. I installed the Android app _KeePassDroid_, copied over the password database by USB, and now I'm set.

The drawback with this approach is it doesn't have cloud sync. I could have hosted my password database in my own cloud if I really wanted to, but actually I've found a simpler way to sync. These days, I always have my phone nearby! Hence the password database on my phone becomes my primary database, and all edits are done in my phone (it's pretty rare that I have to add or change a password anyway). Then periodically about once a month or so, when I normally backup my phone I also transfer my password database over at the same time.

This is a very simple approach to password management, but it meets my needs. I guess you can look at it as a cheap alternative to the pay services out there.
