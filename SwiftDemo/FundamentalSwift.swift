//
//  FundamentalSwift.swift
//  SwiftDemo
//
//  Created by Velmurugan on 31/12/15.
//  Copyright © 2015 Velmurugan. All rights reserved.
//

import Foundation
import UIKit

enum MYOptional<T>
{
    case None
    case Some(T)
}

class FundamentalSwift: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Swift Fundamentals"
        
        //Enum Try
        
        let x: String? = nil
        //is
        let x1 = MYOptional<String>.None
        
        let value:String = "Hello"
        //is
        let value1 = MYOptional<String>.Some("Hellow")
        
        var y = value
        
        switch value1{ //Try here with x,x1,value,value1
        case .Some(let resultValue): y = resultValue
            print("\(y)")
            break
        case .None:
            break
        }
    }

}