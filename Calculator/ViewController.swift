//
//  ViewController.swift
//  Calculator
//
//  Created by Aman on 17/08/15.
//  Copyright (c) 2015 Aman Ahluwalia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var display: UILabel!
    var userIsInMiddleOfTypingANumber = false
    
    @IBAction func appendDigit(sender: UIButton) {
        let digit = sender.currentTitle!
        if !userIsInMiddleOfTypingANumber {
            display.text = digit
            userIsInMiddleOfTypingANumber = true
        }
        else {
            display.text = display.text! + digit
        }
    }
}

