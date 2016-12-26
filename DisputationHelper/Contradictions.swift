//
//  Contradictions.swift
//  DisputationHelper
//
//  Created by Jack Frysinger on 12/10/16.
//  Copyright © 2016 Jack Frysinger. All rights reserved.
//

import Foundation

class Contradictions {
    private var contradictions = [Contradiction]()
    
    func add(contradiction: Contradiction) {
        contradictions.append(contradiction)
    }
    
    func violated(answers: [Answer]) -> [Contradiction] {
        return contradictions.filter {$0.violated(answers: answers)}
    }
    
    func index(index: Int) -> Contradiction {
        return contradictions[index]
    }
    
    var count: Int {
        get {
            return contradictions.count
        }
    }
}

class Contradiction {
    var first : Answer
    var second : Answer
    
    var reason : String
    
    init(firstQuestion: Question, firstAnswer: Bool, secondQuestion: Question, secondAnswer: Bool, reason: String) {
        self.first = firstQuestion.answer(answer: firstAnswer)
        self.second = secondQuestion.answer(answer: secondAnswer)
        self.reason = reason
    }
    
    func violated(answers: [Answer]) -> Bool {
        return answers.contains(first) && answers.contains(second)
    }
    
    func contains(answer: Answer) -> Bool {
        return first == answer || second == answer
    }
}
