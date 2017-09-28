//
//  FloatingPoint.swift
//  Number System
//
//  Created by Anthony Ford on 26/09/2017.
//  Copyright © 2017 Anthony Ford. All rights reserved.
//

import UIKit

class FloatingPoint: UIViewController {

    @IBOutlet weak var InputMantissa: UITextField!
    @IBOutlet weak var InputExponent: UITextField!
    @IBOutlet weak var OutputNumber: UILabel!
    
    @IBAction func ConvertNow(_ sender: Any) {
        var NumbertoOutput = ""
        var ResultNumber = Int()
        var DecimalInt = Int()  
        if InputMantissa.text!.isBinaryNumber == false || InputExponent.text!.isBinaryNumber == false || InputMantissa.text!.characters.count > 32 || InputExponent.text!.characters.count > 32{
            let alert = UIAlertController(title: "Invalid Number", message: "You Must Input a Mantissa up to 32 bits long and an exponent up to 8 bits long", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Got it!", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)

        }
        else{
            var carry = 1
            var count = 1
            var InputMArray = Array(InputMantissa.text!.characters)
            if InputMArray[0] == "1"{
                NumbertoOutput = NumbertoOutput + "-"
                for i in 1...InputMArray.count{
                    if InputMArray[i-1] == "0"{
                        InputMArray[i-1] = "1"
                    }
                    else{
                        InputMArray[i-1] = "0"
                    }
                }
                while carry == 1 && count != InputMArray.count{
                    if InputMArray[InputMArray.count - count] == "1"{
                        InputMArray[InputMArray.count - count] = "0"
                    }
                    else{
                        carry = 0
                        InputMArray[InputMArray.count - count] = "1"
                    }
                    count += 1
                }
            }
            var InputEArray = Array(InputExponent.text!.characters)
            var NegExponent = false
            if InputEArray[0] == "1"{
                NegExponent = true
                for i in 1...InputEArray.count{
                    if InputEArray[i-1] == "1"{
                        InputEArray[i-1] = "0"
                    }
                    else{
                        InputEArray[i-1] = "1"
                    }
                }
                carry = 1
                count = 1
                while carry == 1 && count != InputEArray.count{
                    if InputEArray[InputEArray.count - count] == "1"{
                        InputEArray[InputEArray.count - count] = "0"
                    }
                    else{
                        carry = 0
                        InputEArray[InputEArray.count - count] = "1"
                    }
                    count += 1
                }
            }
            var theNumber = String(InputEArray)
            
            var BinaryCharacterValue: Int = Int(pow(Double(2), Double(theNumber.characters.count-1)))
            for character in theNumber.characters{
                if character == "1"{
                    ResultNumber = ResultNumber + BinaryCharacterValue
                }
                BinaryCharacterValue = BinaryCharacterValue / 2
            }
            var pointposition = 1
            if NegExponent == false{
                pointposition = ResultNumber + 1
            }
            else{
                count = 0
                while count < ResultNumber{
                    InputMArray.insert("0", at: 0)
                }
            }
            let num = pointposition
            var Array1 = InputMArray
            
            var Array2 = [Character]()
            for _ in 1...num{
                Array2.append(Array1[0])
                Array1.remove(at: 0)
            }
            
            theNumber = String(Array2)
            ResultNumber = 0
            
            var BinaryCharacterValue2: Int = Int(pow(Double(2), Double(theNumber.characters.count-1)))
            for character in theNumber.characters{
                if character == "1"{
                    ResultNumber = ResultNumber + BinaryCharacterValue2
                }
                BinaryCharacterValue2 = BinaryCharacterValue2 / 2
            }
            var theDecimalNumber = ""
            for i in 1...Array1.count{
                theDecimalNumber = theDecimalNumber + "\(Array1[i-1])"
            }
            var startvalue = 5 * Int(pow(Double(10), Double(11)))
            
            for i in 1...Array1.count{
                if Array1[i-1] == "1"{
                    DecimalInt = DecimalInt + startvalue
                }
                startvalue = startvalue / 2
            }
        }
        NumbertoOutput = NumbertoOutput + "\(ResultNumber)" + "." + "\(DecimalInt)"
        OutputNumber.text = NumbertoOutput
    }
    @IBAction func Closeview(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
