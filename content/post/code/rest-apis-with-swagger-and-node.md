+++
categories = ["code"]
tags = ["REST", "Swagger", "Node", "API"]
date = "2016-10-07T17:26:55-04:00"
description = ""
keywords = ["REST", "Swagger", "Node", "API"]
title = "Building REST APIs with Swagger and Node"
draft = true

+++

If you've ever built APIs, you know the apis
One step towards executable specification.

A bonus is that routes in Node are automatically handled by the Swagger framework, so there is no more manual coding needed beyond the spec file.

While there are limitations to the OpenAPI specification, such as it's not possible to return two different response schemas. One example of this is if you have a /user/{userId} endpoint that returns public information about the user, but also should return more detailed or different information if you happen to be logged in as that user.
