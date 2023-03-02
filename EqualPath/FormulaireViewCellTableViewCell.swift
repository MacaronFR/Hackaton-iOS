//
//  FormulaireViewCellTableViewCell.swift
//  EqualPath
//
//  Created by Maaz TAGELDIN on 02/03/2023.
//

import UIKit

class FormulaireViewCellTableViewCell: UITableViewCell {
    //@IBOutlet weak var selectedQuestion: UILabel!
    
    @IBOutlet weak var selectedQuestion: UITableView!
    
    var id: Int = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
