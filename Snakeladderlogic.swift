//Snake ladder game 
//board is 25
import Foundation
var hello = "Start the Game";
print("\(hello)");
let finalSquare = 25
var board = [Int](repeating: 0,count: finalSquare + 1)
board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08
var square = 0
var diceRoll = 0
while square < finalSquare {
  diceRoll = Int.random(in: 0..<6) % 6 + 1;
  print("dice: \(diceRoll)")
  square += diceRoll
  if square < board.count {
    square += board[square]
  }
  print("\(square)")
}
print("Game over!")
//Another method
import Foundation
var hello = "Start the Game";
print("\(hello)");
let finalSquare = 25
var board = [Int](repeating: 0,count: finalSquare + 1)
board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08
var square = 0
var diceRoll = 0
while square < finalSquare {
  diceRoll = Int(rand()) % 6 + 1;
  print("dice: \(diceRoll)")
  square += diceRoll
  if square < board.count {
    square += board[square]
  }
  print("\(square)")
}

print("Game over!")

