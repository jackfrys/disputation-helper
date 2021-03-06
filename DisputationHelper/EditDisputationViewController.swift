//
//  EditDisputationViewController.swift
//  DisputationHelper
//
//  Created by Jack Frysinger on 12/20/16.
//  Copyright © 2016 Jack Frysinger. All rights reserved.
//

import Foundation
import UIKit

class EditDisputationViewController : UIViewController {
    
    @IBOutlet var navBar: UINavigationBar!
    
    @IBOutlet var thesis: UITextView!
    
    @IBOutlet var opponent: UITextField!
    @IBOutlet var defendant: UITextField!
    
    var disputation: Disputation!
    
    var edit: Bool = false
    
    @IBAction func backButton(_ sender: Any) {
        disputation.defendant = defendant.text
        disputation.opponent = opponent.text
        disputation.thesis = thesis.text
        dismiss(animated: true, completion: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navBar.items?[0].title = edit ? "Edit Disputation" : "Add Disputation"
        thesis.text = disputation.thesis
        opponent.text = disputation.opponent
        defendant.text = disputation.defendant
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination
        if let v = vc as? QuestionViewController {
            v.disputation = disputation
        } else if let v = vc as? ContradictionsViewController {
            v.disputation = disputation
        } else {
            let v = vc as! PlayDisputationViewController
            v.disputation = disputation
        }
    }
}
