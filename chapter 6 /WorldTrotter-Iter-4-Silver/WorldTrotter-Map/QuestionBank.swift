//
//  QuestionBank.swift
//  WorldTrotter-Map
//
//  Created by Mohammed on 20/03/1443 AH.
//

import Foundation


struct QuesTionBank {
    var list = [Question]()
    
    init() {
        
        list.append(Question(questionText: "William Shakespeare once said (To be,or not to be)", choiceA: "True", choiceB: "False", answer: 1))
        list.append(Question(questionText: "Alan Turing is the father of modern computer science", choiceA: "True", choiceB: "False", answer: 1))
        list.append(Question(questionText: "Computers are smarter than human", choiceA: "True", choiceB: "False", answer: 2))
        list.append(Question(questionText: "William Shakespeare was an electronic engineer", choiceA: "True", choiceB: "False", answer: 2))
        list.append(Question(questionText: "London is the capital city of England", choiceA: "True", choiceB:"False", answer: 1))
        list.append(Question(questionText: "Bill Gets was the founder of Apple", choiceA: "True", choiceB: "False", answer: 2))
        list.append(Question(questionText: "Steve Jobs was a great develper!", choiceA: "True", choiceB: "False", answer: 2))
        list.append(Question(questionText: "Alan Turing was a mathematician (With all love)", choiceA: "True", choiceB: "False", answer: 1))
        list.append(Question(questionText: "Netherland and Holand are the same country", choiceA: "True", choiceB: "False", answer: 1))
        list.append(Question(questionText: "Sony is a food company", choiceA: "True", choiceB: "False", answer: 2))
        
        
    }
    
    
    
    
}
