//
//  MatchListTVCell.swift
//  Qadsia
//
//  Created by Poojagabani on 31/03/26.
//

import UIKit

class MatchListTVCell: UITableViewCell {

    @IBOutlet weak var imgPic: UIImageView!
    @IBOutlet weak var lblStadium: UILabel!
    @IBOutlet weak var lblDateTime: UILabel!
    @IBOutlet weak var imgTeamPlayer: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func tappedBookNow(_ sender: Any) {
    }
    
}
