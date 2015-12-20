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
    
    override func viewDidLoad() {
        super.viewDidLoad()
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

    var operandStack:Array<Double> = Array<Double>()
    @IBAction func enter() {
        userInTypingMiddle = false
        operandStack.append(displayValue)
        print("\(operandStack)")
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
        let operation = sender.currentTitle!
        if userInTypingMiddle {
            enter()
        }
        switch operation{
            case "✕":
                performOperation(multiply)
            break
        case "÷" :
            //Like a block, it will act here.
            performOperation({(op1:Double,op2:Double)->Double in
                return op1 / op2
                })
            break

        case "+" :
            performOperation({(op1,op2) in return op1 + op2 })

        case "-" :
//            We can ommit the () because of no additional arguemnt.
             performOperation{$0 - $1}
////OR
//            We us the () to pass the parameter. If like a block, we can just remove that block(). So we removed to outsite..
//            performOperation(){$0 - $1}
////OR
//             Any how two argument is there so no need the variable name to access, we can just specify the $0 for first argument from left side.$1 for 2nd argument,like that it will goes here.So no need that variable to.
//            performOperation({$0 - $1})
////or
//             Swift know that op1 & op2 is Double , so no need to specify here. and also like that only for the return type too.
//            performOperation({(op1,op2) in  op1 + op2 })
////OR
//            if operandStack.count >=  2 {
//                displayValue = operandStack.removeLast() - operandStack.removeLast()
//                enter()
//            }
            break
        case "√":
            performOperation{sqrt($0)}
            break
        default:break

        }
    }
    
    func multiply(op1:Double,op2:Double)->Double {
        return op1 * op2
    }
    
        
    func performOperation(operation: (Double,Double)->Double){
        if operandStack.count >=  2 {
            displayValue = operation (operandStack.removeLast() , operandStack.removeLast())
            enter()
        }
    }
//    func performOneOperation(operation: (Double)->Double){
    @nonobjc
    func performOperation(operation: Double ->Double){
        if operandStack.count >=  1 {
            displayValue = operation (operandStack.removeLast() )
            enter()
        }
    }
}

