//
//  FloatingPoint.swift
//  Number System
//
//  Created by Anthony Ford on 26/09/2017.
//  Copyright © 2017 Anthony Ford. All rights reserved.
//

import UIKit

class FloatingPoint: UIViewController {

    @IBOutlet weak var InputMantissa: UITextField!
    @IBOutlet weak var InputExponent: UITextField!
    @IBOutlet weak var OutputNumber: UILabel!
    
    @IBAction func ConvertNow(_ sender: Any) {
        
    }
    @IBAction func Closeview(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
