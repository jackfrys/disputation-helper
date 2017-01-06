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
    
    @IBOutlet var textView: UITextView!
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let a = disputation.topAdox(number: 3)
        let s = "\(a[0].question.text)\n\(a[0].adoxReason())\n\n\(a[1].question.text)\n\(a[1].adoxReason())\n\n\(a[2].question.text)\n\(a[2].adoxReason())"
        textView.text = s
    }
}
