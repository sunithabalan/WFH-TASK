
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
    }   
    
}

let studArr = ["name: John, id: 1, physics: 89, chemistry: 78, maths: 96, malayalam: 67",
               "name: Raju, id: 2, physics: 81, chemistry: 68, maths: 96, malayalam: 67",
               "name: mahesh, id: 3, physics: 100, chemistry: 90, maths: 90, malayalam: 100",
                "name: sheena, id: 4, physics: 34, chemistry: 9, maths: 9, malayalam: 1"]
for eachstudent in studArr
{
   var arraySeperator = eachstudent.components(separatedBy: ", ")
   var  arrSplit = arraySeperator[0 ..< arraySeperator.endIndex]
   var seperatedArray = [String]() 
   var removingColon = [String]()
   var storingValue = [String]()
   for each in arrSplit
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
   var perArr = [Int]()
   let percentage = total / (intarr.count)

   let myStudent = [student(name: storingValue[0], id: Int(storingValue[1]) ?? 0, physics: Int(storingValue[2]) ?? 0,chemistry: Int(storingValue[3]) ?? 0,maths: Int(storingValue[4]) ?? 0,malayalam: Int(storingValue[5]) ?? 0, total : total, percentage: percentage)]
   for each in myStudent{
   
   if percentage  > 60
   {
       let filteredBypercentageFName = myStudent.filter( {$0.percentage > 75 }).map({ return $0.name })
       print(filteredBypercentageFName,"the percentage is",percentage,"%","student has passed")
   }
   else  
   {
       let filteredBypercentageFName = myStudent.filter( {$0.percentage < 45 }).map({ return $0.name })
       print(filteredBypercentageFName,"the percentage is",percentage,"%","student has Failed")
   }
   } 
   //print(myStudent)
   }
   
