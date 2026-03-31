//
//  TicketTVCell.swift
//  Qadsia
//
//  Created by Kenil on 31/03/26.
//

import UIKit

class TicketTVCell: UITableViewCell {

    @IBOutlet weak var imgLogo: UIImageView!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblStadium: UILabel!
    @IBOutlet weak var lblMatches: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func tappedLetMe(_ sender: Any) {
    }
    
}
