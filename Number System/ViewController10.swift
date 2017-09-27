    // Created by Tadeusz Sikorski 17/09/17
    //integrated by Anthony Ford
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
            // define carry(always 1,as it 1 is added in the process)
            var carry = 1
            //define flipped array
            var flipNumber = [Int]()
            // start flipping for loop
            var size3 = inputNumber.count
            while size3 > 0{
                if inputNumber[inputNumber.count-size3] == 1{
                    flipNumber.append(0)
                }
                else{
                    flipNumber.append(1)
                }
                size3 -= 1
            }
            // reverse to allow for manipulation of array
            flipNumber.reverse()
            // begin math for loop
            var count = 0 //incrementing counter for while loop
            // always only adding 1, so this simplifies
            var size2 = flipNumber.count
            while carry != 0 && size2 > 0{
                if flipNumber[count] == 1{
                    flipNumber[count] = 0
                }
                else{
                    flipNumber[count] = 1
                    carry = 0
                }
                count += 1
                size2 -= 1
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
