//
//  Batiment.swift
//  EqualPath
//
//  Created by macaron on 02/03/2023.
//

import UIKit

class BatimentViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var liste: UITableView!

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BatimentCell") as! BatimentTableViewCell
        cell.adresse.text = buildings[indexPath.row].address
        cell.nom.text = buildings[indexPath.row].name
        cell.id = buildings[indexPath.row].id
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "BatimentToFormulaire"){
            let cell = sender as! BatimentTableViewCell
            let vc = segue.destination as! FormulaireViewController
            vc.buildingId = cell.id
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        buildings.count
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        liste.delegate = self
        liste.dataSource = self
    }

    var id: String = ""
    var buildings: [Batiment] = []

}
