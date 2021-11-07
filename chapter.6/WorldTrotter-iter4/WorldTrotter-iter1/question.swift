//
//  question.swift
//  TriviaMultipleChoice
//
//  Created by عبدالعزيز البلوي on 15/03/1443 AH.
//

import Foundation
struct Question {
  let question: String
  let choices: [String]
  let answer: String
  init(question : String, choices: [String] , answer:String) {
    self.question = question
    self.choices = choices
    self.answer = answer
  }
}
