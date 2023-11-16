## Member functions

You can call public member functions from Swift. Internal or private declarations aren't visible.

### Explanations

Let's declare a simple class on the Kotlin code side:

```kotlin
class UsualClassFunction {
    
    fun someFunction() {
        // do something
    }
    
}
```

On the Swift side, we will get the same class with a function that matches the signature:

```swift
let myClass = UsualClassFunction()
myClass.someFunction()
```

---
[Table of contents](/README.md)