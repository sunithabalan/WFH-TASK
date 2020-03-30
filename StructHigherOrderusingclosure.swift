import Foundation
struct student
{   
    let name: String
    let id: Int
    let physics: Int
    let chemistry: Int
    let maths: Int
    let malayalam: Int
    let total: Int
    let percentage : Int
}
var perArray = [Int]()
var rank = 0
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

   var  storingvalueSplitMark = storingValue[2..<storingValue.endIndex]
   let intarr = storingvalueSplitMark.map{Int($0)!}
   let total = intarr.reduce(0, +)

   let percentage = total / (intarr.count)
   perArray.append(percentage)

   let myStudent = [student(name: storingValue[0], id: Int(storingValue[1]) ?? 0, physics: Int(storingValue[2]) ?? 0,chemistry: Int(storingValue[3]) ?? 0,maths: Int(storingValue[4]) ?? 0,malayalam: Int(storingValue[5]) ?? 0, total : total, percentage: percentage)]
   //print(myStudent)  
   if percentage > 75
   {
   let passStudentNames = myStudent.filter( {$0.percentage > 75 }).map({ return $0.name })
   print(passStudentNames)
   }
   else
   {
       let failStudentNames = myStudent.filter( {$0.percentage < 75 }).map({ return $0.name })
      print(failStudentNames)
   }


   
   }
   //print(perArray)
   
