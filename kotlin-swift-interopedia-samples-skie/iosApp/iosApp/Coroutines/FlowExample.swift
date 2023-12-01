import Foundation
import shared



@MainActor
func flowExample(){
    Task {
        for await it in NumberFlowRepository().getNumbers() {
            print("Got number: \(it)")
        }
    }
}

func flowWithCancellationExample(){
    Task {
        for await it in NumberFlowRepository().getNumbers() {
            print("Got number: \(it)")
        }
    }.cancel()
}

