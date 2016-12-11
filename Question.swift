//
//  Question.swift
//  DisputationHelper
//
//  Created by Jack Frysinger on 12/10/16.
//  Copyright © 2016 Jack Frysinger. All rights reserved.
//

import Foundation

class Question {
    private var text : String
    private var trueAdoxScore : Int
    private var falseAdoxScore : Int
    private var trueAdoxReason : String
    private var falseAdoxReason : String
    
    init(text: String, trueAdoxScore: Int, falseAdoxScore: Int, trueAdoxReason: String, falseAdoxReason: String) {
        self.text = text
        self.trueAdoxScore = trueAdoxScore
        self.falseAdoxScore = falseAdoxScore
        self.trueAdoxReason = trueAdoxReason
        self.falseAdoxReason = falseAdoxReason
    }
}
