//
//  OrderPlacedSuccessVC.swift
//  Qadsia
//
//  Created by Poojagabani on 06/04/26.
//

import UIKit


enum onPlaceOrderSuccess {
    case placeOrderSuccess
    case contactUs
}

class OrderPlacedSuccessVC: UIViewController {
    
    @IBOutlet weak var lblOrderID: UILabel!
    @IBOutlet weak var lblDeliveryDays: UILabel!
    @IBOutlet weak var lblTitl: UILabel!
    @IBOutlet weak var btnViewDetails: UIButton!
    
    var placeOrderSuccess: onPlaceOrderSuccess = .placeOrderSuccess
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        switch placeOrderSuccess {
        case .placeOrderSuccess:
            lblTitl.text = "Order Placed Successfully!"
            lblDeliveryDays.text = "Your order will be delivered in 5–7 business days."
            btnViewDetails.setTitle("View Orders", for: .normal)
            lblOrderID.isHidden = false
            
        case .contactUs:
            lblTitl.text = "Contact Us"
            lblDeliveryDays.text = "Thanks for contacting us! Our support team has received your request and will get back to you within 24 hours."
            btnViewDetails.setTitle("Back to home", for: .normal)
            lblOrderID.isHidden = true
            
        }

        // Do any additional setup after loading the view.
    }

    @IBAction func tappedViewOrders(_ sender: Any) {
        switch placeOrderSuccess {
        case .placeOrderSuccess:
            let vc = MyOrdersVC()
            navigationController?.pushViewController(vc, animated: true)
            
        case .contactUs:
            AppDelegate.appDelegate.setUpHome()
            
        }
        
    }
    

}
