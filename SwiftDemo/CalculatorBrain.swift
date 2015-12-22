//
//  CalculatorBrain.swift
//  SwiftDemo
//
//  Created by Velmurugan on 20/12/15.
//  Copyright © 2015 Velmurugan. All rights reserved.
//

import Foundation

class CalculatorBrain
{
    private enum Op : CustomStringConvertible {
        case Operand(Double)
        case UniaryOperation(String,Double->Double)
        case BinaryOperation(String,(Double,Double)->Double)
        
        var description : String {
            get {
                switch self{
                case .Operand(let operand):
                    return "\(operand)"
                case .UniaryOperation(let symbol, _):
                    return symbol
                case .BinaryOperation(let symbol, _):
                    return symbol
                }
            }
            set {
                
            }
        }
    }
    private var opStac = [Op]()
    //    OR
    //    var opStac = Array<Op>()
    
    private var knownOps = [String:Op]()
    //  OR
    //    var knownOps = Dictionary<String,Op>()
    
    init() {
        func learnOp(op: Op){
            knownOps[op.description] = op
        }
        learnOp(Op.BinaryOperation("✕"){$0 * $1})

//        knownOps["✕"] = Op.BinaryOperation("✕"){$0 * $1}
        
        knownOps["÷"] = Op.BinaryOperation("÷"){$0 / $1}
        
        knownOps["+"] = Op.BinaryOperation("+"){$0 + $1}
        
        
        knownOps["-"] = Op.BinaryOperation("-",-)
        //        OR All operation are function.So it know that that will take two argument, so no need to specify $0 and $1.So we can use like taht for +,*,/etc.
        //        knownOps["-"] = Op.BinaryOperation("-"){$0 - $1}
        
        
        
        knownOps["√"] = Op.UniaryOperation("√",sqrt) //Sift know Sqrt take double as argument, so comming double value is pass here.So no need to specify here sepratlly.
        //        OR
        //        knownOps["√"] = Op.UniaryOperation("√"){sqrt($0)}
        
    }
    
    //Recurstion is implmented.
    private func evaluate( ops: [Op]) -> (result: Double?,reminingOps:[Op])
    {
        if !ops.isEmpty {
            var remainingops = ops
            let op = remainingops.removeLast()
            switch op {
            case .Operand(let operand):
                return (operand,remainingops)
            case .UniaryOperation(_, let operation):
                let operandEvaluation = evaluate(remainingops)
                if let operand = operandEvaluation.result{
                    return (operation(operand),operandEvaluation.reminingOps)
                }
            case .BinaryOperation(_, let operation):
                let op1Evalutation = evaluate(remainingops)
                if let operand1 = op1Evalutation.result{
                    let op2Evaluation = evaluate(op1Evalutation.reminingOps)
                    if let operand2 = op2Evaluation.result {
                        return (operation(operand1,operand2),op2Evaluation.reminingOps)
                    }
                }
            }
        }
        return(nil,ops)
    }
    func evaluate() -> Double?{
        let (result,reminder) = evaluate(opStac)
        print("\(opStac) == \(result) with \(reminder) left over")
        return result
    }
    func pushOperand(operand : Double) -> Double?{
        opStac.append(Op.Operand(operand))
        return evaluate()
    }
    func performOperation(symbol: String) -> Double?{
        if let Operation = knownOps[symbol]
        {
            opStac.append(Operation)
        }
        return evaluate()
    }
}