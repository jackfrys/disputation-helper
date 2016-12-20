//
//  AnswersTests.swift
//  DisputationHelper
//
//  Created by Jack Frysinger on 12/14/16.
//  Copyright © 2016 Jack Frysinger. All rights reserved.
//

import XCTest

class AnswersTests: XCTestCase {
    
    let q1 = Question(text: "q1", trueAdoxScore: 10, falseAdoxScore: 0, trueAdoxReason: "t", falseAdoxReason: "f")
    let q2 = Question(text: "q2", trueAdoxScore: 7, falseAdoxScore: 3, trueAdoxReason: "t", falseAdoxReason: "f")
    let q3 = Question(text: "q3", trueAdoxScore: 4, falseAdoxScore: 6, trueAdoxReason: "t", falseAdoxReason: "f")
    let q4 = Question(text: "q4", trueAdoxScore: 1, falseAdoxScore: 5, trueAdoxReason: "t", falseAdoxReason: "f")
    
    func testAllSame() {
        let answers = Answers()
        let a1 = q1.answer(answer: true)
        let a2 = q1.answer(answer: true)
        let a3 = q1.answer(answer: true)
        answers.addAnswer(answer: a1)
        answers.addAnswer(answer: a2)
        answers.addAnswer(answer: a3)
        XCTAssertEqual([a1, a2, a3], answers.sortedAdox())
        
        let a4 = q1.answer(answer: true)
        answers.addAnswer(answer: a4)
        XCTAssertEqual([a1, a2, a3, a4], answers.sortedAdox())
    }
    
    func testAllTrue() {
        let answers = Answers()
        let a1 = q1.answer(answer: true)
        let a2 = q2.answer(answer: true)
        let a3 = q3.answer(answer: true)
        let a4 = q4.answer(answer: true)
        answers.addAnswer(answer: a1)
        answers.addAnswer(answer: a3)
        answers.addAnswer(answer: a2)
        answers.addAnswer(answer: a4)
        
        XCTAssertEqual([a1, a2, a3, a4], answers.sortedAdox())
    }
    
    func testSomeFalse() {
        let answers = Answers()
        let a1 = q1.answer(answer: true)
        let a2 = q2.answer(answer: false)
        let a3 = q3.answer(answer: true)
        let a4 = q4.answer(answer: false)
        answers.addAnswer(answer: a1)
        answers.addAnswer(answer: a3)
        answers.addAnswer(answer: a2)
        answers.addAnswer(answer: a4)
        
        XCTAssertEqual([a1, a4, a3, a2], answers.sortedAdox())
    }
    
    func testAllFalse() {
        let answers = Answers()
        let a1 = q1.answer(answer: false)
        let a2 = q2.answer(answer: false)
        let a3 = q3.answer(answer: false)
        let a4 = q4.answer(answer: false)
        answers.addAnswer(answer: a1)
        answers.addAnswer(answer: a3)
        answers.addAnswer(answer: a2)
        answers.addAnswer(answer: a4)
        
        XCTAssertEqual([a3, a4, a2, a1], answers.sortedAdox())
    }
}
