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
    var isMeasure: Bool = false

    @IBOutlet weak var rC: NSLayoutConstraint!
    @IBOutlet weak var toAr: UIButton!
    @IBOutlet weak var control: UISegmentedControl!
    @IBAction func segmentedControlAction(sender: Any?){
        if(control.selectedSegmentIndex == 0) {
            note = 0
        } else if(control.selectedSegmentIndex == 1 && isMeasure == true){
            note = 100
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

    func changeMeasure(){
        if (isMeasure == true) {
            rC.constant = 100.0
            toAr.isHidden = false
            control.removeAllSegments()
            control.insertSegment(withTitle: "Non", at: 0, animated: true)
            control.insertSegment(withTitle: "Oui", at: 1, animated: true)
        }else {
            rC.constant = 0.0
            toAr.isHidden = true
            control.removeAllSegments()
            control.insertSegment(withTitle: "Pas du tout", at: 0, animated: true)
            control.insertSegment(withTitle: "Un peu", at: 1, animated: true)
            control.insertSegment(withTitle: "Moyen", at: 2, animated: true)
            control.insertSegment(withTitle: "Bien", at: 3, animated: true)
            control.insertSegment(withTitle: "Très bien", at: 4, animated: true)
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
