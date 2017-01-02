//
//  RemoteLoading.swift
//  DisputationHelper
//
//  Created by Jack Frysinger on 12/27/16.
//  Copyright © 2016 Jack Frysinger. All rights reserved.
//

import Foundation
import SwiftyJSON

class RemoteLoading {
    
    var delegate: RemoteLoadingDelegate?
    
    func load(loc: String) {
        var components = URLComponents(string: "https://idxbg9vzf0.execute-api.us-east-1.amazonaws.com/prod/disputator/")!
        components.queryItems = [URLQueryItem(name: "disputation_id", value: loc)]
        let url = components.url!
        let task = URLSession.shared.dataTask(with: url, completionHandler: {(data, response, error) in self.handle(data: data)})
        task.resume()
    }
    
    func handle(data: Data?) {
        let json = JSON(data!)
        let d = Disputation()
        
        var questions = [Question]()
        
        for q in json["questions"].array! {
            let text = q["text"].string!
            let trueScore = q["trueScore"].int!
            let falseScore = q["falseScore"].int!
            let trueReason = q["trueReason"].string!
            let falseReason = q["falseReason"].string!
            
            let new = Question(text: text, trueAdoxScore: trueScore, falseAdoxScore: falseScore, trueAdoxReason: trueReason, falseAdoxReason: falseReason)
            questions.append(new)
            d.addQuestion(question: new)
        }
        
        for c in json["contradictions"].array! {
            let q1 = c["questionOne"].int! - 1
            let q1a = c["questionOneAnswer"].bool!
            let q2 = c["questionTwo"].int! - 1
            let q2a = c["questionTwoAnswer"].bool!
            let reason = c["reason"].string!
            
            let new = Contradiction(firstQuestion: questions[q1], firstAnswer: q1a, secondQuestion: questions[q2], secondAnswer: q2a, reason: reason)
            d.addContradiction(contradiction: new)
        }
        
        d.defendant = json["defendant"].string!
        d.opponent = json["opponent"].string!
        d.thesis = json["thesis"].string!
        
        delegate?.recievedDisputation(disputation: d)
    }
}

protocol RemoteLoadingDelegate {
    func recievedDisputation(disputation: Disputation)
}
