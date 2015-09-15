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
    var userEnteredFloatingPoint = false
    
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
    
    @IBAction func operate(sender: UIButton) {
        let operation = sender.currentTitle!
        if userIsInMiddleOfTypingANumber {
            enter()
        }
        switch operation {
            case "×": performOperation{ $0 * $1 }
            case "÷": performOperation{ $1 / $0 }
            case "+": performOperation{ $0 + $1 }
            case "−": performOperation{ $1 - $0 }
            case "√": performOperation{ sqrt($0) }
            default : break
        }
    }
    
    func performOperation(operation: (Double, Double) -> Double) {
        if operandStack.count >= 2 {
            displayValue = operation(operandStack.removeLast(),operandStack.removeLast())
            enter()
        }
    }
    
    private func performOperation(operation: Double -> Double) {
        if operandStack.count >= 1 {
            displayValue = operation(operandStack.removeLast())
            enter()
        }
    }
   
    
    @IBAction func floatingPoint(sender: UIButton) {
        if(!userEnteredFloatingPoint) {
            appendDigit(sender)
            userEnteredFloatingPoint = true
        }
    }
    
    var operandStack = [Double]()
    
    @IBAction func enter() {
        userIsInMiddleOfTypingANumber = false
        operandStack.append(displayValue)
        println("operand stack = \(operandStack)")
        userEnteredFloatingPoint = false
    }
    
    var displayValue: Double {
        get{
            return NSNumberFormatter().numberFromString(display.text!)!.doubleValue
        }
        set {
            display.text = "\(newValue)"
            userIsInMiddleOfTypingANumber = false
        }
    }
}

