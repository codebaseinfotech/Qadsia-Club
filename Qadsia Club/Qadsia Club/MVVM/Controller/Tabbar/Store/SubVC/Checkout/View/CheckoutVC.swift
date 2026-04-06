//
//  CheckoutVC.swift
//  Qadsia
//
//  Created by Poojagabani on 02/04/26.
//

import UIKit

class CheckoutVC: UIViewController {

    
    @IBOutlet weak var scrollView: UIScrollView! {
        didSet {
            scrollView.contentInset.bottom = 80
        }
    }
    
    @IBOutlet weak var btnChangePersonalDetails: UIButton!
    @IBOutlet weak var btnChangeShippingDetails: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUnderlineToButton()
        // Do any additional setup after loading the view.
    }
    
    func setUnderlineToButton() {
        let title = "Change"
        
        let attributedString = NSAttributedString(
            string: title,
            attributes: [
                .underlineStyle: NSUnderlineStyle.single.rawValue,
                .underlineColor: #colorLiteral(red: 0.9921568627, green: 0.7254901961, blue: 0.07843137255, alpha: 1),
                .foregroundColor: #colorLiteral(red: 0.007843137255, green: 0.007843137255, blue: 0.007843137255, alpha: 1)
            ]
        )
        
        btnChangePersonalDetails.setAttributedTitle(attributedString, for: .normal)
        btnChangeShippingDetails.setAttributedTitle(attributedString, for: .normal)
    }

    @IBAction func tappedBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func tappedChangeShoppingAddess(_ sender: Any) {
        let vc = SelectDeliveryAddressVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func tappedOrderConfirm(_ sender: Any) {
        let vc = OrderPlacedSuccessVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
