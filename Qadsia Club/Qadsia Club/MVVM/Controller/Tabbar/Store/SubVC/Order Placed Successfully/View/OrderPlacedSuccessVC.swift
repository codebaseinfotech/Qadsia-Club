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
    case returnOrderRequest
    case cancelOrder
    case ticketBooked
}

class OrderPlacedSuccessVC: UIViewController {
    
    @IBOutlet weak var lblOrderID: UILabel!
    @IBOutlet weak var lblDeliveryDays: UILabel!
    @IBOutlet weak var lblTitl: UILabel!
    @IBOutlet weak var btnViewDetails: UIButton!
    @IBOutlet weak var svMainTrackOrderBtn: UIStackView!
    @IBOutlet weak var viewOrdersMain: CutCornerView!
    
    var placeOrderSuccess: onPlaceOrderSuccess = .placeOrderSuccess
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        switch placeOrderSuccess {
        case .placeOrderSuccess:
            lblTitl.text = "Order Placed Successfully!"
            lblDeliveryDays.text = "Your order will be delivered in 5–7 business days."
            btnViewDetails.setTitle("View Orders", for: .normal)
            lblOrderID.isHidden = false
            svMainTrackOrderBtn.isHidden = true
            
        case .contactUs:
            lblTitl.text = "Contact Us"
            lblDeliveryDays.text = "Thanks for contacting us! Our support team has received your request and will get back to you within 24 hours."
            btnViewDetails.setTitle("Back to home", for: .normal)
            lblOrderID.isHidden = true
            svMainTrackOrderBtn.isHidden = true
            
        case .returnOrderRequest:
            lblTitl.text = "Return Requested Successfully"
            lblDeliveryDays.text = "Your return request for Order #QDS10210 has been submitted."
            lblOrderID.text = "Our courier partner will contact you within 24 hours to schedule pickup."
            btnViewDetails.setTitle("Back to Orders", for: .normal)
            lblOrderID.isHidden = false
            lblOrderID.numberOfLines = 0
            svMainTrackOrderBtn.isHidden = true
            
        case .cancelOrder:
            lblTitl.text = "Order Cancelled Successfully!"
            lblDeliveryDays.text = "Your refund will be processed within 5–7 business days after pickup."
            lblOrderID.text = "Order Id : #402-954235-1189906"
            viewOrdersMain.isHidden = true
            svMainTrackOrderBtn.isHidden = false
            
        case .ticketBooked:
            lblTitl.text = "Ticket Booked Successfully!"
            lblDeliveryDays.text = "Your Booking Reference number #1189906"
            lblOrderID.isHidden = true
            btnViewDetails.setTitle("View Ticket", for: .normal)
            svMainTrackOrderBtn.isHidden = true
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
            
        case .returnOrderRequest:
            AppDelegate.appDelegate.setUpHome()
            
        case .cancelOrder:
            break
            
        case .ticketBooked:
            let vc = MyTicketsVC()
            navigationController?.pushViewController(vc, animated: true)
        }
        
    }
    
    @IBAction func tappedBackToHome(_ sender: Any) {
        AppDelegate.appDelegate.setUpHome()
    }
    
    @IBAction func tappedTrackRefund(_ sender: Any) {
        let vc = RefundTrackVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
