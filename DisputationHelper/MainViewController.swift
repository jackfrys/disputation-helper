//
//  MainViewController.swift
//  DisputationHelper
//
//  Created by Jack Frysinger on 12/1/16.
//  Copyright © 2016 Jack Frysinger. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, RemoteLoadingDelegate {

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
    
    func recievedDisputation(disputation: Disputation) {
        disputations.append(disputation)
        table.performSelector(onMainThread: #selector(table.reloadData), with: nil, waitUntilDone: false)
    }
    
    @IBAction func load(_ sender: Any) {
        let alert = UIAlertController(title: "Enter information", message: nil, preferredStyle: UIAlertControllerStyle.alert)
        var idField: UITextField? = nil
        alert.addTextField(configurationHandler: {(a) in
            a.placeholder = "Disputation ID"
            idField = a
        })
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Go", style: UIAlertActionStyle.default, handler: {(action) in
            let remote = RemoteLoading()
            remote.delegate = self
            let loc = idField!.text!
            remote.load(loc: loc)
        }))
        present(alert, animated: true, completion: nil)
    }
}

