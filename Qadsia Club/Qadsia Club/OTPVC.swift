//
//  OTPVC.swift
//  Qadsia
//
//  Created by Ankit Gabani on 26/03/26.
//

import UIKit

enum OTPFlow {
    case login
    case resetPassword
}

class OTPVC: UIViewController {

    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var viewVerify: UIView!
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
        applyCutCornerMask(viewObject: viewVerify, cutSize: 12)

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
            .font: UIFont.systemFont(ofSize: 12, weight: .semibold),
            .foregroundColor: UIColor.gray
        ]

        let boldAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 12, weight: .bold),
            .foregroundColor: UIColor.black
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
    }

    func applyCutCornerMask(viewObject: UIView, cutSize: CGFloat) {
        let cut: CGFloat = cutSize
        let w = viewObject.bounds.width
        let h = viewObject.bounds.height

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

    @IBAction func btnBackTapped(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func tappedVerify(_ sender: Any) {
        let vc = NewRegisterVC()
        self.navigationController?.pushViewController(vc, animated: true)
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
