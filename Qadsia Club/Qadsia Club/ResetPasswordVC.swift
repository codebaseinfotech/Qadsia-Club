//
//  ResetPasswordVC.swift
//  Qadsia
//
//  Created by Poojagabani on 26/03/26.
//

import UIKit

class ResetPasswordVC: UIViewController {

    @IBOutlet weak var txtPhoneNumber: UITextField!
    @IBOutlet weak var viewResetPass: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        applyCutCornerMask(viewObject: viewResetPass, cutSize: 12)
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

    @IBAction func tappedBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func tappedResetPass(_ sender: Any) {
        let phoneNumber = txtPhoneNumber.text ?? ""
        
        let popupVC = SentOTPPopupVC(nibName: "SentOTPPopupVC", bundle: nil)
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
