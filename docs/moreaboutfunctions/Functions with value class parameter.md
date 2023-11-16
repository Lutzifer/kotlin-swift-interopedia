## Functions with value class parameter

The function appears in the .h file, but the inline class argument is turned into a basic type.

### Explanations

Let's describe a function that takes a value class as input:

```kotlin
//FunctionWithValueClassParameter.kt

@JvmInline
value class ValueClassExample(val t: Int)

fun valueClassUsageExample(v: ValueClassExample): String {
    return "Value class usage example | ${v.t}"
}
```

On the Swift side, the function `valueClassUsageExample` is present, but since [the value class itself is not included in the .h file](/docs/classesandinterfaces/Inline%20classes.md), the argument is expanded into separate primitives:

```swift
//Type of v is Int32
FunctionWithValueClassParameterKt.valueClassUsageExample(v: 40)
```

---
[Table of contents](/README.md)