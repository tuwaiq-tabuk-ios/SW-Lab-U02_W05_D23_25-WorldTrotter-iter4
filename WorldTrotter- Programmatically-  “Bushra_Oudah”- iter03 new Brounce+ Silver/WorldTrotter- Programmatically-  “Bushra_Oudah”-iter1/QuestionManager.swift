//
//  QuestionManager.swift
//  Quiz App
//
//  Created by Anshul Gupta on 8/24/20.
//  Copyright © 2020 Anshul Gupta. All rights reserved.
//

import Foundation
struct QuizManager {
  
  private let questions = [
    Question(question: "is the water necessary for human?"
             , answer: "True"),
    Question(question: "Riyadh, the capital of Saudi Arabia?"
             , answer: "True"),
    Question(question: "The easiest language in the world is Arabic?"
             , answer: "False"),
    Question(question: "the inventor of the telephon is Newton??"
             , answer: "False"),
    Question(question: "the capital of Canada is Munich ??"
             , answer: "False")
  ]
  
  private var questionNumber = 0
  private var score = 0
  
  
  mutating func checkAnswer(_ userAnswer:String) -> Bool {
    print(userAnswer)
    print(questions[questionNumber].answer)
    if userAnswer == questions[questionNumber].answer{
      score+=5
      return true;
    }
    return false;
  }
  
  func getQuestion() -> String {
    return questions[questionNumber].question
  }
  
  
  func getChoices() -> String {
    return questions[questionNumber].answer
  }
  
  
  func getProgress() -> Float {
    return Float(questionNumber+1) / Float(questions.count);
  }
  
  
  func getScore() -> Int {
    return score
  }
  
  
  func getQuestionNumber() -> Int {
    return questionNumber
  }
  
  mutating func nextQuestion() -> Bool{
    print("--- questionNumber: \(questionNumber+1)")
    print("    questions.count\(questions.count)")
    if (questionNumber+1 < questions.count) {
      questionNumber += 1
      return true
    }
    else {
      return false
    }
  
  }
   mutating func startGame ()
   {
    score = 0
    questionNumber = 0
   }
}
