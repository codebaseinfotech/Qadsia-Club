//
//  DeleteAddressPopUpVC.swift
//  Qadsia
//
//  Created by Poojagabani on 03/04/26.
//

import UIKit

enum onPopupAction {
    case deleteAddress
    case logout
}

class DeleteAddressPopUpVC: UIViewController {

    @IBOutlet weak var imgPic: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblSubTitle: UILabel!
    @IBOutlet weak var btnYes: UIButton!
    @IBOutlet weak var btnNo: UIButton!
    
    var onPopupAction: onPopupAction = .deleteAddress
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        switch onPopupAction {
        case .deleteAddress:
            imgPic.image = "img_delete".image
            lblTitle.text = "Delete Address"
            lblSubTitle.isHidden = true
            
            btnYes.setTitle("Yes", for: [])
            btnNo.setTitle("No", for: [])
            
        case .logout:
            imgPic.image = "ic_logout 1".image
            lblTitle.text = "Logout ?"
            lblSubTitle.text = "You’ll be signed out of your account. Log back in anytime to manage tickets, orders, and your fan profile."
            lblSubTitle.isHidden = false
            lblSubTitle.numberOfLines = 0
            
            btnYes.setTitle("Logout", for: [])
            btnNo.setTitle("Cancel", for: [])
            
        }

        // Do any additional setup after loading the view.
    }

    @IBAction func tappedNo(_ sender: Any) {
        self.dismiss(animated: false)
    }
    
    @IBAction func tappedYes(_ sender: Any) {
    }
    

}
