//
//  ViewController3.swift
//  Number System
//
//  Created by Anthony Ford on 12/09/2017.
//  Copyright © 2017 Anthony Ford. All rights reserved.
//

import UIKit
extension String{
    var isBinaryNumber: Bool{
        guard self.characters.count > 0 else{return false}
        let numbers: Set<Character> = ["0", "1"]
        return Set(self.characters).isSubset(of: numbers)
    }
}
class ViewController3: UIViewController {
//Binary to Denary
    @IBOutlet weak var EnteredNumber: UITextField!
    @IBOutlet weak var convertedNumber: UILabel!
    @IBAction func ConvertNow(_ sender: Any) {
        var theNumber = String(EnteredNumber.text!)
        var BinaryCharacterValue: Int = Int(pow(Double(2), Double(theNumber!.characters.count-1)))
        var ResultNumber = 0
        if EnteredNumber.text!.isBinaryNumber == false{
            let alert = UIAlertController(title: "Invalid Number", message: "You Must Input a Binary Integer", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Got it!", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else {
        for character in theNumber!.characters{
                if character == "1"{
                    ResultNumber = ResultNumber + BinaryCharacterValue
                }
                BinaryCharacterValue = BinaryCharacterValue / 2
            }
        }
        convertedNumber.text = "\(ResultNumber)"
        self.view.endEditing(true)
    }
    @IBAction func ReturntoMenu(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
            super.viewDidLoad()
    }
}









