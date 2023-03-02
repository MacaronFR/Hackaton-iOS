//
//  EntrepriseDetailViewController.swift
//  EqualPath
//
//  Created by macaron on 01/03/2023.
//

import UIKit

class EntrepriseDetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        Test.text = "ID = \(id)"
        
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        Test.text = "ID = \(id)"
    }

    @IBOutlet weak var Test: UILabel!
    var id: Int = 0
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
