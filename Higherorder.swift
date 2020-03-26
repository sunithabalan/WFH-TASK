import Foundation
struct student
{   let name: String
    let id: Int
    let physics: Int
    let chemistry: Int
    let maths: Int
    let malayalam: Int
    // let total: Double
    // let result: [String]
    // let rank: [Int]
    init(name: String, id: Int, physics: Int,chemistry: Int,maths: Int,malayalam: Int) 
    {
      self.name = name
      self.id  = id
      self.physics = physics
      self.chemistry = chemistry
      self.maths = maths
      self.malayalam = malayalam
    //   self.total = total
    //   self.result = result
    //   self.rank = rank

    }   
}

let mypeople = [student(name: "John", id:1, physics:89,chemistry:78,maths:96,malayalam:67),
                student(name: "John", id:1, physics:89,chemistry:78,maths:96,malayalam:67)]
let studArr = ["John, 1, physics:"89", chemistry:"78", maths:"96", malayalam:"67"",
               "Raju, 12, physics:81, chemistry:68, maths:96, malayalam:67"]
for eachstudent in studArr
{
   var array = eachstudent.components(separatedBy: ", ")
   //let arrayInt = array.compactMap({ Int($0) })
   print(array)
   
}

