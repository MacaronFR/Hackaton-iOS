//
//  BatimentTableViewCell.swift
//  EqualPath
//
//  Created by macaron on 02/03/2023.
//

import UIKit

class BatimentTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var selectedQuestion: UILabel!
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
