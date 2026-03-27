//
//  UpcomingMatchesCVCell.swift
//  Qadsia
//
//  Created by Kenil on 27/03/26.
//

import UIKit

class UpcomingMatchesCVCell: UICollectionViewCell {

    @IBOutlet weak var imgPick: UIImageView!
    @IBOutlet weak var lblDateTime: UILabel!
    
    @IBOutlet weak var imgFTeamLogo: UIImageView!
    @IBOutlet weak var lblFTeamName: UILabel!
    @IBOutlet weak var imgSTeamLogo: UIImageView!
    @IBOutlet weak var lblSTeamName: UILabel!
    @IBOutlet weak var lblWithIn: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBAction func tappedBookNow(_ sender: Any) {
    }
    
}
