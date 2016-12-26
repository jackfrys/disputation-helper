//
//  Answer.swift
//  DisputationHelper
//
//  Created by Jack Frysinger on 12/14/16.
//  Copyright © 2016 Jack Frysinger. All rights reserved.
//

import Foundation

class Answer : Equatable {
    let question : Question
    var answer : Bool
    
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
    
    static func ==(lhs: Answer, rhs: Answer) -> Bool {
        return lhs.question === rhs.question && lhs.answer == rhs.answer
    }
}
