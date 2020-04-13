
//There’s bank in the name of Ivy Bank. Bank’s Balance 100,00,00,000.
//Person X has an account in Ivy Bank. His/her account number is XXXXXXXXXX.
//And Person X taken a loan amount of 25,00,000 for an interest rate of 14% and the loan tenure is 120 months. Every month interest has to be recalculated from the principal amount. 
//At the end of 120 month, how much interest will be paid by the Person X. 
//Also at the end of 120 months what will be the Banks’s balance.


import Foundation
func loanCalculation(loanAmount : Double, interestRate : Double, years : Int) -> Double {
   let  interestRate = interestRate / 100.0
   var interest = Double(years) * interestRate * loanAmount
   return loanAmount + interest
}
var loanAmount = loanCalculation(loanAmount:250000, interestRate:14, years: 120)
print(loanAmount)


// import Foundation
// let loanCalculation = { (loanAmount : Double,  interestRate : Double, years : Int) -> Double in
//    let interestRate = interestRate / 100.0
//    var interestCalculation = pow(1.0 + interestRate, Double(years))

//    return loanAmount * interestCalculation
// }

// var loanAmount = loanCalculation(2500000, 14, 120)

// print(loanAmount)
