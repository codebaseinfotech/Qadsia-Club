//
//  StoreCVCell.swift
//  Qadsia
//
//  Created by Kenil on 30/03/26.
//

import UIKit

class StoreCVCell: UICollectionViewCell {

    @IBOutlet weak var imgPic: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    
    var clickedAddToCart: (() -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBAction func tappedAddtoCart(_ sender: Any) {
        clickedAddToCart?()
    }
    
}
