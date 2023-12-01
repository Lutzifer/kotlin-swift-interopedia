## Interop annotation - @HiddenFromObjC

Hides a Kotlin declaration from Objective-C/Swift. Experimental.

### Explanations

In Kotlin:
```kotlin
@HiddenFromObjC
fun myKotlinOnlyFunction(){
    println("Only Kotlin!")
}
```

In Swift:
```swift
func hiddenFromObjCExample(){
    //Uncommenting gives compilation error
    //myKotlinOnlyFunction()
}
```

Using the `@HiddenFromObjC` annotation, we can prevent the export of this function to Objective-C/Swift. This is different from using the `internal` keyword, because the construct can still be used from other Kotlin compilation units, just not from Objective-C/Swift.

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