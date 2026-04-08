//
//  CancelOrderVC.swift
//  Qadsia
//
//  Created by Poojagabani on 08/04/26.
//

import UIKit

class CancelOrderVC: UIViewController {
    
    @IBOutlet weak var lblOrderID: UILabel!
    @IBOutlet weak var imgProduct: UIImageView!
    @IBOutlet weak var lblProductName: UILabel!
    @IBOutlet weak var lblProductPrice: UILabel!
    @IBOutlet weak var txtViewNote: UITextView!
    @IBOutlet weak var lblPaymentCardDetail: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func tappedBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func tappedCopyOrderId(_ sender: Any) {
    }
    
    @IBAction func tappedCancelOrder(_ sender: Any) {
        let vc = OrderPlacedSuccessVC()
        vc.placeOrderSuccess = .cancelOrder
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func tappedKeepOrder(_ sender: Any) {
    }
    
    
}
