//
//  QuestionManager.swift
//  WorLdTrotter
//
//  Created by ahlam  on 21/03/1443 AH.
//

import Foundation
struct QuizManager {
  
  private var score: Int = 0
  private var questionNumber: Int = 0
  
  private let quiz = [
    Question(
      question: "Rome is located in ?",
      choices: ["Germany", "Farnce", "Saudi", "Italy"],
      answer: "Italy"
    ),
    Question(
      question: "Riyadh capital of ",
      choices: ["Germany", "Farnce","Saudi","Italy"],
      answer: "Saudi"
    ),
    Question(question: "Paris capital of ?",
             choices: ["Germany", "Farnce","Saudi","Italy"],
             answer: "Farnce"
            ),
    Question(question: "currency of Saudi is ?",
             choices: ["Riyal", "Dollar","Euro","Pound"],
             answer: "Riyal"
            ),
    Question(question: "The language of Saudi Arabia is ?",
             choices: ["English", "Arabic","Greek","Hindi"],
             answer: "Arabic"
            )
  ]
  

  mutating func checkAnswer(_ userAnswer:String) -> Bool {
    print(userAnswer)
    print(quiz[questionNumber].answer)
    if userAnswer == quiz[questionNumber].answer{
      score += 5
      return true
    }
    score -= 10
    return false
  }
  
  
  func getQuestion() -> String {
    return quiz[questionNumber].question
  }
  
  
  func getChoices() -> [String] {
    return quiz[questionNumber].choices
  }
  
  
  func getProgress() -> Float {
    return Float(questionNumber) / Float(quiz.count);
  }
  
  
  func getScore() -> Int {
    return score
  }
  
  
  mutating func nextQuestion() -> Bool {
    //questionNumber += 1
    if (questionNumber + 1 < quiz.count){
      questionNumber += 1
      //  questionNumber = 0
      //   score = 0
      return true
    }
    else {
      return false
    }
  }
  
  
  mutating func startGame() {
    questionNumber = 0
    score = 0
  }
  
  
  func hasUserGoodScore() -> Bool {
    let goodScore = Double(5) * Double(quiz.count) * 0.7
    print("goodScore: \(goodScore)")
    
//    if Double(score) >= goodScore {
//      return true
//    }
//    else {
//      return false
//    }
    
    return Double(score) >= goodScore ? true : false
  }
  
}
