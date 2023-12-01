## Interop annotations - @ObjCName

[@ObjCName](https://kotlinlang.org/api/latest/jvm/stdlib/kotlin.native/-obj-c-name/) gives better Objective-C/Swift names to Kotlin constructs like classes, functions and so on, without actually renaming the Kotlin constructs. Experimental.

### Explanations

In Kotlin:
```kotlin
@ObjCName(swiftName = "MySwiftArray")
class MyKotlinArray {
    @ObjCName("index")
    fun indexOf(@ObjCName("of") element: String): Int = 1
}
```

In Swift:
```swift
let array = MySwiftArray()
let index = array.index(of: "element")
```

Here we are renaming a class, function, and its parameter using the `@ObjCName` annotation so that we can use the alternative names from Objective-C/Swift. This is especially useful to change the Swift names of constructs to more idiomatic names without actually renaming them in Kotlin.

#### Setup

Since the annotation is experimental, it is necessary to opt-in.
```kotlin
sourceSets {
    all {
        languageSettings.optIn("kotlin.experimental.ExperimentalObjCName")
    }
}
```

### Credits
With thanks to [Rick Clephas](https://github.com/rickclephas) for the annotation contribution and example code. 

---
[Table of contents](/README.md)