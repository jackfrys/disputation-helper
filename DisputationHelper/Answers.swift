//
//  Answers.swift
//  DisputationHelper
//
//  Created by Jack Frysinger on 12/10/16.
//  Copyright © 2016 Jack Frysinger. All rights reserved.
//

import Foundation

class Answers {
    private var answers = [Answer]()
    
    func addAnswer(answer: Answer) {
        answers.append(answer)
    }
    
    func sortedAdox() -> [Answer] {
        return answers.sorted {$0.0.adoxScore() > $0.1.adoxScore()}
    }
}
