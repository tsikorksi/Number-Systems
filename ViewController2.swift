//
//  ViewController2.swift
//  Number System
//
//  Created by Anthony Ford on 13/09/2017.
//  Copyright © 2017 Anthony Ford. All rights reserved.
//

import UIKit
extension String{
    var isPosNumeric: Bool{
        guard self.characters.count > 0 else{return false}
        let numbers: Set<Character> = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
        return Set(self.characters).isSubset(of: numbers)
    }
}
class ViewController2: UIViewController {
    //Denary to Binary
    @IBOutlet weak var OutputNumber: UILabel!
    @IBOutlet weak var InputNumber: UITextField!
    @IBAction func ConvertNow(_ sender: Any) {
        var NumberToOutput = String()
        if InputNumber.text!.isPosNumeric == false{
            let alert = UIAlertController(title: "Invalid Number", message: "You Must Input a Denary Integer", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Got it!", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else{
            var re = Int()
            var binaryArray = [Int]()
            var NumberToConvert = Int(InputNumber.text!)
            while NumberToConvert != 0{
                re = NumberToConvert! % 2
                NumberToConvert = NumberToConvert! / 2
                binaryArray.append(re)
            }
            binaryArray.reverse()
            var size = binaryArray.count
            while size > 0{
                NumberToOutput = NumberToOutput + String(binaryArray[binaryArray.count - size])
                size -= 1
            }
            
        }
        OutputNumber.text = NumberToOutput
        self.view.endEditing(true)
    }
    
    
    
    
    @IBAction func CloseView(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }


}
