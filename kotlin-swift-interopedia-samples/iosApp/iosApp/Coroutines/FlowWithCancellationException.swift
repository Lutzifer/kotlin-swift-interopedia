import Foundation
import shared

@MainActor
func flowWithCancellationExample() {
    Task {
        try await NumberFlowRepository().getNumbersSimple().collect(collector: CancellationCollector())
    }.cancel()
}

class CancellationCollector: Kotlinx_coroutines_coreFlowCollector {
    func emit(value: Any?) async throws {
        print("Got number: \(value!)")
    }
}
