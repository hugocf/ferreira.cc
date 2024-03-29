---
date: 2015-11-02T01:03:51
lang: en
tags: [ java, info, tips, tricks, how to ]
title: Java
summary: Small information nuggets and recipies about Java
showToc: true
tocOpen: true
---

*(most recent on top)*

## OS X Installation of multiple Java versions

* [Running Multiple Java & JDKs on OS X | Technical Series](http://kevinallenrodriguez.com/blog/properly-installing-managing-multiple-java-versions-on-os-x/)
* [Jenv not setting JAVA_HOME · Issue #44 · gcuisinier/jenv · GitHub](https://github.com/gcuisinier/jenv/issues/44)

*... basic installation*

```shell
brew tap caskroom/cask
brew install Caskroom/cask/java
```

*... environment management*

```shell
brew install jenv
```

```shell
# .bash_profile
export JENV_ROOT=/usr/local/var/jenv
if which jenv > /dev/null; then eval "$(jenv init -)"; fi
```

*... add installed versions*

```shell
jenv add /Library/Java/JavaVirtualMachines/jdk1.7.0_71.jdk/Contents/Home/
jenv add /Library/Java/JavaVirtualMachines/jdk1.8.0_66.jdk/Contents/Home/
```

*... no `JAVA_HOME` with `jenv`*

```shell
jenv enable-plugin sbt
```

## Java 8 new language features

* [**What's New in JDK 8**](http://www.oracle.com/technetwork/java/javase/8-whats-new-2157071.html)
* [Java 8 Tutorial](http://winterbe.com/posts/2014/03/16/java-8-tutorial/)

> * Default Methods for theerfaces
> * Lambda expressions
> * Functional Interfaces
> * Method and Constructor References
> * Lambda Scopes
> * Built-in Functional Interfaces
> * Streams
> * Parallel Streams
> * Map
> * Date API
> * Annotations

## Java 7 new language features

* [**Java SE 7 Features and Enhancements**](http://www.oracle.com/technetwork/java/javase/jdk7-relnotes-418459.html)
* [A look at Java 7's new features - O'Reilly Radar](http://radar.oreilly.com/2011/09/java7-features.html)
* [New Java 7 Language Features | Javalobby](http://java.dzone.com/articles/new-java-7-language-features)

> * Diamond Operator
> * Using strings in switch statements
> * Automatic resource management
> * Numeric literals with underscores
> * Improved exception handling
> * Working with Path
> * File change notifications

## Java 6 new language features

* [**Java SE 6 Features and Enhancements**](http://www.oracle.com/technetwork/java/javase/features-141434.html)
* [Java 6.0 New Features, Part 1 : Introduction[ ]{.Apple-converted-space}](http://www.javabeat.net/introduction-to-java-6-0-new-features-part-i/)
* [Java 6.0 New Features, Part 2 : Pluggable Annotation Processing API](http://www.javabeat.net/java-6-0-features-part-2-pluggable-annotation-processing-api/)
* [The Java 6.0 Compiler API](http://www.javabeat.net/the-java-6-0-compiler-api/)

> * Common Annotations
> * Scripting Language for the Java Platform
> * Pluggable Annotation Processing API
> * Streaming API for XML
> * Compiler API

## Java 5 new language features

* [**J2SE(TM) 5.0 New Features**](http://docs.oracle.com/javase/1.5.0/docs/relnotes/features.html)
* [What's New in Java 1.5?](http://www.cs.indiana.edu/classes/jett/sstamm/)

> * Generics
> * For/in loop
> * Autoboxing/Unboxing
> * Typesafe Enums
> * Varargs
> * Static Import
> * Annotations (Metadata)
