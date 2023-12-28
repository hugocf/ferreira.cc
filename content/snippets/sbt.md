---
date: 2019-01-31
lang: en
tags: [ sbt, info, tips, tricks, how to ]
title: sbt
summary: Small information nuggets and recipies about sbt
showToc: true
tocOpen: true
---

* `commandName` == `command-name`

---

*(most recent on top)*

## Cross compile and publish local library

* [Label "org.label-schema.vcs-url" is missing · Issue #2 · rubendg/sbt-docker-label-schema](https://github.com/rubendg/sbt-docker-label-schema/issues/2#issuecomment-369343643)

```scala
sbt ^publishLocal
```

## Download SBT sources

* [scala - SBT sources in IDEA - Stack Overflow](http://stackoverflow.com/questions/17127367/sbt-sources-in-idea/17127380#17127380)

```scala
sbt updateClassifiers         // download sources and docs for all libs
sbt updateSbtClassifiers      // downloads sources and docs for sbt
```

## Run console with test libraries loaded

* [Importing test classes into Scala console in sbt? - Stack Overflow](http://stackoverflow.com/a/17031710)

```scala
run test:console
```

## Run sbt in debug mode

* [scala - Can log level be changed from command line? - Stack Overflow](http://stackoverflow.com/a/20745802/1380781)

```scala
sbt --debug
```

## Using sbt offline, to avoid dependency resolution failure

* [Martin Gladdish on Twitter #scala #sbt #toptip"](https://twitter.com/mgladdish/status/717749165757972480)

```scala
set offline := true
```

## Run tests with coverage

*... there is also a separate "Run with Coverage" button in IntelliJ IDEA*

```scala
sbt coverage test
```

## Visualize library dependencies

* [GitHub - jrudolph/sbt-dependency-graph: sbt plugin to create a dependency graph for your project](https://github.com/jrudolph/sbt-dependency-graph)

*... `~/.sbt/0.13/plugins/plugins.sbt`*

```scala
addSbtPlugin("net.virtual-void" % "sbt-dependency-graph" % "0.9.1")
```

*... commands*

```scala
sbt dependencyTree
sbt dependencyBrowseGraph
sbt "whatDependsOn com.example library-name 0.0.0"
```

## Publish library changes locally

```scala
sbt publishLocal
```

## Run command via proxy

```scala
sbt -Dhttp.proxyHost=localhost -Dhttp.proxyPort=8888 "~run 9000"
```

## Run command opening a port to debug

*... from the command line*

```scala
sbt -jvm-debug 5005 "~run 9400"
```

*... form IntelliJ IDEA (Run/Debug Configuration)*

* Edit Configurations... ➤ Remote ➤ Port = 5005

## Run command continually

*... put a tilde in front of it*

```scala
sbt ~compile
sbt ~test
sbt ~testQuick
```

## Run only the tests that have failed

```scala
sbt testQuick
```

## Run only a single test

```scala
sbt 'testOnly *TestSpec -- -z "name of the spec"'
sbt "testOnly name.spaced.TestSpec -- pattern"
sbt "it:testOnly name.spaced.TestSpec -- pattern"
```
