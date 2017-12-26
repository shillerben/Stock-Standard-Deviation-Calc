//
//  ViewController.swift
//  Stock Standard Deviation Calc
//
//  Created by Ben Shiller on 12/19/17.
//  Copyright © 2017 Ben Shiller. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var stddevLabel: UILabel!
    @IBOutlet weak var rangeLabel: UILabel!
    @IBOutlet weak var impliedVolatility: UITextField!
    @IBOutlet weak var price: UITextField!
    @IBOutlet weak var numDays: UITextField!
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        if (impliedVolatility.hasText && price.hasText && numDays.hasText) {
            // get numbers from input boxes
            let formatter = NumberFormatter()
            formatter.numberStyle = NumberFormatter.Style.decimal
            let impliedVolatilityDouble = (formatter.number(from: impliedVolatility.text!)?.doubleValue)!
            let priceDouble = (formatter.number(from: price.text!)?.doubleValue)!
            let numDaysDouble = (formatter.number(from: numDays.text!)?.doubleValue)!
            // output standard deviation
            let stddev = impliedVolatilityDouble * priceDouble * sqrt(numDaysDouble / 365)
            stddevLabel.text = String(format: "%.4f", stddev)
            // output range
            let min = priceDouble - stddev
            let max = priceDouble + stddev
            rangeLabel.text = String(format: "%.2f", min) + " to " + String(format: "%.2f", max)
        }
        super.touchesBegan(touches, with: event)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // set initial settings
        stddevLabel.text = "0"
        stddevLabel.adjustsFontSizeToFitWidth = true
        rangeLabel.text = "0 to 0"
        rangeLabel.adjustsFontSizeToFitWidth = true
        impliedVolatility.placeholder = "0"
        impliedVolatility.clipsToBounds = true;
        impliedVolatility.keyboardType = UIKeyboardType.decimalPad
        price.placeholder = "0"
        price.clipsToBounds = true;
        price.keyboardType = UIKeyboardType.decimalPad
        numDays.placeholder = "0"
        numDays.clipsToBounds = true;
        numDays.keyboardType = UIKeyboardType.decimalPad
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

