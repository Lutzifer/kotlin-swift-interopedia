## Classes and functions

You can instantiate Kotlin classes and call Kotlin functions from Swift: `SimpleClass().simpleFunction()`.

### Explanations

In Kotlin:

```kotlin
class SimpleKotlinClass {
    fun simpleKotlinFunction(): String {
        return "Kotlin member function in Kotlin class returning String value"
    }
}
```

In Swift:

```swift
print(SimpleKotlinClass().simpleKotlinFunction())
```

---
[Table of contents](/README.md)