//
//  ViewController9.swift
//  Number System
//
//  Created by Anthony Ford on 16/09/2017.
//  Copyright © 2017 Anthony Ford. All rights reserved.
//

import UIKit
extension String{
    var isNumeric: Bool{
        return Int(self) != nil
    }
}

class ViewController9: UIViewController {
    //SignAndMagnitude
    @IBOutlet weak var InputNumber: UITextField!
    @IBOutlet weak var OutputNumber: UILabel!
    @IBAction func ConvertNow(_ sender: Any) {
        var NumberToOutput = ("")
        var RealNumberToOutput = ("")
        if InputNumber.text!.isNumeric == false{
            let alert = UIAlertController(title: "Invalid Number", message: "You Must Input a Denary Integer less than 127 and bigger than -127", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Got it!", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else if Int(InputNumber.text!)! > 127{
            let alert = UIAlertController(title: "Invalid Number", message: "You Must Input a Denary Integer less than 127 and bigger than -127", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Got it!", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else if Int(InputNumber.text!)! < -127{
            let alert = UIAlertController(title: "Invalid Number", message: "You Must Input a Denary Integer less than 127 and bigger than -127", preferredStyle: UIAlertControllerStyle.alert)
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
            while binaryArray.count < 7{
                binaryArray.append(0)
            }
            if Int(InputNumber.text!)! < 0{
                binaryArray.append(1)
            }
            else{
                binaryArray.append(0)
            }
            binaryArray.reverse()
            var size = binaryArray.count
            while size > 0{
                NumberToOutput = NumberToOutput + String(binaryArray[binaryArray.count - size])
                size -= 1
            }
            for character in NumberToOutput.characters{
                if character != "-"{
                    RealNumberToOutput = RealNumberToOutput + "\(character)"
                }
            }
        }
        OutputNumber.text = RealNumberToOutput
    }
    
    @IBAction func CloseView(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
