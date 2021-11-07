import Foundation

struct QuestionBank {
  
  let list = [
    Question(TheQuestions: "An Identifier that is\nimmutableis called a constant?", Answer: "True"),
    Question(TheQuestions: "String Interpolation is used\n when you want to put a constant value in\n the middle of a string?", Answer: "True"),
    Question(TheQuestions:"Comments are indicated \nby the letters /! ?" , Answer: "False"),
    Question(TheQuestions:"When you introduce new methods,variables, \nand constants to your program,\ndo you call that statement?", Answer: "False"),
    Question(TheQuestions: "Print is a function\nthat tells Swift \nto record a message\n to the console?" , Answer: "True")
  ]
  
  var qustionNumber = 0
  var score = 0
  
  mutating func isAnswerCorrect(userAnswer: String) -> Bool{
    
    print(userAnswer)
    print(list[qustionNumber].Answer!)
    
    let correctQuestion = (list[qustionNumber].Answer)
    if userAnswer == correctQuestion{
      
      score += 2
      return true
    }else{
      return false
    }
  }
  
  
  func getQuestion()-> String {
  return  list[qustionNumber].TheQuestions
  }
  
  
  func getChoices()-> String{
    return list[qustionNumber].Answer
  }
  
  
  func getProgress()->Float{
    return (Float(qustionNumber+1)/Float(list.count))
  }
  
  
  func getScore()-> Int {
    return score
  }
  
  
  func getQuestionLabelText() -> String {
    list[qustionNumber].TheQuestions
  }
  
  
  mutating func nextQuestion() -> Bool{
    
    if (qustionNumber + 1 < list.count) {
      qustionNumber += 1
      return true
      
    }else{
      return false
    }
  }
  
  
  mutating func startGame(){
    score = 0
    qustionNumber = 0
  }
}
