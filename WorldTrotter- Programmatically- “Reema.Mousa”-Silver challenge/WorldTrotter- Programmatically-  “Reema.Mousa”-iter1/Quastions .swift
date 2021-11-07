
import Foundation


struct Quastion {
  
  var quastion :String
  var answer : String
  
}
struct QuastionBank{
  
  
  var  score = 0
  var quastionNumber  = 0
  
  var quetions = [
    Quastion(quastion: "3^(4)÷3^(2) = 9 ", answer: "True"),
    Quastion(quastion: " 8.563 + 4.8292 = 13.5", answer: "False "),
    Quastion(quastion: "Which 3 numbers have the same answer whether they’re added or multiplied together it's a 3,4 and 5 ? ", answer: "False "),
    Quastion(quastion: "888 + 88 + 8 + 8 + 8 = 1000 ", answer: "True"),
    
    Quastion(quastion: " |-26| = 26", answer: "True"),
    Quastion(quastion: "3(3 + 2) = 20 ", answer: "False "),
    
    Quastion(quastion: " (2+2 ) * 4 = 8 ", answer: "False "),
    Quastion(quastion: "100 / 3 = 33.3333", answer: "True"),
    Quastion(quastion: "0 * 100 = 0", answer: "True"),
    Quastion(quastion: "100 / 0 = 100 ", answer: "False ")]
  
  
  
  //function
  //1
  mutating func checkAnswer (_ userAnswer: String)->Bool{
    
    let trueAnswer = quetions[quastionNumber].answer
    if userAnswer == trueAnswer {
      
      score += 1
      return true
      
    }else
    {
      
      return false
    }
  }
  
  //2
  func getScore() -> Int {
    return score
    
  }
  //3
  func getQustionText() -> String{
    quetions[quastionNumber].quastion
  }
  
  //4
  func getProgress() -> Float{
    Float (quastionNumber + 1) / Float (quetions.count)
  }
  
  
  //5
  func getQuestuinsNumber() -> Int{
    return quastionNumber
  }
  
  mutating func nextQuestion()-> Bool{
    if quastionNumber+1 < quetions.count{
      quastionNumber += 1
      return true
    }else{
      return false
    }
  }
  
  //6
  mutating func startGame(){
    score = 0
    quastionNumber = 0 
  }
  
}











