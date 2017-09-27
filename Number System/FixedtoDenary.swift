//
//  FixedtoDenary.swift
//  Number System
//
//  Created by Anthony Ford on 26/09/2017.
//  Copyright © 2017 Anthony Ford. All rights reserved.
//

import UIKit

class FixedtoDenary: UIViewController {

    @IBOutlet weak var Input1: UITextField!
    @IBOutlet weak var Output: UILabel!
    
    @IBOutlet weak var Input2: UITextField!
    
    @IBAction func Convert(_ sender: Any) {
        if Input1.text!.isBinaryNumber == false || Input1.text!.characters.count > 32{
            
        }
        else if Input2.text!.isPosNumeric == false{
            
        }
        else if Int(Input2.text!)! >= 32{
        
        }
        else{
            var num = Int(Input2.text!)!
            var Array1 = Array(Input2.text!.characters)
            var Array2 = [Character]()
            for i in 1...num{
                Array2.append(Array1[0])
                Array1.remove(at: 0)
            }
            var theNumber = String(Array2){
                var BinaryCharacterValue: Int = Int(pow(Double(2), Double(theNumber!.characters.count-1)))
            }
        }
    }
    @IBAction func CloseView(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

}
