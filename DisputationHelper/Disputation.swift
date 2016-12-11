//
//  Disputation.swift
//  DisputationHelper
//
//  Created by Jack Frysinger on 12/11/16.
//  Copyright © 2016 Jack Frysinger. All rights reserved.
//

import Foundation

class Disputation {
    private var questions = [Question]()
    private let answers = Answers()
    private let contradictions = Contradictions()
    
    func addQuestion(question: Question) {
        questions.append(question)
    }
    
    func nextQuestion() -> Question {
        return questions.popLast()!
    }
    
    func submitAnswer(question: Question, answer: Bool) {
        answers.addAnswer(answer: question.answer(answer: answer))
    }
    
    func contradiction() -> Contradiction? {
        let c = contradictions.violated(answers: answers.answers)
        
        if c.count > 0 {
            return c[0]
        }
        
        return nil
    }
}
