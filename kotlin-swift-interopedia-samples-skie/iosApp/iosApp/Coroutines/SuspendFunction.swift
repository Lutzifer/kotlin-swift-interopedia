import Foundation
import shared

@MainActor
func suspendFunctionExample(){
    Task {
        let result = try await ThingRepository().getThing(succeed: true)
        print("Got result: \(result)")
    }
}

@MainActor
func suspendFunctionWithCancellationExample() {
    Task {
        let result = try await ThingRepository().getThing(succeed: true)
        print("Got result: \(result)")
    }.cancel()
}

