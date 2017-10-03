//
//  Normalisation.swift
//  Number System
//
//  Created by Anthony Ford on 29/09/2017.
//  Copyright © 2017 Anthony Ford. All rights reserved.
//

import UIKit

class Normalisation: UIViewController {
    
    @IBOutlet weak var InputM: UITextField!
    @IBOutlet weak var InputE: UITextField!
    @IBOutlet weak var OutputM: UILabel!
    @IBOutlet weak var OutputE: UILabel!

    @IBAction func ConvertNow(_ sender: Any) {
        var OutputMantissa = ""
        var OutputExponent = ""
        if InputM.text!.isBinaryNumber == false || InputE.text!.isBinaryNumber == false || InputM.text!.characters.count > 32 || InputE.text!.characters.count > 8{
            let alert = UIAlertController(title: "Invalid Number", message: "You Must Input a Mantissa up to 32 bits long and an exponent up to 8 bits long", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Got it!", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else{
            var carry = 1
            var count = 1
            var ArrayM = Array(InputM.text!.characters)//Array of Mantissa
            var ArrayE = Array(InputE.text!.characters)//Array of Exponent
            if ArrayM[0] == "1"{
                while ArrayM[1] == "1"{
                    while carry == 1 && count <= ArrayE.count{
                        if ArrayM[ArrayM.count - count] == "1"{
                            ArrayM[ArrayM.count - count] = "0"
                            count += 1
                        }
                        else{
                            carry = 0
                        }
                    }
                    if carry == 1{
                        ArrayE.insert("1", at: 0)
                    }
                    ArrayM.remove(at: 1)
                }
            }
            else{
                while ArrayM[1] == "0"{
                    while carry == 1 && count <= ArrayE.count{
                        if ArrayE[ArrayE.count - count] == "1"{
                            ArrayE[ArrayE.count - count] = "0"
                            count += 1
                        }
                        else{
                            ArrayE[ArrayE.count - count] = "1"
                            carry = 0
                        }
                    }
                    if count > ArrayE.count{
                        ArrayE.insert("1", at: 0)
                    }
                    ArrayM.remove(at: 1)
                }
            }
            OutputMantissa = String(ArrayM)
            OutputExponent = String(ArrayE)
            
        }
        OutputM.text = OutputMantissa
        OutputE.text = OutputExponent
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func CloseView(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
