import Foundation
import shared

func sealedInterfaceExample(){
    switchOnSealedInterfaces(sealedInterfaces: SealedInterfacesFirstImpl())
    switchOnSealedInterfaces(sealedInterfaces: SealedInterfacesSecondImpl())
}

private func switchOnSealedInterfaces(sealedInterfaces: SealedInterfaces){
    switch(onEnum(of: sealedInterfaces)){
    case .first: print((sealedInterfaces as! any SealedInterfacesFirst as SealedInterfacesFirst).firstFunctionExample())
    case .second: print((sealedInterfaces as! any SealedInterfacesSecond as SealedInterfacesSecond).secondFunctionExample())
    }
}

class SealedInterfacesFirstImpl : SealedInterfacesFirst {
    func firstFunctionExample() -> String {
        return "first"
    }
}

class SealedInterfacesSecondImpl : SealedInterfacesSecond {
    func secondFunctionExample() -> String {
        return "second"
    }
}
