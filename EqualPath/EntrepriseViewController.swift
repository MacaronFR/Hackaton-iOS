//
//  EntrpriseViewController.swift
//  EqualPath
//
//  Created by macaron on 01/03/2023.
//

import UIKit

class EntrepriseViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EntrepriseCell") as! EntrepriseViewCellTableViewCell
        cell.Label.text = "Ligne très très très longue \(indexPath.row)"
        cell.id = indexPath.row
        return cell
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "EntrepriseToBatiment"){
            let cell = sender as! EntrepriseViewCellTableViewCell
            let vc = segue.destination as! BatimentViewController
            vc.id = cell.id
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
}
