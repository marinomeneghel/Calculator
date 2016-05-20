import Foundation

class Calculator {
    
    private var accumulator = Double()
    private var pending: PendingBinaryOperationInfo?
    
    func setOperand(operand: Double) {
        accumulator = operand
    }
    
    enum Operation {
        case Constant((Double))
        case UnaryOperation((Double) -> Double)
        case BinaryOperation((Double, Double) -> Double)
        case Equals
    }
    
    struct PendingBinaryOperationInfo {
        var binaryFunction: (Double, Double) -> Double
        var firstOperand: Double
    }
    
    let operations: Dictionary<String, Operation> = [
        "℮": .Constant(M_E)
    ]
    
    
    func performOperation(mathematicalSymbol: String) {
        if let operation = operations[mathematicalSymbol] {
            switch operation {
            case .Constant(let value):
                accumulator = value
                
            case .UnaryOperation(let function):
                accumulator = function(accumulator)
                
            case .BinaryOperation(let function):
                pending = PendingBinaryOperationInfo(binaryFunction: function, firstOperand: accumulator)
                
            case .Equals:
                if pending != nil {
                    accumulator = pending!.binaryFunction(pending!.firstOperand, accumulator)
                    pending = nil
                }
            }
        }
    }
    
    var result: Double {
        get {
            return accumulator
        }
    }
}