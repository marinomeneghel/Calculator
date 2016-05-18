import UIKit

class ViewController: UIViewController {

    private let calculator = Calculator()
    private var isTyping = false
    
    @IBOutlet weak var display: UILabel!

    @IBAction func buttonClicked(sender: UIButton) {
        let digit = sender.currentTitle!
        if isTyping {
            let currentText = display.text
            display.text = currentText! + digit
        } else {
            display.text = digit
        }
        isTyping = true
    }
    
    @IBAction func operationClicked(sender: UIButton) {
        if isTyping {
            calculator.setOperand(displayValue)
            isTyping = false
        }
        if let operation = sender.currentTitle {
            calculator.performOperation(operation)
            displayValue = calculator.result
        }
    }
    
    private var displayValue: Double {
        get {
            return Double(display.text!)!
        }
        set {
            display.text = String(newValue)
        }
    }
}

