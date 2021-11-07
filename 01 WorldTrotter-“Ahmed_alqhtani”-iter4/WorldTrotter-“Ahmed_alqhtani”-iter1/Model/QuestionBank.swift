//
//  QusteionBank.swift
//  TrivialSingleChoice
//
//  Created by Ahmed awadh alqhtani on 12/03/1443 AH.
//

import Foundation
struct QuestionBank {
  var questions = [Qustion]()
  
  init() {
    questions.append(
      Qustion(qustionText: "Is Saudi Arabia located in East Asia?",
              choiceA: "true",
              choiceB: "false",
              answer: 1)
    )
    
    questions.append(Qustion(
                      qustionText:
                              "Did Spain win the 2010 World Cup?", choiceA:
                            "true",
                      choiceB:
                            "false",
                      answer:
                            1))
    
    questions.append(Qustion(
                      qustionText:
                              "Is Iran an Arab country?",
                             choiceA:
                                "true",
                             choiceB:
                                  "false",
                             answer:
                                  
                                  2))
    
    questions.append(Qustion(
                      qustionText:
                              "Do all companies use more than one programming language?",
                             choiceA:
                                "true",
                             choiceB:
                                  "false",
                             answer:
                                    1))
    
    questions.append(Qustion(
                      qustionText:
                              "Is (Ignasiperez) the best teacher in the world?",
                             choiceA:
                              "true",
                             choiceB:
                              "false",
                             answer:
                                   1))
    
  }

}
