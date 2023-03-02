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
        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        liste.delegate = self
        liste.dataSource = self

        // Do any additional setup after loading the view.
    }

    var id = 0

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
