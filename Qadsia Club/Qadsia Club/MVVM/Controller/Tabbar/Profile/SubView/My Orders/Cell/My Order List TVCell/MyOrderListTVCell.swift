//
//  MyOrderListTVCell.swift
//  Qadsia
//
//  Created by Poojagabani on 06/04/26.
//

import UIKit

class MyOrderListTVCell: UITableViewCell {
    
    @IBOutlet weak var lblDeliveryStatus: UILabel!
    @IBOutlet weak var lblDeliveryTime: UILabel!
    @IBOutlet weak var tblViewProductsList: UITableView! {
        didSet {
            tblViewProductsList.register(ProductsListTVCell.nib, forCellReuseIdentifier: ProductsListTVCell.identifier)
            tblViewProductsList.delegate = self
            tblViewProductsList.dataSource = self
        }
    }
    @IBOutlet weak var heightConstProductsList: NSLayoutConstraint!
    @IBOutlet weak var btnTrackOrder: UIButton!
    @IBOutlet weak var btnOrderDetails: UIButton!
    
    var onHeightUpdate: (() -> Void)?
    var onTrackOrder: (() -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        DispatchQueue.main.async {
            self.tblViewProductsList.reloadData()
            self.updateTableViewHeight()
        }
        // Initialization code
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        updateTableViewHeight()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateTableViewHeight() {
        tblViewProductsList.layoutIfNeeded()
        let height = tblViewProductsList.contentSize.height
        
        if heightConstProductsList.constant != height {
            heightConstProductsList.constant = height
            onHeightUpdate?()
        }
    }
    
    @IBAction func tappedTrackOrder(_ sender: Any) {
        onTrackOrder?()
    }
    
    @IBAction func tappedOrderDetails(_ sender: Any) {
    }
    
    
}

extension MyOrderListTVCell: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tblViewProductsList.dequeueReusableCell(withIdentifier: "ProductsListTVCell") as! ProductsListTVCell
        
        return cell
    }
    
}
