//
//  ContradictionsTests.swift
//  DisputationHelper
//
//  Created by Jack Frysinger on 12/19/16.
//  Copyright © 2016 Jack Frysinger. All rights reserved.
//

import XCTest

class ContradictionsTests: XCTestCase {
    
    let q1 = Question(text: "q1", trueAdoxScore: 10, falseAdoxScore: 0, trueAdoxReason: "t", falseAdoxReason: "f")
    let q2 = Question(text: "q2", trueAdoxScore: 7, falseAdoxScore: 3, trueAdoxReason: "t", falseAdoxReason: "f")
    let q3 = Question(text: "q3", trueAdoxScore: 4, falseAdoxScore: 6, trueAdoxReason: "t", falseAdoxReason: "f")
    let q4 = Question(text: "q4", trueAdoxScore: 1, falseAdoxScore: 5, trueAdoxReason: "t", falseAdoxReason: "f")
    
    func testContradiction() {
        let c1 = Contradiction(firstQuestion: q1, firstAnswer: true, secondQuestion: q2, secondAnswer: false, reason: "reason")
        XCTAssertTrue(c1.violated(answers: [q1.answer(answer: true), q2.answer(answer: false)]))
    }
}
