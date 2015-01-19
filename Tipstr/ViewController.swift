//
//  ViewController.swift
//  Tipstr
//
//  Created by Francis Phan on 1/17/15.
//  Copyright (c) 2015 Francis Phan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var splitControl: UISegmentedControl!
    
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var splitLabel: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        billField.text = "$0.00"
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        splitLabel.text = "$0.00"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        var billAmount = NSString(string: billField.text).doubleValue
        
        let tipPercentages = [0.15, 0.18, 0.20, 0.22, 0.25]
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        var tip = billAmount * tipPercentage
        var total = billAmount + tip
        
        // calculate bill split, need to cast double the divisor
        var split = total / ((Double)(splitControl.selectedSegmentIndex) + 1)
        
        tipLabel.text = String(format: "%.2f", tip)
        totalLabel.text = String(format: "%.2f", total)
        splitLabel.text = String(format: "%.2f", split)
    
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }

}

