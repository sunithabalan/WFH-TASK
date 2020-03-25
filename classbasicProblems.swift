import Foundation

class Color
{
    var name:String
    var age:Int
    init(colorname:String,colorage:Int) {
        self.name = colorname
        self.age = colorage
        
    }
    func first()
    {
        print("Hello Everyone")
    }
}
class Color2:Color
{
    var number: Int
    init(name:String, age: Int,number:Int)
    {
             self.number = number
            super.init(colorname: name, colorage: age)       
    }
    override func first()
    {
        print("Hello Everyone123")
    }
}
var camp1 = Color2(name:"Yellow",age:3,number:4)
camp1.first()
