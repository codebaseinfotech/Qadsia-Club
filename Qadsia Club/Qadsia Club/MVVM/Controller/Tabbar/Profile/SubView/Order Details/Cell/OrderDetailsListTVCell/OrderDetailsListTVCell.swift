//
//  OrderDetailsListTVCell.swift
//  Qadsia
//
//  Created by Poojagabani on 07/04/26.
//

import UIKit

enum OrderDetails {
    case orderDetails
    case returnOrder
    case orderShipped
}

class OrderDetailsListTVCell: UITableViewCell {
    
    @IBOutlet weak var imgProduct: UIImageView!
    @IBOutlet weak var lblProductName: UILabel!
    @IBOutlet weak var lblProductPrice: UILabel!
    @IBOutlet weak var viewRating: HCSStarRatingView!
    @IBOutlet weak var svRatingMain: UIStackView!
    @IBOutlet weak var imgCheck: UIImageView!
        
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configOpen(_ orderDetails: OrderDetails = .orderDetails) {
        switch orderDetails {
        case .orderDetails:
            imgCheck.isHidden = true
            svRatingMain.isHidden = false
            
        case .returnOrder:
            imgCheck.isHidden = false
            svRatingMain.isHidden = true
            
        case .orderShipped:
            imgCheck.isHidden = true
            svRatingMain.isHidden = true
            
        }
    }
    
}
