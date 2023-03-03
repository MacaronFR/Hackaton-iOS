//
//  FormulaireTableViewCell.swift
//  EqualPath
//
//  Created by macaron on 02/03/2023.
//

import UIKit

class FormulaireTableViewCell: UITableViewCell {

    @IBOutlet weak var question: UILabel!
    var questionId: String = ""

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
