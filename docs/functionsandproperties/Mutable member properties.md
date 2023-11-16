## Mutable member properties

Member var property is accessible from Swift and is a mutable property in Swift.

### Explanations

Let's declare a simple class on the Kotlin code side:

```kotlin
class UsualClassPropertyMutable(
    var param: String
) {

    var property: String = "123"
}
```

On the Swift side, we can access both the fields declared in the constructor and the properties declared inside the class; the properties are mutable:

```swift
let myClass = UsualClassPropertyMutable(param: "123")
        
myClass.param = "467"
myClass.property = "775"
```

---
[Table of contents](/README.md)