//
//  EditContradictionViewController.swift
//  DisputationHelper
//
//  Created by Jack Frysinger on 12/25/16.
//  Copyright © 2016 Jack Frysinger. All rights reserved.
//

import UIKit

class EditContradictionViewController: UIViewController {

    
    @IBOutlet var q1: UIButton!
    @IBOutlet var q2: UIButton!
    
    @IBOutlet var reasonText: UITextView!
    
    var contradiction: Contradiction?
    var disputation: Disputation!
    var edit = false
    
    @IBOutlet var questionTwoState: UISwitch!
    @IBOutlet var questionOneState: UISwitch!
    override func viewDidLoad() {
        super.viewDidLoad()
        _ = cont()
        hideKeyboard()
        // Do any additional setup after loading the view.
    }

    @IBAction func backButton(_ sender: Any) {
        contradiction?.first.answer = questionOneState.isOn
        contradiction?.second.answer = questionTwoState.isOn
        contradiction?.reason = reasonText.text
        if !edit {
            disputation.addContradiction(contradiction: contradiction!)
        }
        dismiss(animated: true, completion: nil)
    }
    
    func cont() -> Contradiction {
        if let c = contradiction {
            return c
        }
        let q = Question(text: "Text", trueAdoxScore: 5, falseAdoxScore: 5, trueAdoxReason: "Reason", falseAdoxReason: "Reason")
        let q1 = Question(text: "Text", trueAdoxScore: 5, falseAdoxScore: 5, trueAdoxReason: "Reason", falseAdoxReason: "Reason")
        contradiction = Contradiction(firstQuestion: q, firstAnswer: true, secondQuestion: q1, secondAnswer: true, reason: "Reason")
        return contradiction!
    }
    
    @IBAction func setQuestionOne(_ sender: Any) {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let editView = storyboard.instantiateViewController(withIdentifier: "SelectQuestionViewController") as! SelectQuestionViewController
        editView.contradiction = contradiction
        editView.disputation = disputation
        editView.answer = questionOneState.state.rawValue == 0
        editView.first = true
        present(editView, animated: true, completion: nil)
    }
    
    @IBAction func setQuestionTwo(_ sender: Any) {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let editView = storyboard.instantiateViewController(withIdentifier: "SelectQuestionViewController") as! SelectQuestionViewController
        editView.contradiction = contradiction
        editView.disputation = disputation
        editView.answer = questionOneState.isOn
        editView.first = false
        present(editView, animated: true, completion: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        q1.setTitle(contradiction?.first.question.text, for: UIControlState.normal)
        questionOneState.isOn = (contradiction?.first.answer)!
        
        q2.setTitle(contradiction?.second.question.text, for: UIControlState.normal)
        questionTwoState.isOn = (contradiction?.second.answer)!
        
        reasonText.text = contradiction?.reason
    }
}
