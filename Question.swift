//
//  Question.swift
//  DisputationHelper
//
//  Created by Jack Frysinger on 12/10/16.
//  Copyright © 2016 Jack Frysinger. All rights reserved.
//

import Foundation

class Question {
    let text : String
    let trueAdoxScore : Int
    let falseAdoxScore : Int
    let trueAdoxReason : String
    let falseAdoxReason : String
    
    init(text: String, trueAdoxScore: Int, falseAdoxScore: Int, trueAdoxReason: String, falseAdoxReason: String) {
        self.text = text
        self.trueAdoxScore = trueAdoxScore
        self.falseAdoxScore = falseAdoxScore
        self.trueAdoxReason = trueAdoxReason
        self.falseAdoxReason = falseAdoxReason
    }
    
    func answer(answer: Bool) -> Answer {
        return Answer(question: self, answer: answer)
    }
}

class Answer {
    private let question : Question
    private let answer : Bool
    
    init(question: Question, answer: Bool) {
        self.question = question
        self.answer = answer
    }
    
    func adoxScore() -> Int {
        return answer ? question.trueAdoxScore : question.falseAdoxScore
    }
    
    func adoxReason() -> String {
        return answer ? question.trueAdoxReason : question.falseAdoxReason
    }
    
    func same(answer: Answer) -> Bool {
        return self.question === answer.question && self.answer == answer.answer
    }
}
