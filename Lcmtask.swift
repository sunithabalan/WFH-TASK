func greastestCommonDivisor(between numberOne:Int, and numberTwo:Int) -> Int
{
    var temp = 0
    var largestValue = max(numberOne,numberTwo)
    var smallestValue  = min(numberOne,numberTwo)
    while (smallestValue != 0) {
       temp = largestValue
       largestValue  = smallestValue
       smallestValue =  temp % largestValue
}
    let gcd = largestValue
return gcd
}
func leastCommonMultiple(between numberOne:Int, and numberTwo:Int, greatestnumber:Int) -> Int
{
    let lcm = (numberOne * numberTwo) / greatestnumber
return lcm
}
let numberOne = 28
let numberTwo = 36
let gcd = greastestCommonDivisor(between :numberOne, and: numberTwo)
let lcm = leastCommonMultiple(between : numberOne, and: numberTwo, greatestnumber:gcd)
print("The Lcm for two number is",lcm)
