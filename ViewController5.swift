//
//  ViewController5.swift
//  Number System
//
//  Created by Anthony Ford on 13/09/2017.
//  Copyright © 2017 Anthony Ford. All rights reserved.
//

import UIKit

extension String{
    var isHexadecimalNumber: Bool{
        guard self.characters.count > 0 else{return false}
        let numbers: Set<Character> = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "a", "b", "c", "d", "e", "f"]
        return Set(self.characters).isSubset(of: numbers)
    }
}
class ViewController5: UIViewController {
    //Hex to Denary

    @IBOutlet weak var InputNumber: UITextField!
    @IBOutlet weak var OutputNumber: UILabel!
    

    @IBAction func ConvertNow(_ sender: Any){
        var NumberToOutput = Int()
        if InputNumber.text!.isHexadecimalNumber == false{
            let alert = UIAlertController(title: "Invalid Number", message: "You Must Input an Hexadecimal Integer. Remember to use lower case letters.", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Got it!", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            NumberToOutput = 0
        }
        else{
            var NumberToConvert = InputNumber.text!
            var HexCharacterValue = Int(pow(Double(16), Double(NumberToConvert.characters.count-1)))
            for character in NumberToConvert.characters{
                if character == "f"{
                    NumberToOutput = NumberToOutput + (15 * HexCharacterValue)
                }
                else if character == "e"{
                    NumberToOutput = NumberToOutput + (14 * HexCharacterValue)
                }
                else if character == "d"{
                    NumberToOutput = NumberToOutput + (13 * HexCharacterValue)
                }
                else if character == "c"{
                    NumberToOutput = NumberToOutput + (12 * HexCharacterValue)
                }
                else if character == "b"{
                    NumberToOutput = NumberToOutput + (11 * HexCharacterValue)
                }
                else if character == "a"{
                    NumberToOutput = NumberToOutput + (10 * HexCharacterValue)
                }
                else if character == "9"{
                    NumberToOutput = NumberToOutput + (9 * HexCharacterValue)
                }
                else if character == "8"{
                    NumberToOutput = NumberToOutput + (8 * HexCharacterValue)
                }
                else if character == "7"{
                    NumberToOutput = NumberToOutput + (7 * HexCharacterValue)
                }
                else if character == "6"{
                    NumberToOutput = NumberToOutput + (6 * HexCharacterValue)
                }
                else if character == "5"{
                    NumberToOutput = NumberToOutput + (5 * HexCharacterValue)
                }
                else if character == "4"{
                    NumberToOutput = NumberToOutput + (4 * HexCharacterValue)
                }
                else if character == "3"{
                    NumberToOutput = NumberToOutput + (3 * HexCharacterValue)
                }
                else if character == "2"{
                    NumberToOutput = NumberToOutput + (2 * HexCharacterValue)
                }
                else if character == "1"{
                    NumberToOutput = NumberToOutput + (1 * HexCharacterValue)
                }
                HexCharacterValue = HexCharacterValue / 16
            }
        }
        OutputNumber.text = String(NumberToOutput)
        self.view.endEditing(true)
    }
    @IBAction func CloseView(_ sender: Any) {
            self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
