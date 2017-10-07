//
//  LogicOperationsFinal.swift
//  Number System
//  Created by Tadeusz Sikorski
//  Integrated by Anthony Ford on 19/09/2017.
//Copyright © 2017 Anthony Ford and Tadeusz Sikorski. All rights reserved.
//

import UIKit
class LogicOpsFinal: UIViewController {
    @IBOutlet weak var Input1: UITextField!
    @IBOutlet weak var Input2: UITextField!
    @IBOutlet weak var Input2Label: UILabel!
    @IBOutlet weak var OperationSelect: UISegmentedControl!
    //Inputs and other required interactions with View.
    @IBOutlet weak var Output: UILabel!
    //Output
    @IBAction func SegmentedControlChanged(_ sender: Any) {
        switch OperationSelect.selectedSegmentIndex{
        case 0:
            Input2Label.isHidden = false
            Input2.isHidden = false
        case 1:
            Input2Label.isHidden = false
            Input2.isHidden = false
        case 2:
            Input2Label.isHidden = false
            Input2.isHidden = false
        case 3:
            Input2Label.isHidden = false
            Input2.isHidden = false
        case 4:
            Input2Label.isHidden = false
            Input2.isHidden = false
        case 5:
            Input2Label.isHidden = true
            Input2.isHidden = true
        // For all of the segments of the SegmentedControl, the second text field and label will appear, except the sixth, which has index 5, as Not requires only 1 input. This function means that whenever the segment selected is switched, the correct number of Inputs will be shown.
        default:
            Input2Label.isHidden = false
            Input2.isHidden = false
        }
    }
    @IBAction func ConvertNow(_ sender: Any) {
        let selectorindex = OperationSelect.selectedSegmentIndex //gives index of selector, which chooses which operation to perform
        var OutputArray = [Character]()
        var OutputString = ""
        var Array1 = Array(Input1.text!.characters)
        var Array2 = Array(Input2.text!.characters)
        if Input1.text!.isBinaryNumber == false{
            let alert = UIAlertController(title: "Invalid Number", message: "You Must Input Two Binary Integers (1 for NOT)", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Got it!", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else if Input2.text!.isBinaryNumber == false && selectorindex != 5{
            let alert = UIAlertController(title: "Invalid Number", message: "You Must Input Two Binary Integers (1 for NOT)", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Got it!", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else{
            while Array1.count < Array2.count{
                Array1.append("0")
            }
            while Array2.count < Array1.count{
                Array2.append("0")
            }// These 2 While Loops make the shorter array the same length as the longer array by adding zeros.
            if selectorindex == 0{//This finds the index of the selector. 0 corresponds to AND
                for i in 1...Array1.count{
                    if Array1[i-1] == "1" && Array2 [i-1] == "1"{//i-1 because the Array has first index at 0 and the for loop starts at 1.
                        OutputArray.append("1")//Only if both the inputs are 1 at the location will the ouput give a 1.
                    }
                    else{
                        OutputArray.append("0")
                    }
                }
            }
            else if selectorindex == 1{//This Index is OR
                for i in 1...Array1.count{
                    if Array1[i-1] == "1" || Array2[i-1] == "1"{
                        OutputArray.append("1")
                    }
                    else{
                        OutputArray.append("0")
                    }
                }
            }
            else if selectorindex == 2{//XOR
                for i in 1...Array1.count{
                    if Array1[i-1] == "1" && Array2[i-1] == "0"{
                        OutputArray.append("1")
                    }
                    else if Array2[i-1] == "1" && Array1[i-1] == "0"{
                        OutputArray.append("1")
                    }
                    else{
                        OutputArray.append("0")
                    }
                }
            }
            else if selectorindex == 3{//NOR
                for i in 1...Array1.count{
                    if Array1[i-1] == "0" && Array2[i-1] == "0"{
                        OutputArray.append("1")
                    }
                    else{
                        OutputArray.append("0")
                    }
                }
            }
            else if selectorindex == 4{//NAND
                for i in 1...Array1.count{
                    if Array1[i-1] == "1" && Array2[i-1] == "1"{
                        OutputArray.append("0")
                    }
                    else{
                        OutputArray.append("1")
                    }
                }
            }
            else if selectorindex == 5{//NOT
                for i in 1...Array1.count{
                    if Array1[i-1] == "1"{
                        OutputArray.append("0")
                    }
                    else{
                        OutputArray.append("1")
                    }
                }
            }
            OutputString = String(OutputArray)//forms string of OutputArray
        }
        Output.text = OutputString//Outputs String
    }
    
    @IBAction func CloseView(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        // Closes the popover view, returning to the Main Menu
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
