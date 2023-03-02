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
        cell.Label.text = companies[indexPath.row].name
        cell.ssiret.text = "SIRET : \(companies[indexPath.row].siret)"
        cell.id = companies[indexPath.row].id
        cell.buildings = companies[indexPath.row].buildings
        return cell
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        companies.count
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "EntrepriseToBatiment"){
            let cell = sender as! EntrepriseViewCellTableViewCell
            let vc = segue.destination as! BatimentViewController
            vc.id = cell.id
            vc.buildings = cell.buildings
        }
    }

    var companies: [Entreprises] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self

        ManageEntrepriseViewModel().returnListEntreprise { result in
            switch result {
                case .success(let res):
                    self.companies = res
                case .failure(let err):
                    NSLog(err.localizedDescription)
            }
            DispatchQueue.main.async {
                do {
                    self.companies = try result.get()
                    self.tableView.reloadData()
                }catch {
                    NSLog("Ah non")
                }
            }
        }
        // Do any additional setup after loading the view.
    }
}
