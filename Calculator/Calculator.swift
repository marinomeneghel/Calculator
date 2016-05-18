import Foundation

class Calculator {
    
    private var accumulator: Double = Double()
    
    func setOperand(operand: Double) {
        accumulator = operand
    }
    
    func performOperation(operation: String) {
        switch operation {
        case "√": accumulator = sqrt(accumulator); break
        default: break
        }
    }
    
    var result: Double {
        get {
            return accumulator
        }
    }
}