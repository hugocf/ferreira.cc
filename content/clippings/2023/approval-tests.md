---
date: 2023-11-06T03:53:37
lang: en
tags: [ tools, software, development, unit testing, snapshots, libraries ]
title: Approval Tests
type: link
via: "[Emily Bache](https://www.youtube.com/watch?v=zyM2Ep28ED8)"
---

[Approval Tests - Home](https://approvaltests.com/)

> Unit testing asserts can be difficult to use. Approval tests simplify this by taking a snapshot of the results, and confirming that they have not changed.

Interesting approach to testing [using Combination Approvals](https://youtu.be/zyM2Ep28ED8?t=484&si=O3cw60wFKt0GgivG):

```java
@Test
public void upateQuality() throws Exception {
    CombinationApprovals.verifyAllCombinations(
        this::doUpdateQuality,
        new String []{"foo", "bar", "baz"},
        new Integer []{-1, 0, 11},
        new Integer[0, 1, 49, 50});    
}

private String doUpdateQuality(String name, int sellIn, int quality) { /*...*/ }
```

> Approval Tests has a variety of implementations on a wide range of platforms. You can browse all of the projects at our [GitHub Org](https://github.com/approvals)
>
> ⚠️ some of these are in various stages of 🚧
>
> * [.Net](https://github.com/approvals/ApprovalTests.Net)
> * [C++](https://github.com/approvals/CppApprovals)
> * [Java](https://github.com/approvals/ApprovalTests.Java)
> * [Lua](https://github.com/approvals/ApprovalTests.lua)
> * [NodeJS](https://github.com/approvals/Approvals.NodeJS)
> * [Objective-C](https://github.com/approvals/ApprovalTests.Objective-C)
> * [Perl](https://github.com/approvals/ApprovalTests.perl)
> * [Python](https://github.com/approvals/ApprovalTests.Python)
