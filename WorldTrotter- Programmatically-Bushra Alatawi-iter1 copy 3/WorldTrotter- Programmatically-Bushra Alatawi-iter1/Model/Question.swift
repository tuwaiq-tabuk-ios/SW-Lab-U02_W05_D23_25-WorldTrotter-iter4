//
//  Question.swift
//  WorldTrotter- Programmatically-Bushra Alatawi-iter1
//
//  Created by bushra nazal alatwi on 21/03/1443 AH.
//

import Foundation

struct Question {
    //convention to make struct the file name
    let question: String
    let choices: [String]
    let answer: String
    
    
    init(question: String, choices: [String], answer: String){
        self.question = question
        self.choices = choices
        self.answer = answer
        
    }
}
