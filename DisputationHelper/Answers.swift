//
//  Answers.swift
//  DisputationHelper
//
//  Created by Jack Frysinger on 12/10/16.
//  Copyright © 2016 Jack Frysinger. All rights reserved.
//

import Foundation

class Answers {
    var answers = [Answer]()
    
    func addAnswer(answer: Answer) {
        answers.append(answer)
    }
    
    func sortedAdox() -> [Answer] {
        return answers.sorted {$0.adoxScore() > $1.adoxScore()}
    }
    
    func strike(answer: Answer) {
        answers = answers.filter {$0 != answer}
    }
    
    var count: Int {
        get {
            return answers.count
        }
    }
    
    func index(index: Int) -> Answer {
        return answers[index]
    }
}
