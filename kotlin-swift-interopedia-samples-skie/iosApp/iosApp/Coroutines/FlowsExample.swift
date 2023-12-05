import Foundation
import shared

@MainActor
func flowsExample(){
    Task {
        for await it in NumberFlowRepository().getNumbers() {
            print("Got number: \(it)")
        }
    }
}

func cancellationOfFlowsExample(){
    Task {
        for await it in NumberFlowRepository().getNumbers() {
            print("Got number: \(it)")
        }
    }.cancel()
}

