//
//  ViewController4.swift
//  Number System
//
//  Created by Anthony Ford on 12/09/2017.
//  Copyright © 2017 Anthony Ford. All rights reserved.
//

import UIKit

class ViewController4: UIViewController {

    @IBOutlet weak var InputNumber: UITextField!
    @IBOutlet weak var OutputNumber: UILabel!
    
    @IBAction func ConvertNumber(_ sender: Any) {
        var NumberToConvert = Int(InputNumber.text!)
        var NumberToOutput = String()
        var re = Int()
        if InputNumber.text!.isNumeric == false{
            let alert = UIAlertController(title: "Invalid Number", message: "You Must Input a Denary Integer", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Got it!", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }

        
        
        else {
            while NumberToConvert != 0{
                re = NumberToConvert! % 16
                NumberToConvert! = NumberToConvert! / 16
                if re < 10{
                    NumberToOutput = String(re) + NumberToOutput
                    }
                else if re == 10{
                    NumberToOutput = "a" + NumberToOutput
                }
                else if re == 11{
                    NumberToOutput = "b" + NumberToOutput
                }
                else if re == 12{
                    NumberToOutput = "c" + NumberToOutput
                }
                else if re == 13{
                    NumberToOutput = "d" + NumberToOutput
                }
                else if re == 14{
                    NumberToOutput = "e" + NumberToOutput
                }
                else{
                    NumberToOutput = "f" + NumberToOutput
                }
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
