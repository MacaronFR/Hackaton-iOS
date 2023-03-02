//
//  EntrepriseViewCellTableViewCell.swift
//  EqualPath
//
//  Created by macaron on 01/03/2023.
//

import UIKit

class EntrepriseViewCellTableViewCell: UITableViewCell {

    @IBOutlet weak var Label: UILabel!

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
