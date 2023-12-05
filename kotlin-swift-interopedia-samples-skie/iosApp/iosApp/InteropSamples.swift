import Foundation
import shared

struct InteropSection: Identifiable {
    let id = UUID()
    let title: String
    let samples: [InteropSample]
}

struct InteropSample: Identifiable {
    let id = UUID()
    let title: String
    var description: String = ""
    let action: @MainActor () -> ()
}

let outputMarker = "Sample output: "
let printedToConsoleNote = "Sample output is printed to the console."

func sections() -> [InteropSection] {
    [moreAboutFunctionsSection(),
     classesAndInterfacesSection(),
     coroutinesSection()]
}

func classesAndInterfacesSection() -> InteropSection {
    InteropSection(title: "Classes and interfaces", samples: [
        InteropSample(
            title: "Enum classes",
            description: "No equivalent enum is generated on the Swift side, and default case must be specified in a switch expression. Instead an object with static elements is generated. Improved interop available with SKIE."
        ) {
            enumClassesExample()
        },
        InteropSample(
            title: "Sealed classes",
            description: "A class with heirs is generated. Passing to a switch statement requires a default case. Improved interop available with SKIE."
        ) {
            sealedClassesExample()
        },
        InteropSample(
            title: "Sealed Interfaces",
            description: "Separate protocols were generated that were not related to each other."
        ) {
            sealedInterfacesExample()
        }
    ])
}

func moreAboutFunctionsSection() -> InteropSection {
    InteropSection(title: "More about Functions", samples: [
        InteropSample(title: "Functions with default arguments",
            description: "You always have to specify all the function arguments. Improved interop available with SKIE.") {
            functionsWithDefaultArgumentsExample()
        }
    ])
}

func coroutinesSection() -> InteropSection {
    InteropSection(title: "Coroutines", samples: [
        InteropSample(
            title: "Suspend functions",
            description:
            """
            Translated into callback, experimentally - into async / await. Libraries like SKIE and KMP-NativeCoroutines can be used to improve the interop and provide cancellation support.
            """) {
            suspendFunctionsExample()
        },
        InteropSample(
            title: "Cancellation of suspend functions",
            description: "Task cancellation is stubbed. Suspend function returns value, no CancellationError."
        ) {
            cancellationOfSuspendFunctionsExample()
        },
        
        InteropSample(
            title: "Flows",
            description:
            """
            Translated into callback, experimentally - into async / await. Generic type arguments are lost. Libraries like SKIE and KMP-NativeCoroutines can be used to improve the interop and provide cancellation support.
            """
        ) {
            flowsExample()
        },
        InteropSample(
            title: "Cancellations of Flows",
            description: "Task cancellation is stubbed. Flow continues emitting values."
        ) {
            cancellationOfFlowsExample()
        }
    ])
}
