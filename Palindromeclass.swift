import Foundation

class Palindrome
{
var input:Int
init(input:Int)
{
    self.input = input
    let inputString = String(input)
    let reversedString = String(inputString.reversed())
    if inputString == reversedString 
    {
    print("True")
    }
    else 
    {
    print("False")
    }
}
}
var result = Palindrome(input:121)
import Foundation

// class Palindrome
// {
// var input:Int
// init(input:Int)
// {
//     self.input = input
//     var copyOfInput : Int = input
//     var remainder: Int , reversed = 0
//     while(copyOfInput != 0) {
//     remainder = (copyOfInput % 10)
//     reversed = (reversed * 10) + remainder
//     copyOfInput  = copyOfInput / 10

//         }
//     if input == reversed
//     {
//     print("True")
//     }
//     else 
//     {
//     print("False")
//     }
// }
// }
// var result = Palindrome(input:11211)
