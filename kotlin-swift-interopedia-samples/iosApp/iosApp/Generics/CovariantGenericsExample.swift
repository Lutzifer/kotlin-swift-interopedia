import Foundation
import shared

class CovariantGenericsExample {
    func example(){
        outGenericUsage(generic: OutGeneric(data: "123"))
    }
    
    private func outGenericUsage(generic: OutGeneric<NSString>) {
        print(generic as! OutGeneric<AnyObject>)
    }
}
