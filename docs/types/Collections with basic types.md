## Collections with basic types

Collections with elements of basic types (except String) require a wrapper.

### Explanations

Kotlin primitive types specified in generics [are turned into special wrappers](https://kotlinlang.org/docs/apple-framework.html#kotlin-numbers-and-nsnumber) over primitive types:

- `List<Byte>` -> `[KotlinByte]`
- `List<UByte>` -> `[KotlinUByte]`
- `List<Short>` -> `[KotlinShort]`
- `List<UShort>` -> `[KotlinUShort]`
- `List<Int>` -> `[KotlinInt]`
- `List<UInt>` -> `[KotlinUInt]`
- `List<Long>` -> `[KotlinLong]`
- `List<ULong>` -> `[KotlinULong]`
- `List<Float>` -> `[KotlinFloat]`
- `List<Double>` -> `[KotlinDouble]`
- `List<Boolean>` -> `[KotlinBoolean]`

There are two exceptions to this rule [(similar to optional primitive types)](/docs/types/Optional%20(nullable)%20basic%20types.md):

- `List<String>` -> `[String]`
- `List<Char>` -> `[Any]`

To pass Swift types (not literals) as arguments to a Kotlin function, you will have to write mappings:

```swift
CollectionWithPrimitiveTypesKt.intList(list: [1, 2, 3]) // ok
let result2: [KotlinInt] = [1, 2, 3] + CommonTypesKt.listType(list: [1, 3, 4]) // ok

// Mapping
let li2: [KotlinInt] = CommonTypesKt.listType(
    list: intList.map({ p in KotlinInt(value: Int32(p)) })
)
```

---
[Table of contents](/README.md)