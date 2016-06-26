+++
categories = ["code"]
tags = ["hackathon", "rhok", "random hacks of kindness", "CISED", "social enterprise"]
date = "2016-06-25T21:28:00-04:00"
description = ""
keywords = []
title = "Random Hacks of Kindness 2016"

+++
[Random Hacks of Kindness]: http://rhok.ca/
[CISED]: http://www.cised.ca/
This past weekend I participated in a hackathon for [Random Hacks of Kindness] where the goal is to help support community organizations with tech solutions.

I joined the project for the Centre for Social Enterprise Development ([CISED]). A *social enterprise* is a venture whose purpose is to achieve a social mission. There are about 150 social enterprises in Ottawa, which includes ventures such as:

* ReStore - accepts donated home products then refurbishes and resells them in their retail stores with all proceeds going to Habitat for Humanity
* Laundry Matters - employees with developmental disabilities provide residential and commercial laundry services
* Good Nature Groundskeeping:  provides professional landscape maintenance services while also providing employment to people who are economically disadvantaged
* etc.

The challenge for CISED is to grow the social enterprise sector. While there is increasing awarness about social enterpries and a willingness on the purchasing side to procure their services, currently the main challenges are the lack of awareness of what services are available (for example I had only heard of about 3 of the 150 companies myself), and the ability to connect the buyers with the sellers.

The hackathon began with an energizing discussion with the stakeholders from CISED about how to connect purchasers and suppliers in an online marketplace. We went into details such as the three main types of purchasers involved:

* Large business procurement (government or companies looking to support social enterprises, perhaps to meet internal procurement targets)
* Small to medium independent business owners (perhaps looking to reinforce their brands or support the community)
* The general public (people like you and me who would like to have their snow cleared all the while knowing the proceeds will support people in need in the community)

While CISED felt that the large procurers would be the most important clients to focus on as it would be the best shot at growing the social enterprise sector, the use cases involved with these purchasers were rather complex, such as dealing with scenarios where demand outstrips supply. Since social enterprises often have limited resources, if an order came in from a big client, such as a catering order, it might require two different catering companies to satisfy. It would be rather involved to support this kind of order on an online system, but could perhaps be achieved by allowing buyers to post RFPs or a similar concept (kind of like wanted adds on kijiji). 

At the end of the day, we knew we could not build an online marketplace in 24 hours. However, there was something we could do to further the cause for all types of purchasers: build an online directory of social enterprises in Ottawa. This would satisfy an immediate need, as CISED often gets asked about what services are on offer, and currently this info is only available in a spreadsheet.

The goals of the directory would be online, public, fully searchable, and managed by CISED. New enterprises would apply to CISED for inclusion, and get vetted before being accepted. The directory would replace the current spreadsheet tracking system.

With this in mind, we decided that Wordpress was a good technology choice for this problem. A CMS system would allow CISED to manage the list of social enterprises on an ongoing basis with minimal technical expertise required. Plugins could be used to import and export the database as needed. We could deliver the solution in 24 hours in a state that was actually useful.

The delivered code is available at https://github.com/rhok2016-cised/cised-directory

We hope that CISED will find this useful!
