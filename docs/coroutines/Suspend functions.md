## Suspend functions

Translated into callback, experimentally - into async / await. Libraries like SKIE and KMP-NativeCoroutines can be used to improve the interop and provide cancellation support.

### Explanations

Let's describe a class that uses Kotlin `suspend` functions:

```kotlin
data class Thing(val item: Int)

class ThingRepository {
    suspend fun getThing(succeed: Boolean): Thing {
        delay(100.milliseconds)
        if (succeed) {
            return Thing(0)
        } else {
            error("oh no!")
        }
    }
}
```

On the Swift side, the suspend function [turns into a completion handler](https://kotlinlang.org/docs/native-objc-interop.html#suspending-functions).

```swift
ThingRepository().getThing(succeed: true, completionHandler: { thing, error in
    // do something
})
```

With Swift 5.5, [an experimental opportunity has appeared to map suspend functions as async/await](https://kotlinlang.org/docs/whatsnew1530.html#experimental-interoperability-with-swift-5-5-async-await).

```swift
Task {
    do {
        let thing = try await ThingRepository().getThingSimple(succeed: true)
        print("Thing is \(thing).")
    }
    catch {
        print("Found error: \(error)")
    }
}
```

### Cancellation

However, neither these approaches have cancellation support. Even if the Task is cancelled, nothing happens. The suspend function will return as usual.

```swift
Task {
    do {
        let thing = try await ThingRepository().getThingSimple(succeed: true)
        print("Thing is \(thing).") // This will be printed: Thing is Thing(name=Thing).
    }
    catch {
        print("Found error: \(error)")
    }
}.cancel() // Just a stub
```

## KMP-NativeCoroutines
[KMP-NativeCoroutines](https://github.com/rickclephas/KMP-NativeCoroutines) is a library that can improve the interop and provides cancellation support. It is compatible with async/await, Combine, and RxSwift approaches to concurrency on iOS.

In Kotlin it is:
```kotlin
@NativeCoroutines
suspend fun getThing(succeed: Boolean): Thing {
    delay(100.milliseconds)
    if (succeed) {
        return Thing(0)
    } else {
        error("oh no!")
    }
}
```

In Swift:
```swift
Task {
    do {
        let result = try await asyncFunction(for: ThingRepository().getThing(succeed: true))
        print("Got result: \(result)")
    } catch {
        print("Failed with error: \(error)")
    }
}
```

Please follow [the setup instructions](https://github.com/rickclephas/KMP-NativeCoroutines#installation) in the KMP-NativeCoroutines documentation for the Gradle setup instructions.

### Cancellation

In Swift:
```swift
Task {
    do {
        let result = try await asyncFunction(for: ThingRepository().getThing(succeed: true))
        print("Got result: \(result)")
    } catch {
        print("Failed with error: \(error)")
    }
}.cancel()
```

This will cause the suspend function to fail with a CancellationError.

## SKIE
SKIE is also improves the interop and provides cancellation support. SKIE is directly compatible with async/await, and with Combine and RxSwift using adapters. 

In Kotlin it is the same as the original:

```kotlin
suspend fun getThing(succeed: Boolean): Thing {
    delay(100.milliseconds)
    if (succeed) {
        return Thing(0)
    } else {
        error("oh no!")
    }
}
```

In Swift:
```swift
Task {
    let result = try await ThingRepository().getThing(succeed: true)
    print("Got result: \(result)")
}
```

Please follow [the setup instructions](https://skie.touchlab.co/Installation) in the SKIE documentation for the Gradle setup instructions.

### Cancellation

In Swift:
```swift
Task {
    let result = try await ThingRepository().getThing(succeed: true)
    print("Got result: \(result)")
}.cancel()
```

The Task is cancelled and nothing is printed.

---
[Table of contents](/README.md)