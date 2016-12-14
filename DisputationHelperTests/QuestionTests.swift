//
//  QuestionTests.swift
//  DisputationHelper
//
//  Created by Jack Frysinger on 12/11/16.
//  Copyright © 2016 Jack Frysinger. All rights reserved.
//

import XCTest

class QuestionTests: XCTestCase {
    
    func testAnswering() {
        let question = Question(text: "q1", trueAdoxScore: 1, falseAdoxScore: 9, trueAdoxReason: "true", falseAdoxReason: "false")
        
        let t = question.answer(answer: true)
        XCTAssertEqual(1, t.adoxScore())
        XCTAssertEqual("true", t.adoxReason())
        XCTAssertTrue(Answer(question: question, answer: true).same(answer: t))
        
        let f = question.answer(answer: false)
        XCTAssertEqual(9, f.adoxScore())
        XCTAssertEqual("false", f.adoxReason())
        XCTAssertTrue(Answer(question: question, answer: false).same(answer: f))
    }
}
