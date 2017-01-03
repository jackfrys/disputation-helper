//
//  StrikeQuestionViewController.swift
//  DisputationHelper
//
//  Created by Jack Frysinger on 12/26/16.
//  Copyright © 2016 Jack Frysinger. All rights reserved.
//

import UIKit

class StrikeQuestionViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var questionTable: UITableView!
    
    var disputation: Disputation!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return disputation.answerCount
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        disputation.strike(answer: disputation.answer(index: indexPath.row))
        dismiss(animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let c = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        c.textLabel?.text = disputation.answer(index: indexPath.row).question.text
        return c
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        questionTable.reloadData()
        questionTable.dataSource = self
        questionTable.delegate = self
    }
}
