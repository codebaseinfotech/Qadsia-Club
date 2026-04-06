//
//  TrackOrderVC.swift
//  Qadsia
//
//  Created by Poojagabani on 06/04/26.
//

import UIKit

class TrackOrderVC: UIViewController {
    
    @IBOutlet weak var lblOrderId: UILabel!
    @IBOutlet weak var svOrderConfirm: UIStackView!
    @IBOutlet weak var viewOrderConfirmImg: UIView!
    @IBOutlet weak var imgOrderConfirm: UIImageView!
    @IBOutlet weak var lblOrderConfirmDate: UILabel!
    @IBOutlet weak var viewFirstDash: UIView!
    @IBOutlet weak var svPacked: UIStackView!
    @IBOutlet weak var viewPackedImg: UIView!
    @IBOutlet weak var imgPacked: UIImageView!
    @IBOutlet weak var lblPackedDate: UILabel!
    @IBOutlet weak var viewSecondDash: UIView!
    @IBOutlet weak var svShipped: UIStackView!
    @IBOutlet weak var viewShippedImg: UIView!
    @IBOutlet weak var imgShipped: UIImageView!
    @IBOutlet weak var lblShippedDate: UILabel!
    @IBOutlet weak var viewThirdDash: UIView!
    @IBOutlet weak var svDelivery: UIStackView!
    @IBOutlet weak var viewDeliveryImg: UIView!
    @IBOutlet weak var imgDelivery: UIImageView!
    @IBOutlet weak var lblDeliveryDate: UILabel!
    @IBOutlet weak var viewFourthDash: UIView!
    @IBOutlet weak var svCancelled: UIStackView!
    @IBOutlet weak var viewCancelledImg: UIView!
    @IBOutlet weak var imgCancelled: UIImageView!
    @IBOutlet weak var lblCancelledDate: UILabel!
    @IBOutlet weak var viewFifthDash: UIView!
    @IBOutlet weak var svReturnRequested: UIStackView!
    @IBOutlet weak var viewReturnRequestedImg: UIView!
    @IBOutlet weak var imgReturnRequested: UIImageView!
    @IBOutlet weak var lblReturnRequestedDate: UILabel!
    @IBOutlet weak var viewSixthDash: UIView!
    @IBOutlet weak var svReturnApproved: UIStackView!
    @IBOutlet weak var viewReturnApprovedImg: UIView!
    @IBOutlet weak var imgReturnApproved: UIImageView!
    @IBOutlet weak var lblReturnApprovedDate: UILabel!
    @IBOutlet weak var viewSeventhDash: UIView!
    @IBOutlet weak var svOrderPickedUp: UIStackView!
    @IBOutlet weak var viewOrderPickedUpImg: UIView!
    @IBOutlet weak var imgOrderPickedUp: UIImageView!
    @IBOutlet weak var lblOrderPickedUpDate: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func tappedBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func tappedCopy(_ sender: Any) {
    }
    
}
