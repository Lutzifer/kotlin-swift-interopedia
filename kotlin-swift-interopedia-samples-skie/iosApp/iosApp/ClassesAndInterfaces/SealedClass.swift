import Foundation
import shared

func sealedClassExample(){
    printSealedClassType(s: SealedClass.Object())
    printSealedClassType(s: SealedClass.Simple(param1: "123"))
    printSealedClassType(s: SealedClass.Data(param1: "123", param2: true))
}

private func printSealedClassType(s: SealedClass) {
    switch onEnum(of: s) {
        case .object: print("object")
        case .simple(let simple): print("simple \(simple.param1)")
        case .data(let data): print("data \(data.param1) \(data.param2)")
    }
}