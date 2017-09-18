    //
    //
    // Created by Tadeusz Sikorski 17/09/17
    //
    // Given input of binary
    // Convert to negative binary and back(it is the sane process)
    

import UIKit

class ViewController10: UIViewController {
    
    @IBOutlet weak var OutputNumber: UILabel!
    @IBOutlet weak var InputNumber: UITextField!
    @IBAction func ConvertNow(_ sender: Any) {
        var NumberToOutput = ("")
        if InputNumber.text!.isBinaryNumber == false{
            let alert = UIAlertController(title: "Invalid Number", message: "You Must Input a Binary Integer", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Got it!", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else{
            var inputNumber = InputNumber.text!.utf8.map{Int(($0 as UInt8)) - 48}
            //11
            // define carry(always 1,as it 1 is added in the process)
            var carry = 1
            //define flipped array
            var flipNumber = [Int]()
            // start flipping for loop
            for i in inputNumber{
                if inputNumber[i] == 0{
                    flipNumber.append(1)
                }
                else {
                    flipNumber.append(0)
                }
            }
            // reverse to allow for manipulation of array
            flipNumber.reverse()
            // begin math for loop
            // always only adding 1, so this simplifies
            for i in flipNumber{
                //if the value is 1, and we stiill have a carry
                if flipNumber[i] == 1 && carry == 1{
                    flipNumber[i] = 0
                }
                    //if the value is 0, and we still have a carry. This ends the process
                else if flipNumber[i] == 0 && carry == 1{
                    flipNumber[i] = 1
                    carry = 0
                }
                else {
                    flipNumber[i] = flipNumber[i]
                }
            }
            // reverse back to normal binary
            flipNumber.reverse()
            var size = flipNumber.count
            while size > 0{
                NumberToOutput = NumberToOutput + String(flipNumber[flipNumber.count - size])
                size -= 1

            }
            // output
            }
        OutputNumber.text = NumberToOutput
    }
    @IBAction func CloseView(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
