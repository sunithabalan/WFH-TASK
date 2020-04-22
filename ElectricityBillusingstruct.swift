/*Need to calculate Electricity bill for every two months based on below tariffs.  
For domestic
For first 100 units Rs 0/unit
For next 100 units Rs 3.50/unit
For next 300 units Rs 4.60/unit
For unit above 500  Rs 6.60/unit
Fixed charges for two months Rs.50/service
For Commercial
For first 100 units Rs 5.00/unit
Consumption above 100 units bi monthly 8.05/unit
Fixed charges for two months Rs.290/service
Get random numbers as daily consumable units. For domestic random number generation should be in between 1 - 10. For commercial 10 - 100
*/

struct ElectricityBillCalculator
{
    var tariffChargeAndValue : [[Double]]
    var surcharge : Double
    func unitCalculation(startValue:Int,endValue:Int)-> Double {
          var perDayUnitFortwoMonth : [Int] = []
          for eachday in 0..<60{
            let perDayUnit = Int.random(in: startValue...endValue)
            perDayUnitFortwoMonth.append(perDayUnit)
              }
    let calculatedUnit  = perDayUnitFortwoMonth.reduce(0,+)
    return Double(calculatedUnit)
    }
    //BillCalculation
    func calculateTheBill(calculatedUnits:Double){
    var calculatedUnits = calculatedUnits
    var amountTobePaid:Double = 0
    let sortedtariffChargeAndValue = tariffChargeAndValue.sorted{$0[0] < $1[0]}
    for eachKey in 0..<sortedtariffChargeAndValue.count {
     if eachKey == 0 {
      if calculatedUnits < sortedtariffChargeAndValue[eachKey][0] {
                    amountTobePaid += calculatedUnits * sortedtariffChargeAndValue[eachKey][1]
                    break
    } else {
           amountTobePaid += sortedtariffChargeAndValue[eachKey][0] * sortedtariffChargeAndValue[eachKey][1]
            calculatedUnits -= sortedtariffChargeAndValue[eachKey][0]
        }
    }
    else if eachKey == sortedtariffChargeAndValue.count - 1 {
                amountTobePaid += calculatedUnits * sortedtariffChargeAndValue[eachKey][1]
                break
    } else {
        if calculatedUnits < sortedtariffChargeAndValue[eachKey][0]  - sortedtariffChargeAndValue[eachKey - 1][0]  {
                   amountTobePaid += calculatedUnits * sortedtariffChargeAndValue[eachKey][1]
                    break
    } else {
        amountTobePaid += (sortedtariffChargeAndValue[eachKey][0] - sortedtariffChargeAndValue[eachKey - 1][0]) * (sortedtariffChargeAndValue[eachKey][1])
        calculatedUnits = calculatedUnits - (sortedtariffChargeAndValue[eachKey][0] - sortedtariffChargeAndValue[eachKey - 1][0])
                }
            }
        }
        let totalAmountTobePaid = amountTobePaid + surcharge
        print("The Electricity bill is",totalAmountTobePaid)
    }
}

enum readingType {
    case domestic 
    case commercial 
}

let billtype: readingType = .domestic
switch billtype {
    case .domestic:
        var domesticBill = ElectricityBillCalculator(tariffChargeAndValue: [[100,0],[200,3.50],[500,4.60],[501,6.60]], surcharge: 50)
        let calculatedUnit = Double(domesticBill.unitCalculation(startValue: 1, endValue: 10))
        print("The unit for two month is",calculatedUnit)
        domesticBill.calculateTheBill(calculatedUnits: calculatedUnit)
    case .commercial:
        var commercialBill = ElectricityBillCalculator(tariffChargeAndValue: [[100,5.00],[200,8.05]], surcharge: 290)   
        let calculatedUnit = Double(commercialBill.unitCalculation(startValue: 10, endValue: 100))
        print("The unit for two month is",calculatedUnit)
        commercialBill.calculateTheBill(calculatedUnits: calculatedUnit)
}
