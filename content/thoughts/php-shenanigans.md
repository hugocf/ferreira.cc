---
date: 2019-04-15T00:46:48Z
lang: en
source: "[Equal Experts Slack, Hugo Ferreira, 2019-04-15](https://equalexperts.slack.com/archives/C0S71RJA3/p1555313472003700)"
tags: [ software, programming, languages, php, wtf, examples ]
title: PHP shenanigans
subtitle: (Really) A fractal of bad design
---

Pop quiz about [PHP](https://www.php.net/) and something we’ve stumbled upon last week, while working on a client’s codebase.

<!--more-->

Given the following code:

```php
class Foo {
  public $bar;
  public function __construct($value) {
    $this->bar = $value;
  }
}

$a = new Foo('a');
$b = new Foo('b');
$c = new Foo('c');

$result = array_diff( [$a, $b, $c], [$a, $b] );
```

What would you *expect* the result to be?

1️⃣ `Array( )`  
2️⃣ `Array( [0] => Foo( [bar] => c ) )`  
3️⃣ `Array( [2] => Foo( [bar] => c ) )`  
4️⃣ `Object of class Foo could not be converted to string`

I’ll give you some moments to think it over…

---

{{< youtube id="S3wsCRJVUyg?rel=0" title="More moments later…" >}}

---

{{< youtube id="u3UtCnXG2io?rel=0" title="More moments later…" >}}

---

“Obviously” [not 🙄] the right answer is option **4** …

>  4️⃣ `Object of class Foo could not be converted to string`

… because for the [`array_diff`](https://www.php.net/manual/en/function.array-diff.php) function …

> Two elements are considered equal if and only if `(string) $elem1 === (string) $elem2`. That is, when the [string representation](https://www.php.net/manual/en/language.types.string.php#language.types.string.casting) is the same.

… and, adding insult to injury, objects ***don’t** have a default* string representation.

😱 🤦‍♂️ x 100

<iframe src="https://giphy.com/embed/wj8VEUZVVEuls6pOw7" width="480" height="480" frameBorder="0" class="giphy-embed" allowFullScreen></iframe>

---

Funnily enough [not at all 😤] implementing the string conversion magic method …

```php
public function __toString() {
  return $this->bar;
}
  ```

… then option **3** becomes the answer …

> 3️⃣ `Array( [2] => Foo( [bar] => c ) )`

… because “arrays” in PHP don’t exist and, in reality, are nothig more than key-value maps in disguise, with the index numbers as the keys. 😕

This means you'd need to wrap it all around an [`array_values`](https://www.php.net/manual/en/function.array-values.php) call to “reset” all the ~~indexes~~ keys of the ~~array~~ map back to zero.

<iframe src="https://giphy.com/embed/zBZk5FD18QhjP35Goa" width="480" height="480" frameBorder="0" class="giphy-embed" allowFullScreen></iframe>

---

Guess I need to make this old article my new bed time reading, to read over and over and over again: [PHP: a fractal of bad design / fuzzy notepad](https://eev.ee/blog/2012/04/09/php-a-fractal-of-bad-design/)
