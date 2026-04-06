//
//  MyTicketListTVCell.swift
//  Qadsia
//
//  Created by Poojagabani on 30/03/26.
//

import UIKit

class MyTicketListTVCell: UITableViewCell {

    @IBOutlet weak var lblBookingId: UILabel!
    @IBOutlet weak var imgPic: UIImageView!
    @IBOutlet weak var imgTeamLogo: UIImageView!
    @IBOutlet weak var lblStadium: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblTickitCount: UILabel!
    @IBOutlet weak var tblView: UITableView! {
        didSet {
            tblView.register(AllTicketHolderTVCell.nib, forCellReuseIdentifier: AllTicketHolderTVCell.identifier)
            tblView.delegate = self
            tblView.dataSource = self
        }
    }
    @IBOutlet weak var heightTV: NSLayoutConstraint!
    
    var onHeightUpdate: (() -> Void)?
    // MARK: - view Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        
        DispatchQueue.main.async {
            self.tblView.reloadData()
            self.updateCollectionViewHeight()
        }
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        updateCollectionViewHeight()
    }
    
    func updateCollectionViewHeight() {
        tblView.layoutIfNeeded()
        let height = tblView.contentSize.height
        
        if heightTV.constant != height {
            heightTV.constant = height
            onHeightUpdate?() // 🔥 notify tableview
        }
    }
    
    // MARK: - Action Method
    @IBAction func tappedSmsTicket(_ sender: Any) {
    }
    @IBAction func tappedShowTicket(_ sender: Any) {
    }
    
}

// MARK: - TV Delegate & DataSource
extension MyTicketListTVCell: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AllTicketHolderTVCell.identifier) as! AllTicketHolderTVCell
        
        return cell
    }
    
}
