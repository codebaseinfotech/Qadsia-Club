//
//  DropDownTVCell.swift
//  Qadsia
//
//  Created by Kenil on 02/04/26.
//

import UIKit

enum DropDownTVCellType {
    case dropDown
    case returnOrder
}

class DropDownTVCell: UITableViewCell {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var imgSelect: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func config(_ dropDownType: DropDownTVCellType = .dropDown) {
        switch dropDownType {
        case .dropDown:
            imgSelect.isHidden = true
        case .returnOrder:
            imgSelect.isHidden = false
        }
    }
    
}
