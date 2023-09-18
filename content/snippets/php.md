---
date: 2015-06-17
description: Small information nuggets and recipies about PHP
lang: en
tags: [ php, info, tips, tricks, how to ]
title: PHP
showToc: true
tocOpen: true
tocSide: right
---

<!--more-->

*(most recent on top)*

## Which url requested this file?

```php
echo $_SERVER["HTTP_HOST"] . $_SERVER["REQUEST_URI"];
```

## Command line scripts

```php
php -r '$var = value';
php -a                            # interactive (needs readline)
```

## Show all defined constants

```php
print_r(@get_defined_constants());
```

## Default values for contents

```php
defined('CONSTANT')? : define('CONSTANT', 'value');
defined('CONSTANT') || define('CONSTANT', 'value');
defined('CONSTANT') or define('CONSTANT', 'value');
```

## Default values for variables

```php
isset($var)? : $var = 'value';
isset($var) || $var = 'value';
isset($var) or $var = 'value';
```
