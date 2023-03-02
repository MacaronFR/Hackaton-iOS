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
        return cell
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
