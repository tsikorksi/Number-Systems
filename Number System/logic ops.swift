//
// Created by Tadeusz Sikorski on 19/09/2017.
// Copyright (c) 2017 Anthony Ford. All rights reserved.
//
import Foundation
import UIKit

class ViewController12: UIViewController {

    @IBOutlet weak var input_one: UITextField!
    @IBOutlet weak var OutputNumber: UILabel!
    @IBOutlet weak var input_two: UITextField!
// ui object to choose flag
    @IBAction func AddNow(_ sender: Any) {
        //output wierdness? how are we inputting ??
        var output = String("")
        if input_one.text!.isBinaryNumber == false{
            let alert = UIAlertController(title: "One or More Invalid Numbers", message: "You Must Input two Binary Integers", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Got it!", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else if input_two.text!.isBinaryNumber == false{
            let alert = UIAlertController(title: "One or More Invalid Numbers", message: "You Must Input two Binary Integers", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Got it!", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else {
                // input here
                var output = [Int]()
                var input_one = [0, 0, 1, 1, 0, 1]
                var input_two = [1, 0, 1, 0, 1, 1]
                // flag checks operation type
                var flag = 0
                input_one.reverse()
                input_two.reverse()
                //And
                if flag == 1 {
                    for i in input_one {
                        if input_one[i] == 1 && input_two[i] == 1 {
                            output.append(1)
                        } else {
                            output.append(0)
                        }
                    }
                }
                //OR
                else if flag == 2 {
                    for i in input_one {
                        if input_one[i] == 1 && input_two[i] == 0 {
                            output.append(1)
                        } else if input_one[i] == 0 && input_two[i] == 1 {
                            output.append(1)
                        } else {
                            output.append(0)
                        }
                    }
                }
                //NAND
                else if flag == 3 {
                    for i in input_one {
                        if input_one[i] == 1 && input_two[i] == 0 {
                            output.append(1)
                        } else if input_one[i] == 0 && input_two[i] == 1 {
                            output.append(1)
                        } else if input_one[i] == 0 && input_two[i] == 0 {
                            output.append(1)
                        } else {
                            output.append(0)
                        }
                    }
                }
                //NOR
                else if flag == 4 {
                    for i in input_one {
                        if input_one[i] == 0 && input_two[i] == 0 {
                            output.append(1)
                        } else {
                            output.append(0)
                        }
                    }
                }
                //XOR
                else if flag == 5 {
                    for i in input_one {
                        if input_one[i] == 1 && input_two[i] == 0 {
                            output.append(1)
                        } else if input_one[i] == 0 && input_two[i] == 1 {
                            output.append(1)
                        } else {
                            output.append(0)
                        }
                    }
                }
                //NOT
                else {
                    for i in input_one {
                        if input_one[i] == 0 {
                            output.append(1)
                        } else {
                            output.append(0)
                        }
                    }
                }
                // output
                output.reverse()
            }
        }
}