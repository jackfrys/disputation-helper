//
//  ContradictionsViewController.swift
//  DisputationHelper
//
//  Created by Jack Frysinger on 12/25/16.
//  Copyright © 2016 Jack Frysinger. All rights reserved.
//

import UIKit

class ContradictionsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var disputation: Disputation!

    @IBOutlet var contradictionTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        contradictionTable.delegate = self
        contradictionTable.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        contradictionTable.reloadData()
    }
    
    @IBAction func backButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let c = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        c.textLabel?.text = disputation.contradiction(index: indexPath.row).first.adoxReason()
        return c
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return disputation.contradictionCount
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! EditContradictionViewController
        vc.disputation = disputation
        vc.edit = false
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let editView = storyboard.instantiateViewController(withIdentifier: "EditContradictionViewController") as! EditContradictionViewController
        editView.disputation = disputation
        editView.contradiction = disputation.contradiction(index: indexPath.row)
        editView.edit = true
        self.present(editView, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            disputation.remove(contradiction: disputation.contradiction(index: indexPath.row))
            contradictionTable.deleteRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
        }
    }
}
