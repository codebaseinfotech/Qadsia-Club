//
//  LoginMobileVC.swift
//  Qadsia Club
//
//  Created by Ankit Gabani on 14/02/26.
//

import UIKit

class LoginMobileVC: UIViewController {

    @IBOutlet weak var viewProceed: UIView!
    @IBOutlet weak var btnProceed: UIButton!
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var txtPhoneNumber: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var svMainPassword: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func btnBackTapped(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }

    @IBAction func btnProceedTapped(_ sender: UIButton) {
        let phoneNumber = txtPhoneNumber.text ?? ""
        
        let popupVC = SentOTPPopupVC(nibName: "SentOTPPopupVC", bundle: nil)
        popupVC.modalPresentationStyle = .overFullScreen
        popupVC.modalTransitionStyle = .crossDissolve
        
        popupVC.flow = .login   // ✅ IMPORTANT
        
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
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        applyCutCornerMask(viewObject: viewProceed, cutSize: 12)
    }

    func applyCutCornerMask(viewObject: AnyObject,cutSize:CGFloat) {

        let cut: CGFloat = cutSize
        let w = viewProceed.bounds.width
        let h = viewProceed.bounds.height

        let path = UIBezierPath()
        path.move(to: CGPoint(x: cut, y: 0))
        path.addLine(to: CGPoint(x: w, y: 0))
        path.addLine(to: CGPoint(x: w, y: h - cut))
        path.addLine(to: CGPoint(x: w - cut, y: h))
        path.addLine(to: CGPoint(x: 0, y: h))
        path.addLine(to: CGPoint(x: 0, y: cut))
        path.close()

        let maskLayer = CAShapeLayer()
        maskLayer.path = path.cgPath
        viewObject.layer.mask = maskLayer
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
