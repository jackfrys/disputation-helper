//
//  MainViewController.swift
//  DisputationHelper
//
//  Created by Jack Frysinger on 12/1/16.
//  Copyright © 2016 Jack Frysinger. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        table.reloadData()
    }

    var disputations = [Disputation]()
    
    @IBOutlet var table: UITableView!
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let c = UITableViewCell.init(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        let d = disputations[indexPath.row]
        
        c.textLabel?.text = d.thesis
        return c
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return disputations.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let editView = storyboard.instantiateViewController(withIdentifier: "EditDisputationViewController") as! EditDisputationViewController
        editView.disputation = disputations[indexPath.row]
        editView.edit = true
        // editView.loadView()
        self.present(editView, animated: true, completion: nil)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! EditDisputationViewController
        let newDisputation = Disputation()
        disputations.append(newDisputation)
        vc.disputation = newDisputation
        vc.edit = false
    }
}

