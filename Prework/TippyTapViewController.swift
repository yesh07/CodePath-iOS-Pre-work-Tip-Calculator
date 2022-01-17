//
//  TippyTapViewController.swift
//  Prework
//
//  Created by Yeshwanth Vemula on 1/15/22.
//

import UIKit

class TippyTapViewController: UIViewController
{

    @IBOutlet weak var amountBeforeTaxTextField: UITextField!
    @IBOutlet weak var tipPercentageLabel: UILabel!
    @IBOutlet weak var tipPercentageSlider: UISlider!
    @IBOutlet weak var numberOfPeopleSlider: UISlider!
    @IBOutlet weak var numberOfPeopleLabel: UILabel!
    @IBOutlet weak var eachPersonAmountLabel: UILabel!
    @IBOutlet weak var totalResultLabel: UILabel!
    
    var tippyTap = TippyTap(amountBeforeTax: 0, tipPercentage: 0.01)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        amountBeforeTaxTextField.becomeFirstResponder()
    }
    
    func  calculateBill() {
        tippyTap.tipPercentage = Double(tipPercentageSlider.value) / 100.0
        tippyTap.amountBeforeTax = (amountBeforeTaxTextField.text! as NSString).doubleValue
        tippyTap.calculateTip()
        updateUI()
    
    }
    
    func updateUI() {
        totalResultLabel.text = String(format: "$%0.2f", tippyTap.totalAmount)
        let numberOfPeople: Int = Int(numberOfPeopleSlider.value)
        eachPersonAmountLabel.text = String(format: "$%0.2f", tippyTap.totalAmount / Double(numberOfPeople))
    }
    
    // MARK: - Target / Action
    
    @IBAction func tipSliderValueChanged(sender:Any) {
        tipPercentageLabel.text = String(format: "Tip:%02d%%", Int(tipPercentageSlider.value))
        calculateBill()
    }
    @IBAction func numberOfPeopleSliderValueChanged(sender:Any) {
        numberOfPeopleLabel.text = "Slit: \(Int(numberOfPeopleSlider.value))"
        calculateBill()
        
    }
    
    @IBAction func amountBeforeTaxTextFieldChanged(_ sender: Any) {
        calculateBill()
    }
  
}
