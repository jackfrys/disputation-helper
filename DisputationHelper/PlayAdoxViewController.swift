//
//  PlayAdoxViewController.swift
//  DisputationHelper
//
//  Created by Jack Frysinger on 12/27/16.
//  Copyright © 2016 Jack Frysinger. All rights reserved.
//

import UIKit

class PlayAdoxViewController: UIViewController {
    
    var disputation: Disputation!

    @IBOutlet var questionOneLabel: UILabel!
    @IBOutlet var questionTwoLabel: UILabel!
    @IBOutlet var questionThreeLabel: UILabel!
    
    @IBOutlet var questionOneReason: UITextView!
    @IBOutlet var questionTwoReason: UITextView!
    @IBOutlet var questionThreeReason: UITextView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let a = disputation.topAdox(number: 3)
        questionOneLabel.text = a[0].question.text
        questionOneReason.text = a[0].adoxReason()
        
        questionTwoLabel.text = a[1].question.text
        questionTwoReason.text = a[1].adoxReason()
        
        questionThreeLabel.text = a[2].question.text
        questionThreeReason.text = a[2].adoxReason()
    }
}
