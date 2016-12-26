//
//  Question.swift
//  DisputationHelper
//
//  Created by Jack Frysinger on 12/10/16.
//  Copyright © 2016 Jack Frysinger. All rights reserved.
//

import Foundation

class Question {
    var text : String
    var trueAdoxScore : Int
    var falseAdoxScore : Int
    var trueAdoxReason : String
    var falseAdoxReason : String
    
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
