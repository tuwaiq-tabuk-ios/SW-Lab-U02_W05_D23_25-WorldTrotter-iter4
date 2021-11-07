//
//  Qustionfile.swift
//  TrivialSingleChoice
//
//  Created by Ahmed awadh alqhtani on 12/03/1443 AH.
//

import Foundation

struct Qustion {
  let question:String
  let optionA:String
  let optionB:String
  let correctAnser:Int
  
  init(qustionText:String, choiceA:String, choiceB:String, answer: Int) {
    question = qustionText
    optionA = choiceA
   optionB = choiceB
    correctAnser = answer
  }
  
}
