//
//  DisputationTests.swift
//  DisputationHelper
//
//  Created by Jack Frysinger on 12/19/16.
//  Copyright © 2016 Jack Frysinger. All rights reserved.
//

import XCTest

class DisputationTests: XCTestCase {
    
    let q1 = Question(text: "q1", trueAdoxScore: 10, falseAdoxScore: 0, trueAdoxReason: "t", falseAdoxReason: "f")
    let q2 = Question(text: "q2", trueAdoxScore: 7, falseAdoxScore: 3, trueAdoxReason: "t", falseAdoxReason: "f")
    let q3 = Question(text: "q3", trueAdoxScore: 4, falseAdoxScore: 6, trueAdoxReason: "t", falseAdoxReason: "f")
    let q4 = Question(text: "q4", trueAdoxScore: 1, falseAdoxScore: 5, trueAdoxReason: "t", falseAdoxReason: "f")
    
    let d = Disputation()
    
    func testDisputation() {
        let c1 = Contradiction(firstQuestion: q1, firstAnswer: true, secondQuestion: q2, secondAnswer: false, reason: "reason")
        d.addQuestion(question: q1)
        d.addQuestion(question: q2)
        d.addQuestion(question: q3)
        d.addQuestion(question: q4)
        d.addContradiction(contradiction: c1)
        
        var one = false
        var two = false
        var count = 0
        
        while let dq1 = d.nextQuestion() {
            count += 1
            if dq1.text == "q1" {
                one = true
                d.submitAnswer(question: dq1, answer: true)
            } else if dq1.text == "q2" {
                two = true
                d.submitAnswer(question: dq1, answer: false)
            } else {
                d.submitAnswer(question: dq1, answer: true)
            }
            
            if one && two {
                XCTAssertTrue(c1 === d.contradiction()!)
            } else {
                XCTAssertNil(d.contradiction())
            }
        }
        
        XCTAssertEqual(4, count)
    }
    
}
