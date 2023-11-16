## Constructors with default arguments

You always have to specify all the arguments for a constructor.

### Explanations

In Kotlin, you can omit specifying the values of constructor fields if they have default values:

```kotlin
class ConstructorWithDefaultArgumentsClass(
    val param1: String,
    val param2: Int = 300,
    val param3: Boolean = false
)

fun constructorWithDefaultArgumentsExample() {
    ConstructorWithDefaultArgumentsClass(param1 = "123")
}
```

After switching to Swift, this feature disappears, and all arguments must be specified when initializing an object:

```swift
ConstructorWithDefaultArgumentsClass(param1: "123", param2: 500, param3: false)
```

---
[Table of contents](/README.md)