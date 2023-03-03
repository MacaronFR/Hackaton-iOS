//
//  FormulaireTableViewCell.swift
//  EqualPath
//
//  Created by macaron on 02/03/2023.
//

import UIKit

class FormulaireTableViewCell: UITableViewCell {

    @IBOutlet weak var reponse: UISegmentedControl!
    @IBOutlet weak var question: UILabel!
    var questionId: String = ""
    var buildingId: String = ""
    var note : Int? = nil

    @IBAction func segmentedControlAction(sender: Any?){
        let control = sender as! UISegmentedControl
        if(control.selectedSegmentIndex == 0){
            note = 0
        }else if(control.selectedSegmentIndex == 1){
            note = 25
        } else if (control.selectedSegmentIndex == 2) {
            note = 50
        } else if (control.selectedSegmentIndex == 3) {
            note = 75
        } else if (control.selectedSegmentIndex == 4) {
            note = 100
        }
        if let note = note{
            ManageQuestionViewModel().sendResponse(questionId: questionId, buildingId: buildingId, note: note)
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
