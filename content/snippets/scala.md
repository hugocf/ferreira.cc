---
date: 2019-02-28T01:04:49
lang: en
tags: [ scala, info, tips, tricks, how to ]
title: Scala
summary: Small information nuggets and recipies about Scala
showToc: true
tocOpen: true
---

* [The Scala Language Specification](http://www.scala-lang.org/files/archive/nightly/pdfs/ScalaReference.pdf)
* [Scala Style Guide - Scala Documentation](http://docs.scala-lang.org/style/)
* [Scalacheat - Scala Documentation](http://docs.scala-lang.org/cheatsheets/)

---

*(most recent on top)*

## Run a single ScalaTest spec

```scala
sbt 'testOnly *TestNameSpec -- -z "The full name of the test to run"'
```

## Manually request from Play’s Guice an injected class instance

```scala
import play.api.inject.NewInstanceInjector
val obj = NewInstanceInjector.instanceOf[AllowedHostsFilter]
```

## Handle spaces correctly in test files paths

* [Bug ID: JDK-4466485 getClass().getResource().getFile() returns file name with %20](http://bugs.java.com/bugdatabase/view_bug.do?bug_id=4466485)

```scala
- new File(getClass.getResource("/testTheme.zip").getFile)
+ new File(getClass.getResource("/testTheme.zip").toURI.getPath)
```

## Match `AnyVal` class instances with Mockito

* [Mockito matchers, scala value class and NullPointerException - Stack Overflow](https://stackoverflow.com/questions/27289757/mockito-matchers-scala-value-class-and-nullpointerexception)

```scala
case class Wrapper(value: String) extends AnyVal
```

*… set/check expectations*

```scala
when(mock.method(KubeName(anyString)) thenReturn "example"
verify(mock).method(KubeName(anyString))
```

*… capture arguments*

```scala
val wrapper: ArgumentCaptor[String] = forClass(classOf[String])
verify(mock).method(wrapper.capture().asInstanceOf[Wrapper])
wrapper.getValue shouldBe "example"
```

## Encode domain knowledge with value classes

```scala
case class Id(id: String) extends AnyVal
case class Email(email: String) extends AnyVal
case class Timestamp(ts: Long) extends AnyVal

def f(user: Id, sender: Email, when: Timestamp) = ???
```

## Algebraic Data Types (ADT)

* [Algrebraic Data Types in Scala | Scalera](https://scalerablog.wordpress.com/2016/10/03/algrebraic-data-types-in-scala/)

*… sum = `A` + `B` (meaning `A` or `B`; also called “co-product”)*

```scala
sealed trait Sum
case object A extends Sum
case object B extends Sum
```

*… product = `A` * `B` (meaning `A` and `B`)*

```scala
case class Product(foo: A, bar: B)
```

*… example: `Something` + `AnotherThing` * `SomethingElse`*

```scala
sealed trait Example
case object Something extends Example
case class Other(a: AnotherThing, e: SomethingElse) extends Example
```

## Pre and post conditions in Scala:

* [Scala Standard Library 2.12.2 - scala.Predef](http://www.scala-lang.org/api/current/scala/Predef$.html)
* [Scala preconditions (assert, assume, require, ensuring) | M@X on DEV](https://maxondev.com/scala-preconditions-assert-assume-require-ensuring/)
    - Useful for dynamically checking invariants, documentation, static code analysis
    - The real difference is only in the intent expressed

*
    ```scala
    assert ~> AssertionError
    ```

    - predicate which needs to be proven and a static checker can prove at compile time
    - if the condition fails, then a logical error was made within the code
    - elidable via `-Xdisable-assertions`

*
    ```scala
    assume ~> AssertionError
    ```

    - an axiom that a static checker can rely upon
    - elidable via `-Xdisable-assertions`
 
*
    ```scala
    require ~> IllegalArgumentException
    ```

    - a formal pre-condition
    - if the condition fails, then the caller of the function is to blame

*
    ```scala
    ensuring ~> AssertionError
    ```

    - a formal post-condition
    - a guarantee the function is provide with regards to its return value

## Dangers of catching `Throwable` in Scala

* *aka “Pokemon exceptions” (Gotta Catch 'Em All)*
* [Scala: Silently catch all exceptions - Stack Overflow](http://stackoverflow.com/a/21171104/1380781)
* [Catching Throwable in Scala | spiros.blog()](https://maxondev.com/scala-preconditions-assert-assume-require-ensuring/)

*… focus only on non fatal exceptions*

```scala
import scala.util.control.NonFatal
try { f(x) }
catch { case NonFatal(t) => }
```

*… if you really need it, at least propagate Scala’s usage of `Throwable` for control flow*

```scala
import scala.util.control.ControlThrowable
try { codeThatMayThrowThrowable() }
catch {
  case e: ControlThrowable => throw e
  case e => handleThrowable(e)
}
```

## Using execution contexts: Scala vs Play

* [scala - Play's internal execution context - Stack Overflow](http://stackoverflow.com/a/30806548/1380781)

*… use this, which uses an `ActorSystem`*

```scala
play.api.libs.concurrent.Execution.Implicits.defaultContext 
```

*… don’t use the default, which is a special `ForkJoinPool` (uses the `blocking` method to spawn new threads in the pool for potentially blocking code)*

```scala
scala.concurrent.ExecutionContext.Implicits.global 
```

## Useful compiler options

* [Useful Scala Compiler Options for Better Scala Development - DZone Java](https://dzone.com/articles/useful-scala-compiler-options-for-better-scala-dev)

```scala
scalacOptions ++= Seq(
  "-target:jvm-1.8",
  "-encoding", "UTF-8",
  "-unchecked",
  "-deprecation",
  "-Xfuture",
  "-Yno-adapted-args",
  "-Ywarn-dead-code",
  "-Ywarn-numeric-widen",
  "-Ywarn-value-discard",
  "-Ywarn-unused")
```

## Mockito verify says “no interactions” but debug steps just fine through the production code

* Check if you’re returning a `Future` and trying to verify before the `Future` completes
* Try to verify only after an `Await`, or inside `whenReady` or `eventually`

## ScalaTest pesky parenthesis

* [ScalaTest - Using matchers](http://www.scalatest.org/user_guide/using_matchers#thosePeskyParens)
* [ScalaTest Matchers Preview](https://www.artima.com/weblogs/viewpost.jsp?thread=246279#:~:text=should%20be%20(%27defined)-,Those%20pesky%20parens,-You%20may%20have)

## ScalaTest with ScalaCheck: Disable shrinking for type

* [Fun with scalatests PropertyChecks](http://blog.knutwalker.de/2014/01/fun-with-scalatests-propertychecks.html)
* [Add support for not shrinking values in GeneratorDrivenPropertyChecks · Issue #584 · scalatest/scalatest](https://github.com/scalatest/scalatest/issues/584#issuecomment-104003728)
* [Solutions to the ScalaCheck problem that shrinking failing values may generate invalid values](https://gist.github.com/davidallsopp/f65d73fea8b5e5165fc3)

```scala
implicit def noShrink[T]: Shrink[T] = Shrink.shrinkAny
```

## Convention to call methods or functions without parameters

* [Style Guide - Method Invocation - Scala Documentation](http://docs.scala-lang.org/style/method-invocation.html)

```scala
reply       // method has no side-effects (pure function)
reply()     // ordinary method call which might also have side-effects
```

## Desugar Scala’s syntax

* *e.g. for comprehension*
* [What’s in a Scala For Comprehension? | Craig Tataryn's .plan](http://tataryn.net/whats-in-a-scala-for-comprehension/)
* [syntactic sugar - Getting the desugared part of a Scala for/comprehension expression? - Stack Overflow](http://stackoverflow.com/a/9892350)

```scala
scala -print file.scala
```

```scala
# list of phases to use
scalac -Xshow-phases

# use `typer` phase to remove syntactic sugar
scala -Xprint:typer -e "for (i <- 0 to 100) yield i"
```

### for comprehension desugared

* [Scala's "for comprehension" with futures # Answer](http://stackoverflow.com/a/19046133/1380781)
* [Faq - How does yield work? - Scala Documentation](http://docs.scala-lang.org/tutorials/FAQ/yield.html)

*… `<-` desugars to `flatMAp`, e.g.*

```scala
for {
   r1 <- result1
   r2 <- result2
   r3 <- result3
} yield (r1+r2+r3)
```

*… converts into*

```scala
result1.flatMap(r1 => 
    result2.flatMap(r2 => 
        result3.map(r3 => r1 + r2 + r3)))
```

## Parallel vs sequential computation with Futures

* [Scala's "for comprehension" with futures # Answer](http://stackoverflow.com/a/19046133/1380781)

*… parallel computation before aggregation*

```scala
val result1 = future(...)
val result2 = future(...)
val res = for {
   r1 <- result1
   r2 <- result2
} yield (r1+r2)
```

*… sequential computation and aggregation*

```scala
val res = for {
   r1 <- future(...)
   r2 <- future(...)
} yield (r1+r2)
```
