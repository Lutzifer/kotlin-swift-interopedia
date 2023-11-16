## Abstract classes

Xcode has no hints to override abstract methods, rather we get a crash when trying to use the method during runtime.

### Explanations

Let's describe a simple abstract class in Kotlin:

```kotlin
abstract class AbstractClass(
    val param1: String
) {
    abstract fun forOverride(): String
}
```

In Swift code, we can inherit from this class, but Xcode does not tell us that the function forOverride needs to be overridden.

```swift
class ConcreteClass : AbstractClass {

    // You don't have to override the forOverride method, the code will
    // compile successfully
    
}
```

When trying to use this function, the application will crash with NSGenericException.

[Objective-C doesn't seem to have the concept of abstract class](https://stackoverflow.com/questions/1034373/creating-an-abstract-class-in-objective-c), and [neither does Swift](https://stackoverflow.com/questions/24110396/abstract-classes-in-swift-language).

It makes sense to avoid abstract classes, something along the lines of "prefer composition over inheritance", but after Java, this can be awkward.

The closest concept to an abstract class in Swift is `@protocol`. On top of the protocol, you can describe extensions, you can describe default implementations of functions. It will be about the same as the abstract class.

---
[Table of contents](/README.md)