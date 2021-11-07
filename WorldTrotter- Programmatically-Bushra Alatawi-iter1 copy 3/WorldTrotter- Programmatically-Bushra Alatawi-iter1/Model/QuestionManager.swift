//
//  QuestionManager.swift
//  WorldTrotter- Programmatically-Bushra Alatawi-iter1
//
//  Created by bushra nazal alatwi on 21/03/1443 AH.
//

import Foundation
struct QuizManager {
    
    private var score: Int = 0
    private var questionNumber: Int = 0
    
    let quiz = [
        Question(question: "Which is the world's tallest peak?", choices: ["Klimanjaro", "Everest", "Jabal Sawda", "Montblanc"], answer: "Everest"),
        Question(question: "Rigoletto opera was composed by?", choices: ["Giacomo Puccini", "Wolfgang Amadeus Mozart","Giuseppe Verdi", "Richard Wagner"], answer: "Giuseppe Verdi"),
        Question(question: "Which is the Capital of Australia?", choices: ["Canberra", "Sydney", "Melbourne", "Australia does not have a capital"], answer: "Canberra"),
        Question(question: "Turandot opera was composed by?", choices: ["Richard Wagner", "Giacomo Puccini", "Wolfgang Amadeus Mozart", "Giuseppe Verdi"], answer: "Giacomo Puccini"),
        Question(question: "The magic flute opera was composed by?", choices: ["Giacomo Puccini", "Giuseppe Verdi", "Wolfgang Amadeus Mozart", "Richard Wagner"], answer: "Wolfgang Amadeus Mozart")]
    
    
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
