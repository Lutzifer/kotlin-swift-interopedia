## Read-only member properties

Member val property is accessible from Swift and is a read-only property in Swift.

### Explanations

Let's declare a simple class on the Kotlin code side:

```kotlin
class UsualClassValProperty(
    val param: String
) {
    
    val property: String get() = "123"
    
}
```

On the Swift side, we can access both the fields declared in the constructor and the properties declared inside the class:

```swift
let myClass = UsualClassValProperty(param: "123")

let _ = myClass.param
let _ = myClass.property
```

---
[Table of contents](/README.md)