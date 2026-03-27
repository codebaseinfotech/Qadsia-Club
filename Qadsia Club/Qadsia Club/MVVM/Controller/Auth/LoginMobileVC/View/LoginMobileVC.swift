//
//  LoginMobileVC.swift
//  Qadsia Club
//
//  Created by Ankit Gabani on 14/02/26.
//

import UIKit

enum LoginFlow {
    case newUser
    case existingUser
}

class LoginMobileVC: UIViewController {

    @IBOutlet weak var btnProceed: UIButton!
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var txtPhoneNumber: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var svMainPassword: UIStackView!
    
    // MARK: - view Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpLoginFlow()
        
    }
    
    // MARK: - User Func
    func setUpLoginFlow() {
        switch AppManager.shared.loginFlow {
        case .existingUser:
            svMainPassword.isHidden = true
            
        case .newUser:
            svMainPassword.isHidden = false
            
        }
    }

    // MARK: - Action Method
    @IBAction func btnBackTapped(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }

    @IBAction func btnProceedTapped(_ sender: UIButton) {
        let phoneNumber = txtPhoneNumber.text ?? ""
        
        let popupVC = SentOTPPopupVC()
        popupVC.modalPresentationStyle = .overFullScreen
        popupVC.modalTransitionStyle = .crossDissolve
        popupVC.flow = .login
        popupVC.onProceed = { [weak self] flow in
            self?.navigateToOTPVC(phoneNumber: phoneNumber, flow: flow)
        }
        
        present(popupVC, animated: true)
    }

    private func navigateToOTPVC(phoneNumber: String, flow: OTPFlow) {
        let otpVC = OTPVC(nibName: "OTPVC", bundle: nil)
        otpVC.phoneNumber = "+965 " + phoneNumber
        otpVC.flow = flow
        navigationController?.pushViewController(otpVC, animated: true)
    }

    @IBAction func tappedForgotPassword(_ sender: Any) {
        let vc = ResetPasswordVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func tappedHidePassword(_ sender: UIButton) {
        sender.isSelected.toggle()
        txtPassword.isSecureTextEntry.toggle()
        
        let imageName = sender.isSelected ? "ic_open_eye" : "ic_close_eye"
        sender.setImage(UIImage(named: imageName), for: .normal)
    }
    
}
