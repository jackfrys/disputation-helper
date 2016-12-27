//
//  PlayContradictionViewController.swift
//  DisputationHelper
//
//  Created by Jack Frysinger on 12/26/16.
//  Copyright © 2016 Jack Frysinger. All rights reserved.
//

import UIKit

class PlayContradictionViewController: UIViewController {
    
    var disputation: Disputation!
    var contradiction: Contradiction!

    @IBOutlet var questionOneText: UILabel!
    @IBOutlet var questionTwoText: UILabel!
    
    @IBOutlet var reasonText: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func accepted(_ sender: Any) {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let editView = storyboard.instantiateViewController(withIdentifier: "StrikeQuestionViewController") as! StrikeQuestionViewController
        editView.disputation = disputation
        present(editView, animated: true, completion: nil)
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func declined(_ sender: Any) {
        disputation.remove(contradiction: contradiction)
        dismiss(animated: true, completion: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        questionOneText.text = contradiction.first.question.text
        questionTwoText.text = contradiction.second.question.text
        reasonText.text = contradiction.reason
    }
    
}
