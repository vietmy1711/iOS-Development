//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPcButton: UIButton!
    @IBOutlet weak var tenPcButton: UIButton!
    @IBOutlet weak var twentyPcButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    @IBOutlet weak var stepperValue: UIStepper!
    var split: Float = 0.0
    
    @IBAction func tipChanged(_ sender: UIButton) {
        zeroPcButton.isSelected = false
        tenPcButton.isSelected = false
        twentyPcButton.isSelected = false
        sender.isSelected = true
        billTextField.endEditing(true)
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let total = String(billTextField.text!)
        var percent: Float = 1.0
        if tenPcButton.isSelected == true {
            percent = 1.1
        } else if twentyPcButton.isSelected == true {
            percent = 1.2
        }
        split = (Float(total)! * percent)/Float(stepperValue.value)
        self.performSegue(withIdentifier: "toResult", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let resultVC = segue.destination as! ResultsViewController
        resultVC.total = String(format: "%0.2f", split)
        resultVC.settings = String(splitNumberLabel.text!)
    }
}

