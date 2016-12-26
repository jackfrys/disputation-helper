//
//  EditContradictionViewController.swift
//  DisputationHelper
//
//  Created by Jack Frysinger on 12/25/16.
//  Copyright © 2016 Jack Frysinger. All rights reserved.
//

import UIKit

class EditContradictionViewController: UIViewController {

    @IBOutlet var questionTwoLabel: UILabel!
    @IBOutlet var questionOneLabel: UILabel!
    
    @IBOutlet var questionTwoState: UISegmentedControl!
    @IBOutlet var questionOneState: UISegmentedControl!
    
    @IBOutlet var reasonText: UITextView!
    
    var contradiction: Contradiction?
    var disputation: Disputation!
    var edit = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        _ = cont()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func backButton(_ sender: Any) {
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
        editView.answer = questionOneState.state.rawValue == 0
        editView.first = false
        present(editView, animated: true, completion: nil)
    }
}
