//
//  ViewController8.swift
//  Number System
//
//  Created by Anthony Ford on 14/09/2017.
//  Copyright © 2017 Anthony Ford. All rights reserved.
//

import UIKit


class ViewController8: UIViewController {
    
   
    @IBOutlet weak var InputNumber1: UITextField!
    @IBOutlet weak var OutputNumber: UILabel!

    @IBOutlet weak var InputNumber2: UITextField!
    
    @IBAction func AddNow(_ sender: Any) {
        //BinaryAddition
        var NumberToOutput = String("")
        if InputNumber1.text!.isBinaryNumber == false{
            let alert = UIAlertController(title: "One or More Invalid Numbers", message: "You Must Input two Binary Integers", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Got it!", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else if InputNumber2.text!.isBinaryNumber == false{
            let alert = UIAlertController(title: "One or More Invalid Numbers", message: "You Must Input two Binary Integers", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Got it!", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else{
            var BinaryArray1 = InputNumber1.text!.utf8.map{Int(($0 as UInt8)) - 48}
            var BinaryArray2 = InputNumber2.text!.utf8.map{Int(($0 as UInt8)) - 48}
            if BinaryArray2.count > BinaryArray1.count{
                BinaryArray1 = InputNumber2.text!.utf8.map{Int(($0 as UInt8)) - 48}
                BinaryArray2 = InputNumber1.text!.utf8.map{Int(($0 as UInt8)) - 48}
            }
            BinaryArray2.reverse()
            BinaryArray1.reverse()
            var size = BinaryArray2.count
            var ResultArray = [Int]()
            var carryNumber = 0
            var NextNumber = 0
            var HoldNumber = 0
            while size > 0{
                HoldNumber = carryNumber + BinaryArray1[0] + BinaryArray2[0]
                if HoldNumber == 3{
                    NextNumber = 1
                    carryNumber = 1
                }
                else if HoldNumber == 2{
                    NextNumber = 0
                    carryNumber = 1
                }
                else if HoldNumber == 1{
                    NextNumber = 1
                    carryNumber = 0
                }
                else{
                    NextNumber = 0
                    carryNumber = 0
                }
                size -= 1
                BinaryArray2.removeFirst()
                BinaryArray1.removeFirst()
                ResultArray.append(NextNumber)
            }
            
            if BinaryArray1.count != 0{
                var size2 = BinaryArray1.count
                while size2 > 0{
                    HoldNumber = carryNumber + BinaryArray1[BinaryArray1.count - size2]
                    size2 -= 1
                    if HoldNumber == 2{
                        NextNumber = 0
                        carryNumber = 1
                    }
                    else if HoldNumber == 1{
                        NextNumber = 1
                        carryNumber = 0
                    }
                    else{
                        NextNumber = 0
                        carryNumber = 0
                    }
                    ResultArray.append(NextNumber)
                }
            }
            else if carryNumber == 1{
                    ResultArray.append(carryNumber)
            }
            ResultArray.reverse()
            var zerosatfront = true
            while zerosatfront == true{
                if ResultArray[0] == 0{
                    ResultArray.remove(at: 0)
                }
                else{
                    zerosatfront = false
                }
            }
            var size3 = ResultArray.count
            while size3 > 0{
                NumberToOutput = NumberToOutput! + String(ResultArray[ResultArray.count - size3])
                size3 -= 1
            }
            
        }
        OutputNumber.text = NumberToOutput!
        self.view.endEditing(true)
    }
    
    @IBAction func CloseView(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

