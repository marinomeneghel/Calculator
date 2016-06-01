import UIKit

class ViewController: UIViewController {

    private let calculator = Calculator()
    private var isTyping = false
    
    @IBOutlet weak var display: UILabel!
    @IBOutlet weak var typedHistory: UILabel!

    @IBAction func buttonClicked(sender: UIButton) {
        let digit = sender.currentTitle!
        if isTyping {
            let currentText = display.text
            display.text = currentText! + digit
        } else {
            let textToDisplay = "." == digit ? "0." : digit
            display.text = textToDisplay
        }
        appendToHistory(sender.currentTitle!)
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
            
            appendToHistory(operation)
        }
    }
    @IBAction func clearClicked(sender: UIButton) {
        typedHistory.text = " "
    }
    
    private func appendToHistory(value: String) {
        let currentHistory = typedHistory.text
        typedHistory.text = currentHistory! + value
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

