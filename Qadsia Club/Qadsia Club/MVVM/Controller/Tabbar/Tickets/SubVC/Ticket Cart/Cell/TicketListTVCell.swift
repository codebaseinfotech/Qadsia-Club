//
//  TicketListTVCell.swift
//  Qadsia
//
//  Created by Poojagabani on 09/04/26.
//

import UIKit

enum TicketSection {
    case ticketCart
    case ticketInfo
    case orderSummary
}

class TicketListTVCell: UITableViewCell {
    
    @IBOutlet weak var svName: UIStackView!
    @IBOutlet weak var svMainTicketInfo: UIStackView!
    @IBOutlet weak var imgTicketIcon: UIImageView!
    @IBOutlet weak var svSameInfoCheck: UIStackView!

    var sectionType: TicketSection = .ticketCart

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(with type: TicketSection) {
        sectionType = type
        
        switch type {
            
        case .ticketCart:
            svName.isHidden = true
            svMainTicketInfo.isHidden = true
            svSameInfoCheck.isHidden = true
            imgTicketIcon.image = UIImage(named: "ic_seat")
            
        case .ticketInfo:
            svName.isHidden = true
            svMainTicketInfo.isHidden = false
            svSameInfoCheck.isHidden = false
            imgTicketIcon.image = UIImage(named: "ic_seat")
            
        case .orderSummary:
            svName.isHidden = true
            svMainTicketInfo.isHidden = false
            svSameInfoCheck.isHidden = true
            imgTicketIcon.image = UIImage(named: "ic_seat")
        }
    }
    
}
