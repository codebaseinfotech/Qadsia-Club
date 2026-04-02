//
//  ProductListCVCell.swift
//  Qadsia
//
//  Created by Poojagabani on 01/04/26.
//

import UIKit

enum ShowProductInfo {
    case productMain
    case productList
}

class ProductListCVCell: UICollectionViewCell {

    @IBOutlet weak var imgProductMain: UIImageView!
    @IBOutlet weak var imgProductList: UIImageView!
    @IBOutlet weak var imgBg: UIImageView!
    
    var productType: ShowProductInfo = .productMain {
        didSet {
            updateUI()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        updateUI()
        // Initialization code
    }

    private func updateUI() {
        switch productType {
        case .productMain:
            imgProductMain.isHidden = false
            imgBg.isHidden = false
            imgProductList.isHidden = true
            
        case .productList:
            imgProductMain.isHidden = true
            imgBg.isHidden = true
            imgProductList.isHidden = false
        }
    }
    
}
