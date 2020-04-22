import Foundation
import Foundation
//using enum for readingType
enum readingType:String {
    case domestic = "domestic"
    case commercial = "Commercial"
}
var calculatingUnit:Double = 0
var totalAmountTobePaid:Double = 0
//Empty array for storing 60days of random units
var perDayUnitFortwoMonth : [Int] = []
//Function for calculting the Domestic BillType
func billTypeForDomestic(billtype:readingType)
{
//FixedCharge for all DomesticType
let surchargeForDomestic:Double = 50
//Charges for 100 200 and above 500 units
let trafficValues: [String:Double] = ["domesticFirstHundredUnitCharge" : 0, "domesticNextHundredUnitCharge" : 3.50, 
                     "domesticNextThreeHundredUnitCharge" :4.60,"domesticAboveFiveHundredUnitCharge" :6.60]
//Geting random units for twomonth and storing into empty array
for eachday in 0..<60
{
let perDayUnit = Int.random(in:1...10)
perDayUnitFortwoMonth.append(perDayUnit)
}
let units  = perDayUnitFortwoMonth.reduce(0,+)
print("The unit for two month is", units)
//Calculating units
if(units <= 100)
{
    calculatingUnit = Double(units) * trafficValues["domesticFirstHundredUnitCharge"]!
}
//Calculation above 100units
else if(units >= 101 && units <= 200 )
{
    calculatingUnit = Double(units) * trafficValues["domesticFirstHundredUnitCharge"]!  + (Double(100) * trafficValues["domesticNextHundredUnitCharge"]!) 
}
//Calculation above  200units
else if(units >= 201 && units <= 500)
{
    calculatingUnit =  Double(units) * trafficValues["domesticFirstHundredUnitCharge"]! + (Double(100) * trafficValues["domesticNextHundredUnitCharge"]!) 
    + (Double(units - 200) * trafficValues["domesticNextThreeHundredUnitCharge"]!) 
}
//Calculation above 500units
else
{
   calculatingUnit = Double(units) * trafficValues["domesticFirstHundredUnitCharge"]! + (Double(100) * trafficValues["domesticNextHundredUnitCharge"]!) + (Double(300) * trafficValues["domesticNextThreeHundredUnitCharge"]!)
    + Double(units - 500) * trafficValues["domesticAboveFiveHundredUnitCharge"]!
}
totalAmountTobePaid = Double(calculatingUnit + surchargeForDomestic)
print("The Electricity bill for Domestic is is",totalAmountTobePaid)
}
//Function for calculating the Commercial BillType
func billTypeForCommercial(billtype:readingType)
{
//FixedCharge for all CommercialType
let surchargeForCommercial:Double  = 290
//Charges for 100 and above 500 units
let trafficCharge:[String:Double] = ["commericalHundredUnitCharge" : 5.00, "commericalAboveHundredUnitCharge" : 8.05]
////Geting random units for twomonth and storing into empty array
for eachday in 0..<60
{
let perDayUnit = Int.random(in:10...100)
perDayUnitFortwoMonth.append(perDayUnit)
}
//Higherorder function for getting twomonth units
let units  = perDayUnitFortwoMonth.reduce(0,+)
print("The unit for two month  is", units)
//Calculation for 100units
if(units <= 100)
{
    calculatingUnit = Double(units) * trafficCharge["commericalHundredUnitCharge"]!
}
//Calculation above 100units
else
{
    calculatingUnit =  Double(units) * trafficCharge["commericalHundredUnitCharge"]!  + 
    Double(units - 100) * trafficCharge["commericalAboveHundredUnitCharge"]!
}
totalAmountTobePaid = Double(calculatingUnit + surchargeForCommercial)
print("The Electricity bill for Commercial is",totalAmountTobePaid)
}
//Function call using enum
let domesticBill = billTypeForDomestic(billtype:readingType.domestic)
let commercialBill = billTypeForCommercial(billtype:readingType.commercial)
