
import Foundation
struct student
{   let name: String
    private let id: Int
    private let physics: Int
    private let chemistry: Int
    private let maths: Int
    private let malayalam: Int
    private let total: Int
    let percentage : Int
    // let result: [String]
    // let rank: [Int]
    init(name: String, id: Int, physics: Int,chemistry: Int,maths: Int,malayalam: Int,total: Int,percentage : Int) 
    {
      self.name = name
      self.id  = id
      self.physics = physics
      self.chemistry = chemistry
      self.maths = maths
      self.malayalam = malayalam
      self.total = total
      self.percentage = percentage
    //   self.rank = rank
    }   
}

let studArr = ["name: John, id: 1, physics: 89, chemistry: 78, maths: 96, malayalam: 67",
               "name: Raju, id: 12, physics: 81, chemistry: 68, maths: 96, malayalam: 67",
               "name: mahesh, id: 12, physics: 100, chemistry: 90, maths: 90, malayalam: 100"]
for eachstudent in studArr
{
   var array = eachstudent.components(separatedBy: ", ")
   var  arr = array[0 ..< array.endIndex]
   var seperatedArray = [String]() 
   var removingColon = [String]()
   var storingValue = [String]()
   for each in arr
   {
   seperatedArray = each.components(separatedBy: ", ")
   removingColon = each.components(separatedBy: ": ")
   storingValue.append(removingColon[1])
   }
   //print(storingValue)
   //Finding the total
   var  storingvalueSplitMark = storingValue[2..<storingValue.endIndex]
   let intarr = storingvalueSplitMark.map{Int($0)!}
   let total = intarr.reduce(0, +)
   let percentage = total / (intarr.count)
   let myStudent = [student(name: storingValue[0], id: Int(storingValue[1]) ?? 0, physics: Int(storingValue[2]) ?? 0,chemistry: Int(storingValue[3]) ?? 0,maths: Int(storingValue[4]) ?? 0,malayalam: Int(storingValue[5]) ?? 0, total : total, percentage: percentage)]
   for name in myStudent{
   let filteredBypercentage = myStudent.filter( {$0.percentage > 75 }).map({ return $0.name })
    print(percentage,":The student has passed")
   }
   }
   
