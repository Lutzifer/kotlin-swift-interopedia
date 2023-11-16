import Foundation
import shared

@MainActor
func suspendFunctionWithCancellationExample() {
    Task {
        do {
            let thing = try await ThingRepository().getThingSimple(succeed: true)
            print("Thing is \(thing).")
        }
        catch {
            print("Found error: \(error)")
        }
    }.cancel()
}

