//
//  FormulaireViewController.swift
//  EqualPath
//
//  Created by macaron on 02/03/2023.
//

import UIKit

class FormulaireViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var liste: UITableView!
    
    var buildingId: String = ""
    var questions: [Question] = []

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FormulaireCell") as! FormulaireTableViewCell
        cell.questionId = questions[indexPath.row].id
        cell.question.text = questions[indexPath.row].text
        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        questions.count
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        liste.delegate = self
        liste.dataSource = self

        ManageQuestionViewModel().returnListEntreprise { result in
            switch result {
            case .success(let res):
                self.questions = res
            case .failure(let err):
                NSLog(err.localizedDescription)
            }
            DispatchQueue.main.async {
                do {
                    self.questions = try result.get()
                    self.liste.reloadData()
                } catch {
                    NSLog("Ah non")
                }
            }
        }
    }
}
