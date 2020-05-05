import Foundation
extension Array where Element: Hashable {
    func removingDuplicates() -> [Element] {
        var addedDict = [Element: Bool]()

        return filter {
            addedDict.updateValue(true, forKey: $0) == nil
        }
    }

    mutating func removeDuplicates() {
        self = self.removingDuplicates()
    }
}
 var verticesEdgesWeight = ["1:2": 2,"2:3": 1,"2:6": 3,"3:6":7,"4:3": 4,"1:4": 6]
 var vertices = [1,2,3,4,6]
 var  weights = [Int]()
 var appendingKeys:String = ""
 for (keys,values)  in verticesEdgesWeight.sorted(by:{$0.1 < $1.1})
 {
   weights.append(values)
   appendingKeys = keys + ":" + appendingKeys
   var removingColon = appendingKeys.components(separatedBy: ":")
   let integerArray = removingColon.compactMap({ Int($0) })
   var removingDuplicates = integerArray.removingDuplicates()
   var totalofvalues  = weights.reduce(0, +)
   if vertices == removingDuplicates.sorted() {
       print(removingDuplicates, totalofvalues)
   }
 }
