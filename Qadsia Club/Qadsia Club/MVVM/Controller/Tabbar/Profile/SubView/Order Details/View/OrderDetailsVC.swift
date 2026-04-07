//
//  OrderDetailsVC.swift
//  Qadsia
//
//  Created by Poojagabani on 06/04/26.
//

import UIKit

class OrderDetailsVC: UIViewController {
    
    @IBOutlet weak var lblOrderID: UILabel!
    @IBOutlet weak var tblViewOrderList: UITableView! {
        didSet {
            tblViewOrderList.addObserver(self, forKeyPath: "contentSize", options: .new,
                                    context: nil)
            tblViewOrderList.register(OrderDetailsListTVCell.nib, forCellReuseIdentifier: OrderDetailsListTVCell.identifier)
            tblViewOrderList.delegate = self
            tblViewOrderList.dataSource = self
        }
    }
    @IBOutlet weak var heightConstTblView: NSLayoutConstraint!
    @IBOutlet weak var lblRefundOn: UILabel!
    @IBOutlet weak var lblDeliveredDateMain: UILabel!
    @IBOutlet weak var lblOrderConfirmedDate: UILabel!
    @IBOutlet weak var lblDeliveredDate: UILabel!
    @IBOutlet weak var lblCancellationReason: UILabel!
    @IBOutlet weak var svMainCancellationDetails: UIStackView!
    @IBOutlet weak var textViewWriteReview: UITextView!
    @IBOutlet weak var viewMainWriteReview: UIView!
    @IBOutlet weak var viewMainYourReview: UIView!
    @IBOutlet weak var lblDeliveryPlaceType: UILabel!
    @IBOutlet weak var lblDeliveryAddress: UILabel!
    @IBOutlet weak var lblUserName: UILabel!
    @IBOutlet weak var lblSubTotal: UILabel!
    @IBOutlet weak var lblCouponDiscount: UILabel!
    @IBOutlet weak var lblShipping: UILabel!
    @IBOutlet weak var lblTotal: UILabel!
    @IBOutlet weak var imgCardType: UIImageView!
    @IBOutlet weak var lblCardName: UILabel!
    @IBOutlet weak var imgCompanyLogo: UIImageView!
    @IBOutlet weak var svMainReturnOrder: UIStackView!
    @IBOutlet weak var lblReturnEligibility: UILabel!
    @IBOutlet weak var lblLastChanceCancel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func observeValue(forKeyPath keyPath: String?,
                               of object: Any?,
                               change: [NSKeyValueChangeKey : Any]?,
                               context: UnsafeMutableRawPointer?) {
        
        if keyPath == "contentSize" {
            heightConstTblView.constant = tblViewOrderList.contentSize.height
        }
    }
    
    deinit {
        tblViewOrderList.removeObserver(self, forKeyPath: "contentSize")
    }

    @IBAction func tappedTrackRefund(_ sender: Any) {
    }
    
    @IBAction func tappedSeeAllTrackUpdate(_ sender: Any) {
    }
    
    @IBAction func tappedDownloadInvoice(_ sender: Any) {
    }
    
    @IBAction func tappedReturnOrder(_ sender: Any) {
    }
    
    @IBAction func tappedCancelOrder(_ sender: Any) {
    }
    
    
}

extension OrderDetailsVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tblViewOrderList.dequeueReusableCell(withIdentifier: "OrderDetailsListTVCell") as! OrderDetailsListTVCell
        
        return cell
    }
    
}
