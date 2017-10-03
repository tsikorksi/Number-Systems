//
//  DenToFloat.swift
//  Number System
//
//  Created by Anthony Ford and Tadeusz Sikorski on 28/09/2017.
//  Copyright © 2017 Anthony Ford. All rights reserved.
//

import UIKit
extension String{
    var isPosNegDecNumeric: Bool{
        guard self.characters.count > 0 else{return false}
        let numbers: Set<Character> = ["-", ".","0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
        return Set(self.characters).isSubset(of: numbers)
    }
}
class DenToFloat: UIViewController {
    @IBOutlet weak var InputNumber: UITextField!
    @IBOutlet weak var OutputExponent: UILabel!
    @IBOutlet weak var OutputMantissa: UILabel!
    @IBAction func ConvertNow(_ sender: Any) {
        var ExNumberToOutput = ""
        var NumberToOutput = ""
        if InputNumber.text!.isPosNegDecNumeric == false{
            let alert = UIAlertController(title: "Invalid Number", message: "You Must Input a Denary Number", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Got it!", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else{
            var GENERICARRAY1 = Array(InputNumber.text!.characters)
            var NegMantissa = false
            if GENERICARRAY1[0] == "-"{
                NegMantissa = true
                GENERICARRAY1.remove(at: 0)
            }
            var count = 0
            var pointreached = false
            while pointreached == false{
                if GENERICARRAY1[count] == "." || count == GENERICARRAY1.count - 1{
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
                if GENERICARRAY1[GENERICARRAY1.count - count] == "." || count == GENERICARRAY1.count{
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
            var pointposition = 0
            while binaryArray[0] == 0 && binaryArray.count != 0{
                binaryArray.remove(at: 0)
            }
            binaryArray.insert(0, at: 0)
            pointposition = binaryArray.count
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
            var exponentInteger = 0
            var Negexponent = false
            if pointposition == 1{
            
                while binaryArray[1] == 0{
                    binaryArray.remove(at: 1)
                    exponentInteger -= 1
                }
            }
            else{
                exponentInteger = pointposition - 1
            }
            if exponentInteger < 0{
                exponentInteger = 0 - exponentInteger
                Negexponent = true
            }
            var binaryArray2 = [Int]()
            var NumberToConvert2 = exponentInteger
            while NumberToConvert2 != 0{
                re = NumberToConvert2 % 2
                NumberToConvert2 = NumberToConvert2 / 2
                binaryArray2.append(re)
            }
            binaryArray2.reverse()
            var carry = 1
            if Negexponent == true{
                for i in 1...binaryArray2.count{
                    if binaryArray2[i-1] == 1{
                        binaryArray2[i-1] = 0
                    }
                    else{
                        binaryArray2[i-1] = 1
                    }
                }
                count = 1
                while carry != 0{
                    if binaryArray2[binaryArray2.count - count] == 1{
                        binaryArray2[binaryArray2.count - count] = 0
                    }
                    else{
                        carry = 0
                    }
                    count += 1
                }
            }
            var size4 = binaryArray2.count
            while size4 > 0{
                ExNumberToOutput = ExNumberToOutput + String(binaryArray2[binaryArray2.count - size4])
                size4 -= 1
            }
            if NegMantissa == true{
                for i in 1...binaryArray.count{
                    if binaryArray[i-1] == 1{
                        binaryArray[i-1] = 0
                    }
                    else{
                        binaryArray[i-1] = 1
                    }
                }
                carry = 1
                count = 1
                while carry != 0{
                    if binaryArray[binaryArray.count-count] == 1{
                        binaryArray[binaryArray.count-count] = 0
                    }
                    else{
                        carry = 0
                    }
                    count += 1
                }
            }
            var size3 = binaryArray.count
            while size3 > 0{
                NumberToOutput = NumberToOutput + String(binaryArray[binaryArray.count-size3])
                size3 -= 1
            }
        }
    OutputExponent.text = ExNumberToOutput
    OutputMantissa.text = NumberToOutput
    }
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func CloseView(_ Sender: Any){
        self.dismiss(animated: true, completion: nil)
    }
}
//point is after binaryArray.count places
