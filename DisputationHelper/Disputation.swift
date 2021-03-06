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
    
    var defendant: String?
    var opponent: String?
    var thesis: String?
    
    func addQuestion(question: Question) {
        questions.append(question)
    }
    
    func addContradiction(contradiction: Contradiction) {
        contradictions.add(contradiction: contradiction)
    }
    
    func nextQuestion() -> Question? {
        return questions.count > 0 ? questions.remove(at: Int(arc4random()) % questions.count) : nil
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
        addQuestion(question: answer.question)
    }
    
    func topAdox(number: Int) -> [Answer] {
        let adox = answers.sortedAdox()
        var r = [Answer]()
        for i in 0..<number {
            r.append(adox[i])
        }
        return r
    }
    
    func question(index: Int) -> Question {
        return questions[index]
    }
    
    func contradiction(index: Int) -> Contradiction {
        return contradictions.index(index: index)
    }
    
    var questionCount: Int {
        get {
            return questions.count
        }
    }
    
    var contradictionCount: Int {
        get {
            return contradictions.count
        }
    }
    
    func remove(contradiction: Contradiction) {
        contradictions.remove(contradiction: contradiction)
    }
    
    var answerCount: Int {
        get {
            return answers.count
        }
    }
    
    func answer(index: Int) -> Answer {
        return answers.index(index: index)
    }
    
    func removeQuestion(index: Int) {
        let q = questions.remove(at: index)
        contradictions.remove(question: q)
    }
}
