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
    
    var edit: Bool = false {
        didSet {
            navBar.items?[0].title = edit ? "Edit Disputation" : "Add Disputation"
        }
    }
    
    @IBAction func backButton(_ sender: Any) {
        disputation.defendant = defendant.text
        disputation.opponent = opponent.text
        view.removeFromSuperview()
    }
}
