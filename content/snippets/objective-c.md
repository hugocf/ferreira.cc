---
aliases:
  - objc
date: 2014-03-01T01:05:12Z
lang: en
tags: [ objc, info, tips, tricks, how to ]
title: Objective-C
summary: Small information nuggets and recipies about Objective-C
showToc: true
tocOpen: true
---

*(most recent on top)*

## Don’t refer to your own class by name

* *… because you don’t know what the concrete class will be*
* [How to Botch Your Objective-C Factory Method - Quality Coding](http://qualitycoding.org/factory-method/)

```objc
self                              // From a class method
[self class]                      // From an instance method
```

## Method `-description` is normally used as an internal text representation

* *i.e. for debugging*
* [Overriding NSObject’s description | Dr John Wordsworth](http://www.johnwordsworth.com/2011/01/overriding-nsobjects-description/)
* [Auto Description Category for NSObject (any object) | At Kit](http://atkit.com/dev/objective-c/auto-description-category-nsobject-object/)

```objc
-(NSString *)description
{
  return [NSString stringWithFormat:@"<GameObject: %@, Position: %f, %f>",
                 [self objectID], [self position].x, [self position].y];
}
```

## Enable test feature from a command line argument

* [Reader Submissions - New Year's 2014 : NSHipster](http://nshipster.com/new-years-2014/)

*… this is useful for debugging development builds with the command line argument*

```objc
-TestFeatureEnabled YES
[[NSUserDefaults standardUserDefaults] boolForKey:@"TestFeatureEnabled"]
```

## Default values with GNU-style ternary operator

* [Reader Submissions - New Year's 2014 : NSHipster](http://nshipster.com/new-years-2014/)

```objc
NSLog(@"%@", @"a" ?: @"b");       // => @"a"
NSLog(@"%@", nil ?: @"b");        // => @"b"
```

## Manipulating collections using blocks

* [BlocksKit/BlocksKit/Core/NSArray+BlocksKit.m at master · BlocksKit/BlocksKit](https://github.com/BlocksKit/BlocksKit/blob/5267135/BlocksKit/Core/NSArray%2BBlocksKit.m#L4)
* [[BlocksKit][1] is a framework for OS X Lion and newer and a static library for iOS 5 and newer. | LinkedIn](http://www.linkedin.com/groups/BlocksKit-1-is-framework-OS-3724464%2ES%2E266743053)

## Declaring instance variables (ivars)

```objc
@interface ClassName : NSObject {
    int ivar1;  // @protected by default; could use @private (legacy) or @public (bad practice)
}
@end
@implementation ClassName () {
    int ivar2;  // @private by default; can change to @protected
}
@end
@implementation ClassName {
    int ivar3;  // @private by definition; other visibility keywords are ignored
}
@end
```

## Assertions & Release builds

* [NSAssertionHandler : NSHipster](http://nshipster.com/nsassertionhandler/)
* [Expanded use of Asserts - Krzysztof Zabłocki](http://www.merowing.info/2013/07/expanded-use-of-asserts/)
* [The Art of Assertion (as it pertains to Xcode) | Learn & Master Cocos2D Game Development](http://www.learn-cocos2d.com/2010/11/art-assertion-pertains-xcode/)

`NSAssert()` is disabled if the preprocessor macro  
`NS_BLOCK_ASSERTIONS` is defined for Release builds ([defaults change per Xcode version](http://stackoverflow.com/a/6445429))

## Naming private & addition methods to avoid naming conflicts

* [Coding Guidelines for Cocoa: Naming Methods](https://developer.apple.com/library/mac/documentation/Cocoa/Conceptual/CodingGuidelines/Articles/NamingMethods.html#//apple_ref/doc/uid/20001282-1003829-BCIBDJCA)
* [Programming with Objective-C: Customizing Existing Classes](https://developer.apple.com/library/ios/documentation/cocoa/conceptual/ProgrammingWithObjectiveC/CustomizingExistingClasses/CustomizingExistingClasses.html#//apple_ref/doc/uid/TP40011210-CH6-SW4)

```objc
- (void)pfx_myMethodName;
```

## Check if running under unit tests

* [Check for Unit-Tests in Objective-C](http://blog.nicolai86.eu/posts/2012-12-01/check-for-unit-tests-in-obj-c/)

```objc
BOOL runningTests = NSClassFromString(@"XCTest") != nil;
```

## Annotate intentional fall-through between switch labels

* *aka “follow-through”*
* [Clang Language Extensions — Clang 3.4 documentation](http://clang.llvm.org/docs/LanguageExtensions.html#non-standard-c-11-attributes)
* [LLVM Project Blog: Clang Warnings](http://blog.llvm.org/2013/09/clang-warnings.html)
    - `-Wimplicit-fallthrough` — Enabling this warning will cause a diagnostic to be emitted for all fallthroughs in switch statements that have not been annotated. Requires compilation in C++11 mode. Clang-specific warning, available in the 3.2 release.

```objc
[[clang::fallthrough]]
```

## Using meta information in NSLog

* [objective c - How to print out the method name and line number and conditionally disable NSLog? - Stack Overflow](http://stackoverflow.com/questions/969130/how-to-print-out-the-method-name-and-line-number-and-conditionally-disable-nslog)
* [Technical Q&A QA1669: Improved logging in Objective-C](https://developer.apple.com/library/ios/qa/qa1669/_index.html)

```objc
NSLog(@"%d", ...)
__LINE__             // Current line number in the source code file
```

```objc
NSLog(@"%s", ...)
__func__             // Current function signature
__PRETTY_FUNCTION__  // Like __func__, but includes verbose type information in C++ code
__FILE__             // Full path to the source code file
```

```objc
NSLog(@"%@", ...)
NSStringFromSelector(_cmd)      // Name of the current selector
NSStringFromClass([self class]) // Name of the current object's class
[NSThread callStackSymbols]     // NSArray of the current stack trace as programmer-readable strings
[[NSString stringWithUTF8String:__FILE__] lastPathComponent] // Name of the source code file
```

## Return values from code blocks

* [cocoa-dom - New thing I do in code](http://cocoa-dom.tumblr.com/post/56517731293/new-thing-i-do-in-code)
* [Statement Exprs - Using the GNU Compiler Collection (GCC)](http://gcc.gnu.org/onlinedocs/gcc/Statement-Exprs.html)

```objc
self.bounds = ({
	CGRect bounds = self.bounds;
	bounds.size.height = self.currentYPosition + SHEETINSETY;
	bounds;
});
```

* [Macoscope Blog | Calling Blocks Inline](http://macoscope.com/blog/calling-blocks-inline/)

```objc
const BOOL anyValueIsXyz = (^{
  for (QwertyValue *value in values) {
    if (value.isXyz) {
      return YES;
    }
  }
  return NO;
}());
```

## Define enums and bitmasks

* [iamthewalr.us : NS_ENUM and NS_OPTIONS](http://iamthewalr.us/blog/2012/11/ns_enum-and-ns_options/#comment-44164)
* [NS_ENUM & NS_OPTIONS : NSHipster](http://nshipster.com/ns_enum-ns_options/)

```objc
typedef NS_ENUM(NSInteger, PFXEnumName) {
    PFXEnumNameValueA,
    PFXEnumNameValueB
};

typedef NS_OPTIONS(NSUInteger, PFXEnumName) {
    PFXEnumNameValueA = 0,
    PFXEnumNameValueB = 1 << 0,
    PFXEnumNameValueC = 1 << 1,
    PFXEnumNameValueD = 1 << 2
};
```

*… usage*

```objc
PFXEnumNameValueA | PFXEnumNameValueC
```

## Boxed enums: converting a standard enum to an integer type, and boxing the value accordingly.

* [Objective-C Literals — Clang 3.4 documentation](http://clang.llvm.org/docs/ObjectiveCLiterals.html#boxed-enums)

```objc
@(SomeStandardEnumValue)          // boxing
[boxedNum nativeTypeValue]        // unboxing
```

## Iterate through an enum…

*… fragile pattern; assumes too much: incremental values only, no gaps numeric order, count must be the last element, etc.* ⚠️

```objc
typedef NS_ENUM(NSInteger, PFXEnumName) {
    PFXEnumNameValueA,
    PFXEnumNameValueB,
    PFX_ENUM_NAME_COUNT
};

for (int i = 0; i < PFX_ENUM_NAME_COUNT; i++) {
    NSLog(@"%@", (i == PFXEnumNameValueA)? @"got the element" : @"nope, not yet");
}
```

## Random number generator

```objc
// random int between [0..upper_bound[
arc4random_uniform(upper_bound);
```

## Constants declaration

* [C Storage Classes : NSHipster](http://nshipster.com/c-storage-classes/)
* [Objective-C static, extern, public variables - Stack Overflow](http://stackoverflow.com/a/7642561/1380781)
* [Difference between external variable of some sort and static variable - Stack Overflow](http://stackoverflow.com/a/8832880/1380781)

*… within the same translation unit (i.e. current source being compiled + all the included headers)*

```objc
// file.m
static NSString * const PFXExampleConstantA = @"value";
static const int PFXExampleConstantB = 1;
```

*… globally available to all*

```objc
// file.h
extern NSString * const PFXExampleConstantA;
// file.m
NSString * const PFXExampleConstantA = @"value";
```

* [mikeash.com: Friday Q&A 2011-08-19: Namespaced Constants and Functions](http://www.mikeash.com/pyblog/friday-qa-2011-08-19-namespaced-constants-and-functions.html)

```objc
// file.h
extern const struct PFXExampleConstantsStruct
{
    NSString *constantA;
    int constantB;
    struct
    {
        NSString *constantC;
        NSString *constantD;
    } scope;
} PFXExampleConstants;
// file.m
const struct PFXExampleConstantsStruct PFXExampleConstants = {
    .constantA = @"value",
    .constantB = 1,
    .scope = {
        .constantC = @"valueC",
        .constantD = @"valueD"
    }
};
// usage
(void)PFXExampleConstants.scope.constantC
```

## Singletons with a thread-safe pattern

* [Cocoa Samurai: Singletons: You're doing them wrong](http://cocoasamurai.blogspot.pt/2011/04/singletons-your-doing-them-wrong.html)
* [Fundamental iOS design patterns: SharedInstance (Singleton in Objective C) | DaveOnCode](http://www.daveoncode.com/2011/12/19/fundamental-ios-design-patterns-sharedinstance-singleton-objective-c/)
* [Singletons in Objective-C - Matt Galloway](http://www.galloway.me.uk/tutorials/singleton-classes/)

*… using Grand Central Dispatch*

```objc
+ (instancetype)shared<#ClassName#> {
   static id sharedInstance = nil;
   static dispatch_once_t token;
   dispatch_once(&token, ^{
      sharedInstance = [[self alloc] init];
   });
   return sharedInstance;
}
```

## Custom warning and error directives

* [Idle Time » Blog Archive » Warnings I turn on, and why](http://boredzo.org/blog/archives/2009-11-07/warnings)

```objc
#warning pay attention to this
#error continue here…
```

## Suppress specific warnings in code

* [Clang Compiler User’s Manual — Clang 3.4 documentation](http://clang.llvm.org/docs/UsersManual.html#controlling-diagnostics-via-pragmas)

```objective-c
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wwarning-type"
#pragma clang diagnostic ignored "-Wanother-warning"
// …
#pragma clang diagnostic pop
```

## Temporarily silence unused variables warning

* [Which is the best way to suppress "unused variable" warning - Stack Overflow](http://stackoverflow.com/questions/17622237/which-is-the-best-way-to-suppress-unused-variable-warning)

```objc
__unused int someVar;
(void)someVar;
#pragma unused (someVar, anotherVar)
```

## Xcode custom build phases

* [Deallocated Objects - Show TODO's And FIXME's As Warnings In Xcode 4](http://deallocatedobjects.com/posts/show-todos-and-fixmes-as-warnings-in-xcode-4)

*… TODO & FIXME comments as warnings*

```objc
KEYWORDS="TODO:|FIXME:|\?\?\?:|\!\!\!:"
find "${SRCROOT}" \( -name "*.h" -or -name "*.m" \) -print0 | xargs -0 egrep --with-filename --line-number --only-matching "($KEYWORDS).*\$" | perl -p -e "s/($KEYWORDS)/ warning: \$1/"
```

… show test coverage report

```objc
open -g -a Xcoverage.app "$OBJECT_FILE_DIR-normal/$CURRENT_ARCH" >/dev/null 2>&1 || true
```
