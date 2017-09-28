//
//  FixedtoDenary.swift
//  Number System
//
//  Created by Anthony Ford on 26/09/2017.
//  Copyright © 2017 Anthony Ford. All rights reserved.
//

import UIKit

class FixedtoDenary: UIViewController {

    @IBOutlet weak var Input1: UITextField!
    @IBOutlet weak var Output: UILabel!
    
    @IBOutlet weak var Input2: UITextField!
    
    @IBAction func Convert(_ sender: Any) {
        var ResultNumber = Int()
        var DecimalInt = Int()
        if Input1.text!.isBinaryNumber == false || Input1.text!.characters.count > 32{
            let alert = UIAlertController(title: "Invalid Number", message: "You Must Input a Binary Number", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Got it!", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)

        }
        else if Input2.text!.isPosNumeric == false{
            let alert = UIAlertController(title: "Invalid Number", message: "You Must Input an integer less than 32", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Got it!", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)

        }
        else if Int(Input2.text!)! >= 32{
            let alert = UIAlertController(title: "Invalid Number", message: "You Must Input an integer less than 32", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Got it!", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)

        }
        else{
            let     num = Int(Input2.text!)!
            var Array1 = Array(Input1.text!.characters)
            
            var Array2 = [Character]()
            
            for _ in 1...num{
                Array2.append(Array1[0])
                Array1.remove(at: 0)
            }
            
            var theNumber = String(Array2)
            
            
            var BinaryCharacterValue: Int = Int(pow(Double(2), Double(theNumber.characters.count-1)))
            for character in theNumber.characters{
                if character == "1"{
                    ResultNumber = ResultNumber + BinaryCharacterValue
                }
                BinaryCharacterValue = BinaryCharacterValue / 2
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
        Output.text = "\(ResultNumber)" + "." + "\(DecimalInt)"
    }
    
    @IBAction func CloseView(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

}
