//
//  ViewController.swift
//  SwiftDemo
//
//  Created by Velmurugan on 19/12/15.
//  Copyright © 2015 Velmurugan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var display: UILabel!
    var userInTypingMiddle : Bool = false
    
    var brain = CalculatorBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Calculator"
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func appenDigit(sender: UIButton) {
        let value = sender.currentTitle!
        
        if userInTypingMiddle {
            display.text! += value
        }
        else
        {
            display.text = value
            userInTypingMiddle = true
        }
        
        print("\(value)")
    }

    @IBAction func enter() {
        userInTypingMiddle = false
        if let result = brain.pushOperand(displayValue){
           displayValue = result
        }
        else {
            displayValue = 0
        }
    }
    
    var displayValue:Double{
        get{
            return NSNumberFormatter().numberFromString(display.text!)!.doubleValue
        }
        set {
            display.text = "\(newValue)"
            userInTypingMiddle = false
        }
    }
    
    @IBAction func operate(sender: UIButton) {
        if userInTypingMiddle {
            enter()
        }
        if let operation = sender.currentTitle {
            if let result = brain.performOperation(operation) {
                displayValue = result
            }
            else {
                displayValue = 0
            }
        }
    }
    
}

