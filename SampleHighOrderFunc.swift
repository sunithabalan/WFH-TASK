import Foundation
var integerArray:[Int] = [1, 5, 6 ,3, 7, 9, 12, 30]
// let sorted = integerArray.sorted()
// print(sorted)
// var desc = integerArray.sorted(by: >)
// print(desc)
//using closure
// let clos = integerArray.sorted {(a,b) -> Bool  in
//  return(a>b)
// }
// print(clos)
struct Person {
    let name: String
    let address: String
    let age: Int
    let income: Double
    let cars: [String]
}

let peopleArray = [ Person(name:"Santosh", address: "Pune, India", age:34, income: 100000.0, cars:["i20","Swift VXI"]),
             Person(name: "John", address:"New York, US", age: 23, income: 150000.0, cars:["Crita", "Swift VXI"]),
             Person(name:"Amit", address:"Nagpure, India", age:17, income: 200000.0, cars:Array())]
// let names = peopleArray.map({ (person) -> String in
//     return person.address
// })
// print(names)
// let addresses = peopleArray.map({$0.address })
// print(addresses)
// let addresses = peopleArray.flatMap({$0.cars })
// print(addresses)
