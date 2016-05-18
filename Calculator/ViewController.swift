import UIKit

class ViewController: UIViewController {

    private var accumulator: String = String()
    private let calculator = Calculator()
    
    @IBOutlet weak var calculatorLabel: UILabel!

    @IBAction func buttonClicked(sender: UIButton) {
        accumulator =  accumulator + sender.currentTitle!
        calculatorLabel.text = accumulator
    }
    
    @IBAction func operationClicked(sender: UIButton) {
        let operation = sender.currentTitle!
        calculator.performOperation(operation)
        print(calculator.result())
    }
    
    
}

