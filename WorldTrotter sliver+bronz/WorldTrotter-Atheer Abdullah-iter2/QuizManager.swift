//
//  m.swift
//  Taa
//
//  Created by Atheer abdullah on 14/03/1443 AH.
//

import Foundation
struct QuizManager {
  
  var questionNumber = 0
  var score = 0

  private let quiz = [
    Question(question: "Saudi National Day is 18-Julay",
             answer: "False"),
    Question(question: "The number of Ocean in the world is 5 ocean",
             answer: "True"),
    Question(question: "Eastern is the larges trehoin in the KSA",
             answer: "True"),
    Question(question: "Heart is the largest organ in the human body?",
             answer: "False"),
    Question(question: "A lion is a pet",
             answer: "False")
  ]
  
  
  mutating func checkAnswer(_ userAnswer:String) -> Bool {
    let questionAnswer = quiz[questionNumber].answer
    if userAnswer == questionAnswer {
      score += 1
      return true
    } else {
      return false
    }
  }
  
  
  func getScore() -> Int {
    return score
  }
  
  
  func getQuestion() -> String {

      quiz[questionNumber].question
  }
  
  
  func getQuestionNnmber() -> String {
       
    return quiz[questionNumber].question
  }
  
  func getProgress() -> Float {
    
    
  Float (questionNumber + 1 ) / Float(quiz.count)
  }
  
  
  mutating func nextQuestion() -> Bool {
    print("questionNumber + 1: \(questionNumber + 1)")
    if (questionNumber + 1 <  quiz.count) {
      questionNumber += 1
      return true
    } else {
      return false
    }
  }
  
  
  mutating func startGame(){
    score = 0
    questionNumber = 0
  }
}
