---
date: 2016-09-26
lang: en
tags: [ rest, info, tips, tricks, how to ]
title: REST
summary: Small information nuggets and recipies about REST
showToc: true
tocOpen: true
---

*(most recent on top)*

## Response codes and bodies

> 204s are mostly for deletes. since posts usually return 201s and both puts and gets return bodies on the responses
>
> — [Nuno Marques](https://equalexperts.slack.com/team/nmarques)

## Verbs, their meaning and usage

* [HTTP Methods for RESTful Services](http://www.restapitutorial.com/lessons/httpmethods.html)
* [Representational state transfer - Wikipedia](https://en.wikipedia.org/wiki/Representational_state_transfer#Example)
* [HTTP/1.1: Method Definitions](https://www.w3.org/Protocols/rfc2616/rfc2616-sec9.html)
* REST ≈ CRUD

*… POST = Create*

```shell
# Entire Collection e.g. /customers
201 Created
'Location' header with link to /customers/{id} containing the new ID
```

```shell
# Specific Item e.g. /customers/{id}
404 Not Found
409 Conflict — if resource already exists
```

*… GET = Read*

```shell
# Entire Collection e.g. /customers
200 OK
List of customers (use pagination, sorting and filtering on big lists)
```

```shell
# Specific Item e.g. /customers/{id}
200 OK — single customer
404 Not Found — if ID not found or invalid
```

*… PUT = Update / Replace*

```shell
# Entire Collection e.g. /customers
404 Not Found — unless you want to update/replace every resource in the entire collection
```

```shell
# Specific Item e.g. /customers/{id}
200 OK
201 Created — if using PUT for create, no need for a Location header
204 No Content
404 Not Found — if ID not found or invalid
```

*… PATCH = Update / Modify*

```shell
# Entire Collection e.g. /customers
404 Not Found — unless you want to modify the collection itself
```

```shell
# Specific Item e.g. /customers/{id}
200 OK
204 No Content
404 Not Found — if ID not found or invalid
```

*… DELETE = Delete*

```shell
# Entire Collection e.g. /customers
404 Not Found — unless you want to delete the whole collection
```

```shell
# Specific Item e.g. /customers/{id}
200 OK — maybe along with a response body if describing the status
202 Accepted — if the action has not yet been enacted
204 No Content — with no response body
404 Not Found — if ID not found or invalid
```
