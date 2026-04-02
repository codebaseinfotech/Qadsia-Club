//
//  ProductCartListTVCell.swift
//  Qadsia
//
//  Created by Poojagabani on 02/04/26.
//

import UIKit

class ProductCartListTVCell: UITableViewCell {

    @IBOutlet weak var imgProduct: UIImageView!
    @IBOutlet weak var lblProductName: UILabel!
    @IBOutlet weak var lblSize: UILabel!
    @IBOutlet weak var lblProductDis: UILabel!
    @IBOutlet weak var btnTrash: UIButton!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblCount: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func tappedTrash(_ sender: Any) {
    }
    
    @IBAction func tappedMinus(_ sender: Any) {
    }
    
    @IBAction func tappedPlus(_ sender: Any) {
    }
    
}
