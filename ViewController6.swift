//
//  ViewController6.swift
//  Number System
//
//  Created by Anthony Ford on 12/09/2017.
//  Copyright © 2017 Anthony Ford. All rights reserved.
//

import UIKit

class ViewController6: UIViewController {
    //Hex To Binary
    @IBOutlet weak var InputNumber: UITextField!
    @IBOutlet weak var OutputNumber: UILabel!
    
    @IBAction func convertnow(_ sender: Any) {
        var binaryArray = [String]()
        if InputNumber.text!.isHexadecimalNumber == false{
            let alert = UIAlertController(title: "Invalid Number", message: "You Must Input an Hexadecimal Integer. Remember to use lower case letters.", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Got it!", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else{
            var NumberToConvert = InputNumber.text!
            for character in NumberToConvert.characters{
                if character == "f"{
                    binaryArray.append("1111")
                }
                else if character == "e"{
                    binaryArray.append("1110")
                }
                else if character == "d"{
                    binaryArray.append("1101")
                }
                else if character == "c"{
                    binaryArray.append("1100")
                }
                else if character == "b"{
                    binaryArray.append("1011")
                }
                else if character == "a"{
                    binaryArray.append("1010")
                }
                else if character == "9"{
                    binaryArray.append("1001")
                }
                else if character == "8"{
                    binaryArray.append("1000")
                }
                else if character == "7"{
                    binaryArray.append("0111")
                }
                else if character == "6"{
                    binaryArray.append("0110")
                }
                else if character == "5"{
                    binaryArray.append("0101")
                }
                else if character == "4"{
                    binaryArray.append("0100")
                }
                else if character == "3"{
                    binaryArray.append("0011")
                }
                else if character == "2"{
                    binaryArray.append("0010")
                }
                else if character == "1"{
                    binaryArray.append("0001")
                }
                else{
                    binaryArray.append("0000")
                }
            }
            while binaryArray[0] == "0000"{
                binaryArray.remove(at: 0)
            }
            if binaryArray[0] == "0001"{
                binaryArray.remove(at: 0)
                binaryArray.insert("1", at: 0)
            }
            else if binaryArray[0] == "0010"{
                binaryArray.remove(at: 0)
                binaryArray.insert("10", at: 0)
            }
            else if binaryArray[0] == "0011"{
                binaryArray.remove(at: 0)
                binaryArray.insert("11", at: 0)
            }
            else if binaryArray[0] == "0100"{
                binaryArray.remove(at: 0)
                binaryArray.insert("100", at: 0)
            }
            else if binaryArray[0] == "0101"{
                binaryArray.remove(at: 0)
                binaryArray.insert("101", at: 0)
            }
            else if binaryArray[0] == "0110"{
                binaryArray.remove(at: 0)
                binaryArray.insert("110", at: 0)
            }
            else if binaryArray[0] == "0111"{
                binaryArray.remove(at: 0)
                binaryArray.insert("111", at: 0)
            }
        }
        var size = binaryArray.count
        var outputString = String("")
        while size > 0{
            outputString = outputString! + binaryArray[binaryArray.count - size]
            size -= 1
        }
        OutputNumber.text = outputString
        self.view.endEditing(true)
    }
    @IBAction func CloseView(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

