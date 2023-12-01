## Interop annotations - @ShouldRefineInSwift

Helps to replace a Kotlin declaration with a wrapper written in Swift. Experimental.

### Explanations

In Kotlin:
```kotlin
interface Person {
    @ShouldRefineInSwift
    val namePair: Pair<String, String>
}

class RealPerson: Person {
    override val namePair = "First" to "Last"
}
```

In Swift:
```swift
extension Person {
    var name: (firstName: String, lastName: String) {
        let namePair = __namePair
        return (namePair.first! as String, namePair.second! as String) 
    }
}

func shouldRefineInSwiftExample(){
    let authorNames = RealPerson().name
    print("Author is: \(authorNames.firstName) \(authorNames.lastName)")
}
```

Using the `@ShouldRefineInSwift` annotation, we are indicating that we intend to refine the definition of `namePair` in Swift. The annotation marks the property as swift_private in the generated Objective-C API. Such declarations get a __ prefix, which makes them invisible from Xcode’s autocomplete.


#### Setup

Since the annotation is experimental, it is necessary to opt-in.
```kotlin
sourceSets {
    all {
        languageSettings.optIn("kotlin.experimental.ExperimentalObjCRefinement")
    }
}
```

### Credits
With thanks to [Rick Clephas](https://github.com/rickclephas) for the annotation contribution and example code. 

---
[Table of contents](/README.md)