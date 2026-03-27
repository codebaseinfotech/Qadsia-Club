//
//  ResetPasswordVC.swift
//  Qadsia
//
//  Created by Poojagabani on 26/03/26.
//

import UIKit

class ResetPasswordVC: UIViewController {

    @IBOutlet weak var txtPhoneNumber: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func tappedBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func tappedResetPass(_ sender: Any) {
        let phoneNumber = txtPhoneNumber.text ?? ""
        
        let popupVC = SentOTPPopupVC()
        popupVC.modalPresentationStyle = .overFullScreen
        popupVC.modalTransitionStyle = .crossDissolve
        popupVC.flow = .resetPassword
        popupVC.onProceed = { [weak self] flow in
            let otpVC = OTPVC(nibName: "OTPVC", bundle: nil)
            otpVC.phoneNumber = "+965 " + phoneNumber
            otpVC.flow = flow   // ✅ IMPORTANT
            
            self?.navigationController?.pushViewController(otpVC, animated: true)
        }
        
        self.present(popupVC, animated: true)
    }
    
    
}
