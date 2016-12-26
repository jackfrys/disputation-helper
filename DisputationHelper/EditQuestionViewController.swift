//
//  EditQuestionViewController.swift
//  DisputationHelper
//
//  Created by Jack Frysinger on 12/25/16.
//  Copyright © 2016 Jack Frysinger. All rights reserved.
//

import UIKit

class EditQuestionViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func backButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
