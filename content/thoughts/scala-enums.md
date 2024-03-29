---
date: 2017-05-14T12:47:21
tags: [ programming, data types, enumerates, comparison, scala, java ]
title: Scala Enumerations Summary
summary: Comparison between different ways of doing enumerates, with `scala.Enumeration`, `case object` and Java’s `Enum`.
showToc: true
tocOpen: true
---

_**Update 2017-07-01**: [“Add enum construct”](https://github.com/lampepfl/dotty/issues/1970) is a new proposal by Martin Odersky to add the keyword `enum` to Dotty, which might render many of these considerations irrelevant._

Quite often the topic of how to do enumerations in Scala pops up in internal discussions at work, and more 
often than not I found myself referring back to the same bookmarks and revisiting the pros & cons of different techniques.

I believe there are no such things as *advantages* or *disadvantages*. What we have are *characteristics* being interpreted under a certain *context*, which makes them shine in a positive or negative light.

This post summarises the **characteristics** of the 3 most common ways of making enumerations in Scala, hoping it helps you make the choices and **tradeoffs**  that are more suitable for your particular use case:

- Abstract class [**`scala.Enumeration`**][scalaenum]
- Algebraic data types with [**`case object|class`**][caseobj] extending a `sealed trait`
- Java [**`Enum`**][javaenum]

[scalaenum]: http://www.scala-lang.org/api/current/index.html#scala.Enumeration
[caseobj]:   http://stackoverflow.com/a/26690131/1380781
[javaenum]:  https://docs.oracle.com/javase/8/docs/api/java/lang/Enum.html

There are several libraries out there which add enumeration capabilities with different characteristics, but I’m only interested in what is possible to do out of the box with plain vanilla Scala, and keeping things as simple as possible.

## References & Sources

If you want to explore further, these were the key references and sources used in this post…

Undersore:

* [Scala Enumerations - Underscore](http://underscore.io/blog/posts/2014/09/03/enumerations.html)
* [Everything You Ever Wanted to Know About Sealed Traits in Scala - Underscore](http://underscore.io/blog/posts/2015/06/02/everything-about-sealed.html)
* [More on Sealed Traits in Scala - Underscore](http://underscore.io/blog/posts/2015/06/04/more-on-sealed.html)

StackOverflow:

* [Case objects vs Enumerations in Scala - Stack Overflow](http://stackoverflow.com/questions/1898932/case-objects-vs-enumerations-in-scala)
* [Enumeration concept in Scala - Which option to take? - Stack Overflow](http://stackoverflow.com/questions/28589022/enumeration-concept-in-scala-which-option-to-take)
* [Writing Algebraic Data Type in Scala - Stack Overflow](http://stackoverflow.com/questions/26689951/writing-algebraic-data-type-in-scala)

Spaghetti and Hammers:

* [Scala Enumerations - Part 1](http://pedrorijo.com/blog/scala-enums/)
* [Scala Enumerations - Return of the (Java) Jedi](http://pedrorijo.com/blog/scala-enums-part2/)

## What do they give you?

* ✅ Fully supported out of the box or straightforward to do
* ⚠️ Has workaround but at the cost of boilerplate code or manual work
* ⛔️ Not supported or too cumbersome to use

| Topic                | Characteristic                                                                 | Scala `scala.Enumeration` | Scala `case object` | Java `Enum` |
| -------------------- | ------------------------------------------------------------------------------ | :-----------------------: | :-----------------: | :---------: |
| **Customizable**     | Support custom data fields other than “name” and “index”                       |            ⚠️             |         ⚠️          |     ⚠️      |
| **Indexed**          | Items have a consecutive incremental numeric value                             |            ✅             |         ⛔️          |     ✅      |
| **Indexed**          | Items can be retrieved via their index                                         |            ✅             |         ⛔️          |     ✅      |
| **Ordered**          | Enum items naturally ordered according to their index<br>(Item1 < Item2)       |            ✅             |         ⛔️          |     ✅      |
| **Iterable**         | Capable of iterating over the enum items as a collection                       |            ✅             |         ⚠️          |     ✅      |
| **Pattern Matching** | Ability to do pattern matching on the items                                    |            ✅             |         ✅          |     ✅      |
| **Pattern Matching** | Compile time warning about *exhaustive pattern matching*                       |            ⛔️             |         ✅          |     ✅      |
| **Serialization**    | Each enum item has an associated “name” value<br>(Item ➔ `String`)             |            ✅             |         ✅          |     ✅      |
| **Serialization**    | Instantiate an enum item from a “name”<br>(`String` ➔ Item)                    |            ✅             |         ⚠️          |     ✅      |
| **Types**            | Items are instances of the enumeration, not separate classes                   |            ✅             |         ⛔️          |     ✅      |
| **Types**            | Has distinct type after type erasure (i.e. can be used for method overloading) |            ⛔️             |         ✅          |     ✅      |
| **Interop**          | Ease of use in mixed Scala/Java projects                                       |            ⚠️             |         ⛔️          |     ✅      |

## How to declare them?

This uses the simplest example of `WeekDays` (with *index* for Monday starting at 1) whenever possible. When manual customizations are needed to implement a certain feature, those are illustrated in `CustomEnum`.

💻 **All code and tests below are available for download in the [`scala-enums`][github] GitHub repo.**

[github]: https://github.com/hugocf/scala-enums

### `scala.Enumeration`

Simple version:

```scala
// file: enumeration/WeekDay.scala
object WeekDay extends Enumeration {
  type WeekDay = Value
  val Mon, Tue, Wed, Thu, Fri, Sat, Sun = Value
}
```

With tweaks for customizable fields:

```scala
// file: enumeration/CustomEnum.scala
object CustomEnum extends Enumeration {
  type CustomEnum = Value
  val Foo = CustomEnumVal("This is a foo")
  val Bar = CustomEnumVal("This is a bar")
  val Baz = CustomEnumVal("This is a baz")

  protected case class CustomEnumVal(custom: String) extends Val
  implicit def convert(value: Value): CustomEnumVal = value.asInstanceOf[CustomEnumVal]
}
```

### `case object`

Simple version:

```scala
// file: caseobject/WeekDay.scala
object WeekDay {
  sealed trait WeekDay
  case object Mon extends WeekDay
  case object Tue extends WeekDay
  case object Wed extends WeekDay
  case object Thu extends WeekDay
  case object Fri extends WeekDay
  case object Sat extends WeekDay
  case object Sun extends WeekDay
}
```

With tweaks for customizable fields, indexing, ordering, iteration, and serialization:

```scala
// file: caseobject/CustomEnum.scala
object CustomEnum {
  sealed abstract class CustomEnum(val order: Int, val custom: String) extends Ordered[CustomEnum] {
    override def compare(that: CustomEnum): Int = this.order - that.order
  }
  case object Foo extends CustomEnum(1, "This is a foo")
  case object Bar extends CustomEnum(2, "This is a bar")
  case object Baz extends CustomEnum(3, "This is a baz")

  object CustomEnum {
    val all = Seq(Foo, Bar)

    def withOrder(o: Int): Option[CustomEnum] = all.find(_.order == o)

    def withName(n: String): Option[CustomEnum] = all.find(_.toString == n)
  }
}
```

### Java `Enum`

Simple version:

```java
// file: javaenum/WeekDay.java
public enum WeekDay {
    MON, TUE, WED, THU, FRI, SAT, SUN
}
```

With tweaks for customizable fields:

```java
// file: javaenum/CustomEnum.java
public enum CustomEnum {
    FOO("This is a foo"), BAR("This is a bar"), BAZ("This is a baz");

    public final String custom;

    CustomEnum(String value) {
        this.custom = value;
    }
}
```

## Usage Examples

### Customizable: Support custom data fields other than “name” and “index”

**⚠️ `scala.Enumeration`**

```scala
Foo.custom shouldBe "This is a foo"
```

**⚠️ `case object`**

```scala
Foo.custom shouldBe "This is a foo"
```

**⚠️ Java `Enum`**

```scala
FOO.custom shouldBe "This is a foo"
```

### Indexed: Items have a consecutive incremental numeric value

**✅ `scala.Enumeration`**

```scala
Mon.id shouldBe 1
Sun.id shouldBe 7
```

**⛔️ `case object`**

```scala
Foo.order shouldBe 1
Bar.order shouldBe 2
```

**✅ Java `Enum`**

The initial constant position in the enum declaration is assigned a fixed ordinal of 0 (zero).

```scala
MON.ordinal shouldBe 0
SUN.ordinal shouldBe 6
```

### Indexed: Items can be retrieved via their index

**✅ `scala.Enumeration`**

```scala
the [NoSuchElementException] thrownBy WeekDay(0) should have message "key not found: 0"
WeekDay(1) shouldBe Mon
WeekDay(7) shouldBe Sun
```

**⛔️ `case object`**

```scala
CustomEnum.withOrder(0) shouldBe None
CustomEnum.withOrder(1) shouldBe Some(Foo)
CustomEnum.withOrder(2) shouldBe Some(Bar)
```

**✅ Java `Enum`**

```scala
val values: Array[WeekDay] = WeekDay.values()  // every call returns a newly cloned array
values(0) shouldBe MON
values(6) shouldBe SUN
the [ArrayIndexOutOfBoundsException] thrownBy values(7) should have message "7"
```

### Ordered: Enum items naturally ordered according to their index

**✅️️ `scala.Enumeration`**

```scala
Mon < Tue shouldBe true
```

**⛔️ `case object`**

```scala
Foo < Bar shouldBe true
```

**✅ Java `Enum`**

```scala
MON.ordinal < TUE.ordinal shouldBe true
MON.compareTo(TUE) should be < 0
```

### Iterable: Capable of iterating over the enum items as a collection

**✅️️ `scala.Enumeration`**

```scala
WeekDay.values shouldBe ValueSet(Mon, Tue, Wed, Thu, Fri, Sat, Sun)
```

**⚠️ `case object`**

```scala
CustomEnum.all shouldBe Seq(Foo, Bar, Baz)
```

**✅ Java `Enum`**

```scala
WeekDay.values shouldBe Array(MON, TUE, WED, THU, FRI, SAT, SUN)
```

### Pattern Matching: Ability to do pattern matching on the items

**✅ `scala.Enumeration`**

```scala
val day = Sun   // Default inferred type: WeekDay.Value

val result = day match {
  case Sat | Sun => "weekend"
  case _ => "working day"
}

result shouldBe "weekend"
```

**✅ `case object`**

```scala
val day: WeekDay = Sun  // Default inferred type: WeekDay.Sun.type

val result = day match {
  case Sat | Sun => "weekend"
  case _ => "working day"
}

result shouldBe "weekend"
```

**✅ Java `Enum`**

```scala
val day = SUN   // Default inferred type: WeekDay

val result = day match {
  case SAT | SUN => "weekend"
  case _ => "working day"
}

result shouldBe "weekend"
```

### Pattern Matching: Compile time warning about *exhaustive pattern matching*

**⛔️ `scala.Enumeration`**

This means that the compiler is happy to accept the code below at compile time, without issuing any warning, even though it *can* fail at runtime with a `scala.MatchError`.

Runtime errors can be mitigated by always adding a `case _` fallback to every pattern matching statement.

```scala
val day = Mon   // Default inferred type: WeekDay.Value

// This code generates no warning!
a[MatchError] shouldBe thrownBy {
  day match {
    case Sat | Sun => "weekend"
  }
}
```

**✅ `case object`**

```scala
val day: WeekDay = Mon  // Default inferred type: WeekDay.Sun.type

// This code generates a warning:
/*
[warn] scala-enums/src/test/scala/CaseObjectSpec.scala:48: match may not be exhaustive.
[warn] It would fail on the following inputs: Fri, Mon, Thu, Tue, Wed
[warn]       day match {
[warn]       ^
 */
a[MatchError] shouldBe thrownBy {
  day match {
    case Sat | Sun => "weekend"
  }
}
```

**✅ Java `Enum`**

```scala
val day = MON   // Default inferred type: WeekDay

// This code generates a warning:
/*
[warn] scala-enums/src/test/scala/JavaEnumSpec.scala:50: match may not be exhaustive.
[warn] It would fail on the following inputs: FRI, MON, THU, TUE, WED
[warn]       day match {
[warn]       ^
 */
a[MatchError] shouldBe thrownBy {
  day match {
    case SAT | SUN => "weekend"
  }
}
```

**Serialization: Each enum item has an associated “name” value**

**✅ `scala.Enumeration`**

```scala
Mon.toString shouldBe "Mon"
Sun.toString shouldBe "Sun"
```

**✅ `case object`**

```scala
Mon.toString shouldBe "Mon"
Sun.toString shouldBe "Sun"
```

**✅ Java `Enum`**

```scala
MON.toString shouldBe "MON"
SUN.toString shouldBe "SUN"
```

### Serialization: Instantiate an enum item from a “name” `String`

**✅ `scala.Enumeration`**

```scala
CustomEnum.withName("Foo").custom shouldBe "This is a foo"

WeekDay.withName("Mon") shouldBe Mon
the[NoSuchElementException] thrownBy WeekDay.withName("Oops") should have message "No value found for 'Oops'"
```

**⚠️ `case object`**

```scala
CustomEnum.withName("Foo").get.custom shouldBe "This is a foo"
CustomEnum.withName("Bar") shouldBe Some(Bar)
CustomEnum.withName("Oops") shouldBe None
```

**✅ Java `Enum`**

```scala
CustomEnum.valueOf("FOO").custom shouldBe "This is a foo"

WeekDay.valueOf("MON") shouldBe MON
the[IllegalArgumentException] thrownBy WeekDay.valueOf("Oops") should have message "No enum constant javaenum.WeekDay.Oops"
```

### Types: Items are instances of the enumeration, not separate classes

**✅ `scala.Enumeration`**

```scala
Mon shouldBe a[WeekDay.Value]
Sun shouldBe a[WeekDay.Value]
```

**⛔️ `case object`**

```scala
Mon shouldBe a[WeekDay]
Sun shouldBe a[WeekDay]
// but, also...
Mon shouldBe a[WeekDay.Mon.type]
Sun shouldBe a[WeekDay.Sun.type]
```

**✅ Java `Enum`**

```scala
MON shouldBe a[WeekDay]
SUN shouldBe a[WeekDay]
```

### Types: Has distinct type after type erasure (i.e. can be used for method overloading)

**⛔️ `scala.Enumeration`**

```scala
/*
[error] scala-enums/src/test/scala/ScalaEnumerationSpec.scala:74: double definition:
[error] def f(d: enumeration.CustomEnum.Value): String at line 73 and
[error] def f(d: enumeration.WeekDay.Value): String at line 74
[error] have same type after erasure: (d: Enumeration#Value)String
[error]   def f(d: enumeration.WeekDay.Value) = s"week $d"
[error]       ^
 */
"""
def f(d: enumeration.CustomEnum.Value) = s"custom: $d"
def f(d: enumeration.WeekDay.Value) = s"week: $d"
""" shouldNot typeCheck
```

**✅ `case object`**

```scala
def f(d: CustomEnum) = s"custom: $d"
def f(d: WeekDay) = s"week: $d"

f(Foo) shouldBe "custom: Foo"
f(Mon) shouldBe "week: Mon"
```

**✅ Java `Enum`**

```scala
def f(d: CustomEnum) = s"custom: $d"
def f(d: WeekDay) = s"week: $d"

f(FOO) shouldBe "custom: FOO"
f(MON) shouldBe "week: MON"
```

### Interop: Ease of use in mixed Scala/Java projects

**⚠️ `scala.Enumeration`**

```java
// file: InteropScalaEnumeration.java
```

Not much relevant if your project is mainly Scala but if you need to access Scala `Enumeration`s from Java code it gets a bit too cumbersome.

* Cannot import the enumeration items directly (i.e. wildcard import). They must be qualified by their container class.
* Hard to access field customizations, having to expose the internals (e.g. make `CustomEnumVal` public) to make them available to the Java code.
* Calling syntax `WeekDay.Mon().id()` doesn’t look like normal Java `Enum`s `WeekDay.MON.ordinal`.
* Mapping to native Java types (i.e. non-Scala ones) is not very straightforward.
* Cannot be used in `switch-case` statements like normal Java `Enum`s.
* Equally to Scala, only `Enumeration.Value` is available as a generic type for each enumeration item.

**⛔️ `case object`**

```java
// file: InteropCaseObjects.java
```

Clearly a Scala only approach. It’s get completely unusable to try  accessing and using these type of constructs from Java.

* Mapping to native Java types (i.e. non-Scala ones) is not very straightforward.
* Lots and lots of errors indicating it `Cannot find symbol` to the point of making it practically unusable.

**✅ Java `Enum`**

```scala
// file: InteropJavaEnum.scala
```
Apart from the *slight* annoyance of having to define the enumerations in a separate `.java` file (instead on having them in place or inside the `.scala` file where it makes more sense), and the usual wrapping of Java code needed to contain the `null`s and `Exception`s with the more well behaved `Try` or `Option`, the Java `Enum` is fairly straightforward to use inside Scala code.
