//
//  ViewController.swift
//  CalculadoraImcIos
//
//  Created by Mañanas on 3/4/24.
//

import UIKit

class ViewController: UIViewController {

    // Variable outlets to use in the code
    @IBOutlet var heightResult: UILabel!
    @IBOutlet var weightResult: UILabel!
    @IBOutlet var calculateResult: UILabel!
    @IBOutlet var stepperOutlet: UIStepper!
    @IBOutlet var resultMessage: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Initialization of the value of the stepper
        stepperOutlet.value = 80
        
        // Empty result message
        resultMessage.text = ""
    }
    
    // Display on the height result text the value of the slider without decimals
    @IBAction func sliderAction(_ sender: UISlider) {
        heightResult.text = String(format: "%.0f", sender.value)
    }
    
    // Display on the weight result text the value of the stepper without decimals
    @IBAction func stepperAction(_ sender: UIStepper) {
        weightResult.text = String(format: "%.0f", sender.value)
    }
    
    @IBAction func calculateBtn(_ sender: UIButton) {
        
        // Constant variables to use String as Double
        let heightResultDouble = Double(heightResult.text!)!
        let weightResultDouble = Double(weightResult.text!)!
        
        // Constant variable to calculate te BMI
        let calculateResultDouble = weightResultDouble / ((heightResultDouble / 100) * (heightResultDouble / 100))
        
        // Show the result of the BMI calculation with only one decimal
        calculateResult.text = (String(format:"%.01f", calculateResultDouble))
        
        // Print on console the result with all the decimals
        print("IMC: \(calculateResultDouble)")
        
        switch Float(calculateResult.text!)! {
        case ..<18.5 :
            resultMessage.text = "Underweight"
            resultMessage.textColor = UIColor.orange
        case 18.5...24.9 :
            resultMessage.text = "Healthy Weight"
            resultMessage.textColor = UIColor.green
        case 25...29.9 :
            resultMessage.text = "Overweight"
            resultMessage.textColor = UIColor.orange
        case 30... :
            resultMessage.text = "Obesity"
            resultMessage.textColor = UIColor.red
        default:
            resultMessage.text = ""
        }
    }
}
