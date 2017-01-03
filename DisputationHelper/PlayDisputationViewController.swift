//
//  PlayDisputationViewController.swift
//  DisputationHelper
//
//  Created by Jack Frysinger on 12/26/16.
//  Copyright © 2016 Jack Frysinger. All rights reserved.
//

import UIKit

class PlayDisputationViewController: UIViewController {
    
    @IBOutlet var navBar: UINavigationBar!
    var disputation: Disputation!
    var question: Question?
    var qNum = 1

    @IBOutlet var questionText: UITextView!

    @IBAction func backButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func respondTrue(_ sender: Any) {
        disputation.submitAnswer(question: question!, answer: true)
        reloadUI()
    }
    
    @IBAction func respondFalse(_ sender: Any) {
        disputation.submitAnswer(question: question!, answer: false)
        reloadUI()
    }
    
    func reloadUI() {
        if let c = disputation.contradiction() {
            let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
            let editView = storyboard.instantiateViewController(withIdentifier: "PlayContradictionViewController") as! PlayContradictionViewController
            editView.contradiction = c
            editView.disputation = disputation
            present(editView, animated: true, completion: nil)
        } else if let q = disputation.nextQuestion() {
            question = q
            questionText.text = q.text
            navBar.items?[0].title = "Question \(qNum)"
            qNum += 1
        } else {
            let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
            let editView = storyboard.instantiateViewController(withIdentifier: "PlayAdoxViewController") as! PlayAdoxViewController
            editView.disputation = disputation
            present(editView, animated: true, completion: nil)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        reloadUI()
    }
}
