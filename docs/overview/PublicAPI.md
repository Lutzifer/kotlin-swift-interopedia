## Public API

Public classes, functions, and properties are visible from Swift. Marking classes, functions, and properties `internal` will exclude them from the public API of the shared code, and they will not be visible in Swift.

### Explanation

In Kotlin, public classes, functions, and properties form part of the public API of the common code, and are available in Swift.

```kotlin
class PublicClass {
    val publicProperty = "Swift can access public property"

    fun publicFun() {
        println("Swift can access public function")
    }
}
```

In Swift it is possible to call them:
```swift
print(PublicClass().publicProperty)
PublicClass().publicFun()
```

#### Protected

In Kotlin, you can mark members with the keyword `protected`. This means they have the same visibility as private members, but are also visible in subclasses.

Objective-C/Swift do not have this access control level, so it was decided to make protected members visible from these languages without requiring subclassing. Since this nuance can be confusing, making class members protected in the common code is discouraged.  

#### Internal

In Kotlin, you can mark classes, functions, and properties with the keyword `internal`. This means they are only visible within their compilation unit.

```kotlin
internal class InternalClass {
    internal fun internalFunction() {
    }

    internal val internalProperty = 1
}
```

This means that these classes, functions, and properties are not exported and therefore not available in Swift. This is a good way to limit the public API of the common code.

---
[Table of contents](/README.md)