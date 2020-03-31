import Foundation
struct Student
{   
    static var failureName = [String]()
    static var passStudentName = [String]()
    let name: String
    let id: Int
    let physics: Int
    let chemistry: Int
    let maths: Int
    let malayalam: Int
    let total: Int
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
     var failureName: String {
        let marks = [physics,chemistry,maths,malayalam]
        let failedStudents = marks.filter { $0 <= 35 }
        if failedStudents != nil {
            Student.failureName.append(name)
        }   
        return failureName
     }
     
      var passStudentName: String {
        let marks = [physics,chemistry,maths,malayalam]
        let passedStudents = marks.filter { $0 >= 50 }
        if passedStudents != [] {
            Student.passStudentName.append(name)
        }   
        return passStudentName
        print(passStudentName)
        
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
   let myStudent = [Student(name: storingValue[0], id: Int(storingValue[1]) ?? 0, physics: Int(storingValue[2]) ?? 0,chemistry: Int(storingValue[3]) ?? 0,maths: Int(storingValue[4]) ?? 0,malayalam: Int(storingValue[5]) ?? 0, total : total, percentage: percentage)]
  //print(myStudent)
}







import Foundation
struct Student
{   
    static var failureName = [String]()
    static var passStudentName = [String]()
    static var  percentageArray = [Int]()
    let name: String
    let id: Int
    let physics: Int
    let chemistry: Int
    let maths: Int
    let malayalam: Int
    let total: Int
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
       if (physics >= 50 && chemistry >= 50 && maths >= 50 && malayalam >= 50)  {
            Student.passStudentName.append("name: " + name + "," + "studentId: " +  id + "," + "percentage: " + percentage)
            Student.percentage.append(percentage)
        }
        else {
            Student.failureName .append("name: " + name + "," + "studentId: " +  id + "," + "percentage: " + percentage)
        }
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
   let myStudent = [Student(name: storingValue[0], id: Int(storingValue[1]) ?? 0, physics: Int(storingValue[2]) ?? 0,chemistry: Int(storingValue[3]) ?? 0,maths: Int(storingValue[4]) ?? 0,malayalam: Int(storingValue[5]) ?? 0, total : total, percentage: percentage)]
}
   
   
