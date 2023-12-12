## Collections

Kotlin and Swift have very similar kinds of collections and can be mapped between each other.

### Explanations

<table>
<thead><tr><th>Kotlin</th><th>Swift</th></tr></thead>
<tr><td>List</td><td>Array</td></tr>
<tr><td>MutableList</td><td>NSMutableArray</td></tr>
<tr><td>Array</td><td>KotlinArray</td></tr>
<tr><td>Set</td><td>Set</td></tr>
<tr><td>Map</td><td>Dictionary</td></tr>
<tr><td>MutableMap</td><td>NSMutableDictionary</td></tr>
</table>

In Kotlin:
```kotlin
fun getList(): List<Int> {
    return listOf(1,2,3)
}

fun getArray(): Array<Int> {
    return arrayOf(1,2,3)
}

fun getMap(): Map<String, Int> {
    return mapOf("a" to 1, "b" to 2)
}

fun getSet(): Set<Int> {
    return setOf(1,1,2)
}

fun set(collection: List<Int>){
    println(collection)
}
```

In Swift:
```swift
print(CollectionsKt.getList())
print(CollectionsKt.getArray())
print(CollectionsKt.getMap())
print(CollectionsKt.getSet())
CollectionsKt.set(collection: [1,2,3])
```

---
[Table of contents](/README.md)