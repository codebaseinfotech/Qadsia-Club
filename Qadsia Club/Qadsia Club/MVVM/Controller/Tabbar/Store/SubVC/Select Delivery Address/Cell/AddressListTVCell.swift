//
//  AddressListTVCell.swift
//  Qadsia
//
//  Created by Poojagabani on 03/04/26.
//

import UIKit

class AddressListTVCell: UITableViewCell {
    
    @IBOutlet weak var lblPlaceType: UILabel!
    @IBOutlet weak var btnEditAddress: UIButton!
    @IBOutlet weak var btnDeleteAdd: UIButton!
    @IBOutlet weak var lblAddress: UILabel!
    
    var onDeleteTapped: (() -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func tappedEditAdd(_ sender: Any) {
    }
    
    @IBAction func tappedDeleteAdd(_ sender: Any) {
        onDeleteTapped?()
    }
    
    
}
