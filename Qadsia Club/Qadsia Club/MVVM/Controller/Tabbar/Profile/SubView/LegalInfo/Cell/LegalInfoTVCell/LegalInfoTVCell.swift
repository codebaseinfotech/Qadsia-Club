//
//  LegalInfoTVCell.swift
//  Qadsia
//
//  Created by Poojagabani on 31/03/26.
//

import UIKit

class LegalInfoTVCell: UITableViewCell {

    @IBOutlet weak var lblMsg: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
