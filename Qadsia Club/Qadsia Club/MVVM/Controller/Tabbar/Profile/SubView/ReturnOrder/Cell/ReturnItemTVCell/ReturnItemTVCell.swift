//
//  ReturnItemTVCell.swift
//  Qadsia
//
//  Created by Kenil on 07/04/26.
//

import UIKit

class ReturnItemTVCell: UITableViewCell {

    @IBOutlet weak var imgSelect: UIImageView!
    @IBOutlet weak var imgProduct: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
