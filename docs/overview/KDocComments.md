## KDoc comments

You can see certain KDoc comments at development time. In Xcode, use Option+Double left click to see the docs. Note that many KDocs features don't work in Xcode, like properties on constructors (@property) aren't visible. In Fleet, use the 'Show Documentation' action.

### Explanation

[It is possible to opt-in to export certain KDoc comments.](https://kotlinlang.org/docs/whatsnew1520.html#opt-in-export-of-kdoc-comments-to-generated-objective-c-headers) To do this, you need to enable comment generation in the shared module's build.gradle.kts file:

```kotlin
kotlin {
    targets.withType<org.jetbrains.kotlin.gradle.plugin.mpp.KotlinNativeTarget> {
        compilations["main"].kotlinOptions.freeCompilerArgs += "-Xexport-kdoc"  
    }
}
```

After that, on the XCode side, you can see comments on the class and methods in autocompletion. If you go to the definition of functions (in the .h file), you can see comments on @param / @return, etc.

Note: many KDoc features are not supported, such as @property.

---
[Table of contents](/README.md)