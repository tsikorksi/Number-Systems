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
        if InputMantissa.text!.isBinaryNumber == false || InputExponent.text!.isBinaryNumber == false || InputMantissa.text!.characters.count > 32 || InputExponent.text!.characters.count > 32{
            let alert = UIAlertController(title: "Invalid Number", message: "You Must Input a Mantissa up to 32 bits long and an exponent up to 8 bits long", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Got it!", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)

        }
        else{
            var Array1 = [Characters]
            var InputMArray = Array(InputMantissa.text.characters)
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
                
                carry = 1
                count = 1
                while carry = 1 && count != InputMArray.count{
                    if InputMArray[InputMArray.count - count] == "1"{
                        InputMArray[InputMArray.count - count]
                    }
                }
            }
        }
    }
    @IBAction func Closeview(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
