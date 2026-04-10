//
//  OTPVC.swift
//  Qadsia
//
//  Created by Ankit Gabani on 26/03/26.
//

import UIKit

class OTPVC: UIViewController {

    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var lblPhoneNumber: UILabel!
    @IBOutlet weak var lblResendOTP: UILabel!
    @IBOutlet weak var otpFieldView: OTPFieldView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var btnVerify: UIButton!
    
    var phoneNumber: String = ""
    var enteredOTP: String = ""
    private var isOTPInitialized = false
    
    var flow: OTPFlow = .login

    override func viewDidLoad() {
        super.viewDidLoad()
        lblPhoneNumber.text = phoneNumber
        setupResendLabel()
        configureOTPFieldView()
        configureUI()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        if !isOTPInitialized {
            isOTPInitialized = true
            otpFieldView.initializeUI()
        }
    }
    
    private func configureUI() {
        switch flow {
        case .login:
            lblTitle.text = "Verify Mobile Number"
            btnVerify.setTitle("Verify", for: .normal)
            
        case .resetPassword:
            lblTitle.text = "Reset Password"
            btnVerify.setTitle("Reset password", for: .normal)
            
        case .newRegistration: break
        case .sendResetOtp: break
        case .sentSuccessOtp: break
        case .agreeCondition: break
            
        }
    }

    private func configureOTPFieldView() {
        otpFieldView.fieldsCount = 4
        otpFieldView.fieldBorderWidth = 1.5
        otpFieldView.defaultBorderColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0) // Light gray border
        otpFieldView.filledBorderColor = UIColor(red: 0.99, green: 0.73, blue: 0.08, alpha: 1.0) // Yellow/orange border
        otpFieldView.defaultBackgroundColor = UIColor(red: 0.96, green: 0.96, blue: 0.96, alpha: 1.0) // Light gray background
        otpFieldView.filledBackgroundColor = UIColor.white
        otpFieldView.cursorColor = UIColor.black
        otpFieldView.displayType = .roundedCorner
        otpFieldView.fieldSize = 50
        otpFieldView.separatorSpace = 16
        otpFieldView.fieldFont = UIFont.systemFont(ofSize: 18, weight: .medium)
        otpFieldView.shouldAllowIntermediateEditing = true
        otpFieldView.delegate = self
    }

    private func setupResendLabel() {
        let fullText = "Did not receive OTP? Resend OTP"
        let attributedString = NSMutableAttributedString(string: fullText)

        let normalAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.AppFont.semiBold(14),
            .foregroundColor: #colorLiteral(red: 0.5019607843, green: 0.5019607843, blue: 0.5019607843, alpha: 1)
        ]

        let boldAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.AppFont.bold(14),
            .foregroundColor: #colorLiteral(red: 0.007843137255, green: 0.007843137255, blue: 0.007843137255, alpha: 1)
        ]

        attributedString.addAttributes(normalAttributes, range: NSRange(location: 0, length: fullText.count))

        if let range = fullText.range(of: "Resend OTP") {
            let nsRange = NSRange(range, in: fullText)
            attributedString.addAttributes(boldAttributes, range: nsRange)
        }

        lblResendOTP.attributedText = attributedString

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(resendOTPTapped))
        lblResendOTP.addGestureRecognizer(tapGesture)
    }

    @objc private func resendOTPTapped() {
        // Handle resend OTP action
        print("Resend OTP tapped")
        
        let popupVC = SentOTPPopupVC()
        popupVC.modalPresentationStyle = .overFullScreen
        popupVC.modalTransitionStyle = .crossDissolve
        popupVC.flow = .sendResetOtp
        popupVC.onProceed = { [weak self] flow in
            let popupVC = SentOTPPopupVC()
            popupVC.modalPresentationStyle = .overFullScreen
            popupVC.modalTransitionStyle = .crossDissolve
            popupVC.flow = .sentSuccessOtp
            self?.present(popupVC, animated: true)
        }
        present(popupVC, animated: true)
    }

    @IBAction func btnBackTapped(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func tappedVerify(_ sender: Any) {
        
        switch AppManager.shared.loginFlow {
        case .existingUser:
            
            let vc = ChangePassowrdVC()
            self.navigationController?.pushViewController(vc, animated: true)
            
        case .newUser:
 
            let vc = NewRegisterVC()
            self.navigationController?.pushViewController(vc, animated: true)

            
        }
        
//        switch flow {
//        case .login: break
//        case .resetPassword:
//            let vc = ChangePassowrdVC()
//            self.navigationController?.pushViewController(vc, animated: true)
//            
//        case .newRegistration:
//            let vc = NewRegisterVC()
//            self.navigationController?.pushViewController(vc, animated: true)
//            
//        case .sendResetOtp: break
//            
//        case .sentSuccessOtp: break
//    
//        }
        
    //    let vc = NewRegisterVC()
    //    self.navigationController?.pushViewController(vc, animated: true)

    }
    
}

// MARK: - OTPFieldViewDelegate
extension OTPVC: OTPFieldViewDelegate {
    func shouldBecomeFirstResponderForOTP(otpTextFieldIndex index: Int) -> Bool {
        return true
    }

    func enteredOTP(otp: String) {
        enteredOTP = otp
        print("Entered OTP: \(otp)")
    }

    func hasEnteredAllOTP(hasEnteredAll: Bool) -> Bool {
        return hasEnteredAll
    }
}
