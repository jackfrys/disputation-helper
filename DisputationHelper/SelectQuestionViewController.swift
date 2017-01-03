//
//  SelectQuestionViewController.swift
//  DisputationHelper
//
//  Created by Jack Frysinger on 12/25/16.
//  Copyright © 2016 Jack Frysinger. All rights reserved.
//

import UIKit

class SelectQuestionViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var contradiction: Contradiction!
    var disputation: Disputation!
    var answer: Bool!
    var first = true

    @IBOutlet var questionTable: UITableView!

    @IBAction func backButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return disputation.questionCount
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if first {
            contradiction.first = disputation.question(index: indexPath.row).answer(answer: answer)
        } else {
            contradiction.second = disputation.question(index: indexPath.row).answer(answer: answer)
        }
        dismiss(animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let c = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        c.textLabel?.text = disputation.question(index: indexPath.row).text
        return c
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questionTable.dataSource = self
        questionTable.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        questionTable.reloadData()
    }
}
