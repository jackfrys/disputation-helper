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
    
    func addContradiction(contradiction: Contradiction) {
        contradictions.add(contradiction: contradiction)
    }
    
    func nextQuestion() -> Question? {
        return questions.popLast()
    }
    
    func submitAnswer(question: Question, answer: Bool) {
        answers.addAnswer(answer: question.answer(answer: answer))
    }
    
    func contradiction() -> Contradiction? {
        if let l = answers.answers.last {
            let c = contradictions.violated(answers: answers.answers).filter {$0.contains(answer: l)}
            
            if c.count > 0 {
                return c[0]
            }
        }
        
        return nil
    }
    
    func strike(answer: Answer) {
        answers.strike(answer: answer)
    }
    
    func topAdox(number: Int) -> [Answer] {
        let adox = answers.sortedAdox()
        var r = [Answer]()
        for i in 0..<number {
            r.append(adox[i])
        }
        return r
    }
}
