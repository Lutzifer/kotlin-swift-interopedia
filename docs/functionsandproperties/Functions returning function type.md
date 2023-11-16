## Functions returning function type

You can call a Kotlin function returning a lambda. The result has Swift function type, like `() -> String`, so you can easily call it.

### Explanations

Let's describe a function that returns some kind of lambda in Kotlin:

```kotlin
// FunctionReturnsLambda.kt

fun returnLambda(): () -> Unit {
    println("Function that returns lambda")

    return {
        println("Lambda inside return")
    }
}

fun returnParametrizedLambda(): (String) -> Unit {
    println("Function that returns parametrized lambda")

    return {
        println("returnParametrizedLambda | it: $it")
    }
}

class FunctionReturnsLambdaExample() {
    fun example() {
        returnLambda()()
        returnParametrizedLambda()("123")
        println("FunctionReturnsLambdaExample: All ok")
    }
}
```

On the Swift side, this works correctly:

```swift
FunctionReturnsLambdaKt.returnLambda()()
FunctionReturnsLambdaKt.returnParametrizedLambda()("123")
```

---
[Table of contents](/README.md)