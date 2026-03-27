//
//  SentOTPPopupVC.swift
//  Qadsia
//
//  Created by Ankit Gabani on 26/03/26.
//

import UIKit

enum OTPFlow {
    case login
    case resetPassword
    case newRegistration
    case sendResetOtp
    case sentSuccessOtp
}

class SentOTPPopupVC: UIViewController {

    @IBOutlet weak var viewPopup: UIView!
    @IBOutlet weak var btnClose: UIButton!
    @IBOutlet weak var viewClose: UIView!
    @IBOutlet weak var svTopCon: NSLayoutConstraint!
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblSubTitle: UILabel!
    
    @IBOutlet weak var btnProceed: UIButton!
    @IBOutlet weak var imgPic: UIImageView!
    @IBOutlet weak var widthConProcee: NSLayoutConstraint!
    
    var onProceed: ((OTPFlow) -> Void)?
    var flow: OTPFlow = .login
    
    // MARK: - view Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUIText()
    }
    
    // MARK: - User func
    func setUpUIText() {
        switch flow {
        case .login:
            imgPic.image = "ic_success".image
            
            lblTitle.text = "We just sent an OTP to your mobile"
            lblSubTitle.text = "On the next screen, enter the verification code to complete your registration"
            
            btnProceed.setTitle("Proceed", for: [])
        case .resetPassword:
            imgPic.image = "ic_success".image
            lblTitle.text = "We just sent an OTP to your mobile"
            lblSubTitle.text = "On the next screen, enter the verification code to reset your password."
            
            btnProceed.setTitle("Proceed", for: [])
            
        case .newRegistration:
            imgPic.image = "ic_success".image
            lblTitle.text = "Verification Process\nComplete!"
            lblSubTitle.text = ""
            lblSubTitle.isHidden = true
            viewClose.isHidden = true
            svTopCon.constant = 30
            
            btnProceed.setTitle("Book Now", for: [])
        case .sendResetOtp:
            imgPic.image = "ic_resend_img".image
            lblTitle.text = "You may only request\nOTP Resend After 3 Seconds!"
            lblSubTitle.text = ""
            lblSubTitle.isHidden = true
            widthConProcee.constant = 240
            
            btnProceed.setTitle("Send Verification Code", for: [])
        case .sentSuccessOtp:
            imgPic.image = "ic_success".image
            lblTitle.text = "A verification code has been sent to your phone."
            lblSubTitle.text = ""
            lblSubTitle.isHidden = true

            btnProceed.setTitle("Proceed", for: [])
        }
    }
    

    // MARK: - Action Method
    @IBAction func btnCloseTapped(_ sender: UIButton) {
        dismiss(animated: true)
    }

    @IBAction func btnProceedTapped(_ sender: UIButton) {
        if flow == .newRegistration {
            AppManager.shared.loginFlow = .newUser
        }
        dismiss(animated: true) { [weak self] in
            guard let self = self else { return }
            self.onProceed?(self.flow)
        }
    }
}
