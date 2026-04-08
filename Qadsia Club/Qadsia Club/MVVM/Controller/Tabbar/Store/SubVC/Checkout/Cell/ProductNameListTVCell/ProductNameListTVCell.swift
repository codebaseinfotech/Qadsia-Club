//
//  ProductNameListTVCell.swift
//  Qadsia
//
//  Created by Poojagabani on 08/04/26.
//

import UIKit

class ProductNameListTVCell: UITableViewCell {
    
    @IBOutlet weak var lblProductName: UILabel!
    @IBOutlet weak var lblProductPrice: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
