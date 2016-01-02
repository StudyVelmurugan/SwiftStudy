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
        
        self.enumDemos()
        print("\n\n\n")

        self.arrayDemo()
        print("\n\n\n")

        self.dictionaryDemo()
        print("\n\n\n")

        self.rangeDemo()
        print("\n\n\n")

        self.otherClass()
        print("\n\n\n")

    }
    
    func enumDemos()
    {
        //Enum Try
        
        let x: String? = nil
        //is
        let x1 = MYOptional<String>.None
        
        let value:String = "Hello"
        //is
        let value1 = MYOptional<String>.Some("Hellow")
        
        var y = value
        
        switch value1{ //Try here with x,x1,value,value1
        case .Some(let resultValue):
            y = resultValue
            print("\(y)")
            break
        case .None:
            break
        }

    }
    
    func arrayDemo()
    {
       var a = Array<String>()
        //or
        var a1 = [String]()
        
        var  animals  = ["Giraffe","Cow","Dog"]
        animals.append("Ostrich")
        let animal = animals[3]
        
        for animal in animals
        {
            print("\(animal)")
        }
    }
    
    func dictionaryDemo()
    {
        var pac10teamRankings = Dictionary<String, Int>()
        //or
        var pac20teamRankings1 = [String:Int]()
        pac10teamRankings = ["Stanfort":1,"Cal":2]
        
        let ranking = pac10teamRankings["Stanfort"]!
        
        print("\(ranking)")
        
        for (key,value) in pac10teamRankings
        {
            print("\(key) = \(value)")
        }
    }
    
    
    func rangeDemo()
    {
        let array =  ["a","b","c","d"]
        let subArray1 = array[2...3]
        let subArray2 = array[2..<3]
        print("sub Array 1 : \(subArray1) \n\n\n\n SubArray 2: \(subArray2)")
        for i in [1...100]
        {
            for j in i {
                print("\(j)")
            }
        }
//        struct Range<T>{
//            var startIndex:T
//            var endIndex:T
//        }
    }
    
    func otherClass()
    {
        let n = NSNumber(double: 35.5)
        let intVersion = n.intValue
        print("\(intVersion)")
        struct a {
            var a1:Int
            var a2:Int {
                get{
                    print("getting  Value : \(self.a2)")
                    return self.a2
                }
                set{
                    print("Setting New Value : \(newValue)")
                }
            }
            
            func doit(let ss:a )->Int {
                return ss.a1+ss.a2
            }
            
        }
        
        let a1 = a.init(a1: 13)
    }
}