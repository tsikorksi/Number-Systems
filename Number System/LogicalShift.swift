//
//  LogicalShift.swift
//  Number System
//
//  Created by Anthony Ford on 03/10/2017.
//  Copyright © 2017 Anthony Ford. All rights reserved.
//

import UIKit

class LogicalShift: UIViewController {
    @IBOutlet weak var Selector: UISegmentedControl!
    @IBOutlet weak var InputNumber: UITextField!
    @IBOutlet weak var ShiftNumber: UITextField!
    @IBOutlet weak var ShiftNumber2: UITextField!
    @IBOutlet weak var OutputNumber: UILabel!
    @IBOutlet weak var CarryBitoutput: UILabel!
    
    @IBAction func ShiftNow(_ sender: Any) {
        var CarryBit = [Character]()
        CarryBit[0] = "0"
        var NumberToOutput = ""
        var NumtoCarryBit = ""
        if InputNumber.text!.isBinaryNumber == false || InputNumber.text!.characters.count > 32{
            let alert = UIAlertController(title: "Invalid Number", message: "You Must Input a Binary Number up to 32 bits long.", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Got it!", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else if ShiftNumber.text!.isNumeric == false{
            let alert = UIAlertController(title: "Invalid Number", message: "You must input a valid number of positions to shift in the first shift Input.", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Got it!", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else if ShiftNumber2.text!.isNumeric == false {
            let alert = UIAlertController(title: "Invalid Number", message: "You Must Input a valid number of positions to shift in the second shift input, for none, input 0", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Got it!", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else{
            var InputArray = Array(InputNumber.text!.characters)
            var SignBit = [Character]()
            SignBit[0] = "0"
            var Arithmetic = false
            if Selector.selectedSegmentIndex == 1{
                SignBit[0] = InputArray[0]
                InputArray.remove(at: 0)
                Arithmetic = true
            }
            var Shifts1 = Int(ShiftNumber.text!)
            var Shifts2 = Int(ShiftNumber2.text!)
            while Shifts1 != 0{
                if Shifts1! < 0{
                    CarryBit[0] = InputArray[0]
                    Shifts1! += 1
                    InputArray.append(SignBit[0])
                    InputArray.remove(at: 0)
                }
                else{
                    CarryBit[0] = InputArray[InputArray.count - 1]
                    Shifts1! -= 1
                    InputArray.insert(SignBit[0], at: 0)
                    InputArray.remove(at: InputArray.count - 1)
                }
            }
            while Shifts2 != 0{
                if Shifts2! < 0{
                    CarryBit[0] = InputArray[0]
                    Shifts2! += 1
                    InputArray.append(SignBit[0])
                    InputArray.remove(at: 0)
                }
                else{
                    CarryBit[0] = InputArray[InputArray.count - 1]
                    Shifts2! -= 1
                    InputArray.insert(SignBit[0], at: 0)
                    InputArray.remove(at: InputArray.count - 1)
                }
            }
            if Arithmetic == true{
                InputArray.insert(SignBit[0], at: 0)
            }
            NumberToOutput = String(InputArray)
            NumtoCarryBit = String(CarryBit)
        }
        OutputNumber.text = NumberToOutput
        CarryBitoutput.text = NumtoCarryBit
    }
    @IBAction func CloseView(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
