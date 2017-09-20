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
            while size >= 0{
                IntegerArray.append(GENERICARRAY1[count - size])
                size -= 1
            }
            var IntegerString = String(IntegerArray)
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
            var size2 = count
            while size2 > 0{
                DecimalArray.append(GENERICARRAY1[GENERICARRAY1.count - size2])
                size2 -= 1
            }
            var DecimalString = String(DecimalArray)
            //DecimalString is Decimal side of Number
            if Int(IntegerString)! > 255{
                let alert = UIAlertController(title: "Invalid Number", message: "You Must Input a Denary Number With a Decimal Point Less than 256", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "Got it!", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
            else{
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
                if binaryArray.count == 8{
                    OutputText.text = "There is No Point"
                }
                else{
                    OutputText.text = "The Point is between position" + "\(binaryArray.count)" + "and position" + "\(binaryArray.count + 1)"
                }
                if binaryArray.count < 8{
                    count = 8 - binaryArray.count
                    let num = DecimalArray[0]
                        if num == "0" || num == "1" || num == "2" || num == "3" || num == "4"{
                            binaryArray.append(0)
                        }
                        else{
                            binaryArray.append(1)
                        }
                    count -= 1
                    if count > 0{
                        
                    }
                }
            }
        }
    }
    
    @IBAction func CloseView(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
