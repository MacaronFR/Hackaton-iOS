//
//  ListeBatimentViewController.swift
//  EqualPath
//
//  Created by Maaz TAGELDIN on 02/03/2023.
//

import UIKit

class ListeBatimentViewController: UIViewController {
    
    
    @IBOutlet weak var listBatiment: UITableView!
    @IBOutlet weak var page_title: UILabel!
    
    let batimentViewModel = ManageBatimentViewModel()
    var batiments: [BatimentSelection] = []
    var idEntreprise = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.listBatiment.dataSource = self
        self.listBatiment.delegate = self
        self.listBatiment.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        // Do any additional setup after loading the view.
        returnListBatiement(idEntreprise: String(describing: idEntreprise))
        
    }
    
    private func returnListBatiement(idEntreprise: String){
        batimentViewModel.returnListBatiment(idEntreprise: idEntreprise) { result in
            switch result {
            case .success(let data):
               //self.batiments = data.batiment
                DispatchQueue.main.async {
                    self.listBatiment.reloadData()
                }
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
            }
        }
    }
}

extension ListeBatimentViewController : UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return batiments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
       
        let batiment = batiments[indexPath.row]
        cell.textLabel?.text = NSLocalizedString("Nom du batiment", comment: "") + ": \(batiment.nom_batiment)\n" + NSLocalizedString("Ville", comment: "") + ": \(batiment.ville_batiment)"
        
        cell.textLabel?.numberOfLines = 0
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let batiment = batiments[indexPath.row]
        let id_batiment = batiment.id
        let destinationVC = FormulaireViewController()
        destinationVC.id_batiment = id_batiment
        self.navigationController?.pushViewController(destinationVC, animated: true)
    }
}

    
  
    
   

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

