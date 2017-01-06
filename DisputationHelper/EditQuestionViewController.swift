//
//  EditQuestionViewController.swift
//  DisputationHelper
//
//  Created by Jack Frysinger on 12/25/16.
//  Copyright © 2016 Jack Frysinger. All rights reserved.
//

import UIKit

class EditQuestionViewController: UIViewController {
    
    var disputation: Disputation!
    var edit = false
    var number: Int?
    @IBOutlet var trueAdoxRating: UISlider!
    @IBOutlet var falseAdoxReason: UISlider!
    @IBOutlet var navBar: UINavigationBar!

    @IBOutlet var falseAdoxReasonText: UITextView!
    @IBOutlet var trueAdoxReasonText: UITextView!
    @IBOutlet var questionText: UITextView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navBar.items?[0].title = edit ? "Edit Question" : "Add Question"
        if let n = number {
            let q = disputation.question(index: n)
            trueAdoxRating.value = Float(q.trueAdoxScore)
            trueAdoxReasonText.text = q.trueAdoxReason
            falseAdoxReason.value = Float(q.falseAdoxScore)
            falseAdoxReasonText.text = q.falseAdoxReason
            questionText.text = q.text
        }
    }

    @IBAction func backButton(_ sender: Any) {
        if edit {
            let q = disputation.question(index: number!)
            q.trueAdoxScore = Int(trueAdoxRating.value)
            q.falseAdoxScore = Int(falseAdoxReason.value)
            q.trueAdoxReason = trueAdoxReasonText.text
            q.falseAdoxReason = falseAdoxReasonText.text
            q.text = questionText.text
        } else {
            let q = Question(text: questionText.text, trueAdoxScore: Int(trueAdoxRating.value), falseAdoxScore: Int(falseAdoxReason.value), trueAdoxReason: trueAdoxReasonText.text, falseAdoxReason: falseAdoxReasonText.text)
            disputation.addQuestion(question: q)
        }
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboard()
    }
}
