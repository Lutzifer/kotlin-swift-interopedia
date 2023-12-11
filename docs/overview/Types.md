## Types

Simple types and custom types can be passed as arguments and returned from function calls.

### Explanations

Simple types are types such as Strings and primitives (like numbers, booleans, and characters). Simple types and custom types can be passed as arguments and returned from function calls. This topic is further expanded in the [Types](/README.md#types) section.

In Kotlin:
```kotlin
fun printInt(intType: Int): Int{
    println("Int type: $intType")
    return intType
}

fun printString(stringType: String): String{
    println("String type: $stringType")
    return stringType
}

data class CustomType(val name: String, val surname: String)

fun printCustomType(customType: CustomType): CustomType{
    println("Custom type: $customType")
    return customType
}
```

In Swift:
```swift
let intType = TypesKt.printInt(intType: 123)
let stringType = TypesKt.printString(stringType: "abc")
let customType = TypesKt.printCustomType(customType: CustomType(name: "Author name", surname: "Author surname"))
```
---
[Table of contents](/README.md)