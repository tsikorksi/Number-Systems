//
//  ViewController11.swift
//  Number System
//
//  Created by Anthony Ford on 19/09/2017.
//  Copyright © 2017 Anthony Ford. All rights reserved.
//

import UIKit
extension String{
    var isDecNumeric: Bool{
        guard self.characters.count > 0 else{return false}
        let numbers: Set<Character> = [".","0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
        return Set(self.characters).isSubset(of: numbers)
    }
}
class ViewController11: UIViewController {
    //DenaryToFixedPoint
    @IBOutlet weak var InputNumber: UITextField!
    @IBOutlet weak var OutputNumber: UILabel!
    @IBOutlet weak var OutputText: UILabel!
    
    @IBAction func ConvertNow(_ sender: Any) {
        var NumberToOutput = ("")
        if InputNumber.text!.isDecNumeric == false{
            let alert = UIAlertController(title: "Invalid Number", message: "You Must Input a Denary Number with a Decimal Point Less Than 256", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Got it!", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else if InputNumber.text!.isPosNumeric == true{
            let alert = UIAlertController(title: "Invalid Number", message: "You Must Input a Denary Number With a Decimal Point Less Than 256", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Got it!", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else{
            
            var GENERICARRAY1 = Array(InputNumber.text!.characters)
            var count = 0
            var pointreached = false
            while pointreached == false{
                if GENERICARRAY1[count] == "."{
                    pointreached = true
                }
                else{
                    count += 1
                }
            }
            var size = count
            var IntegerArray = [Character]()
            while size > 0{
                IntegerArray.append(GENERICARRAY1[count - size])
                size -= 1
            }
            let IntegerString = String(IntegerArray)
            //IntegerString Is Integer Side of Number
            pointreached = false
            count = 1
            while pointreached == false{
                if GENERICARRAY1[GENERICARRAY1.count - count] == "."{
                    pointreached = true
                }
                else{
                    count += 1
                }
            }
            var DecimalArray = [Character]()
            var size2 = count - 1
            while size2 > 0{
                DecimalArray.append(GENERICARRAY1[GENERICARRAY1.count - size2])
                size2 -= 1
            }
            
            //DecimalString is Decimal side of Number
            
                var re = Int()
                var binaryArray = [Int]()
                var NumberToConvert = Int(IntegerString)
                while NumberToConvert != 0{
                    re = NumberToConvert! % 2
                    NumberToConvert = NumberToConvert! / 2
                    binaryArray.append(re)
                }
                binaryArray.reverse()
                //Integer Side Converted to Binary Array
                OutputText.text = "The Point is between position " + "\(binaryArray.count)" + " and position " + "\(binaryArray.count + 1)"
                count = 0
                if DecimalArray.count < 8{
                    while DecimalArray.count < 8{
                        DecimalArray.append("0")
                    }
                }
                count = binaryArray.count
                let DecimalString = String(DecimalArray)
                var InttoStart = 5 * Int(pow(Double(10), Double(DecimalArray.count-1)))
                var DecimalInt = Int(DecimalString)
                while count < 32 && DecimalInt! != 0{
                    count += 1
                    if DecimalInt! - InttoStart >= 0{
                        DecimalInt = DecimalInt! - InttoStart
                        binaryArray.append(1)
                    }
                    else{
                        binaryArray.append(0)
                    }
                    InttoStart = InttoStart / 2
                }
                count = 1
            var size3 = binaryArray.count
            while size3 > 0{
                NumberToOutput = NumberToOutput + "\(binaryArray[binaryArray.count-size3])"
                size3 -= 1
            }
            
        }
        OutputNumber.text = NumberToOutput
    }
    
    @IBAction func CloseView(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
