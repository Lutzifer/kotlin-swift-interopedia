import Foundation
import shared

@MainActor
func suspendFunctionsExample(){
    Task {
        let result = try await ThingRepository().getThing(succeed: true)
        print("Got result: \(result)")
    }
}

@MainActor
func cancellationOfSuspendFunctionsExample() {
    Task {
        let result = try await ThingRepository().getThing(succeed: true)
        print("Got result: \(result)")
    }.cancel()
}

