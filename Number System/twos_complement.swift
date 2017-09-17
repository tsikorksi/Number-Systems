// 
//
// Created by Tadeusz Sikorski 17/09/17
//
// Given input of binary
// Convert to negative binary and back(it is the same process) 

class twos_complement{
    func bin_to_negative(){
        // add to array here
        var inputNumber = [1,0,1,1]
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
        // add 1 if carry is still 1, ie the binary was a string of 1s
        if carry == 1{
            flipNumber.append(1)
        }
        // reverse back to normal binary
        flipNumber.reverse()
        }
        // output
    }
}

