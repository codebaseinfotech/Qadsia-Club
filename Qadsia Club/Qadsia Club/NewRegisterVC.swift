//
//  NewRegisterVC.swift
//  Qadsia
//
//  Created by Ankit Gabani on 26/03/26.
//

import UIKit

class NewRegisterVC: UIViewController {
    
    @IBOutlet weak var viewConfirmBtn: UIView!
    @IBOutlet weak var txtFName: UITextField!
    @IBOutlet weak var txtLName: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtConfirmPassword: UITextField!
    @IBOutlet weak var btnHidePassword: UIButton!
    @IBOutlet weak var btnHideConfirmPass: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        applyCutCornerMask(viewObject: viewConfirmBtn, cutSize: 12)
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
    
    @IBAction func tappedHidePassword(_ sender: UIButton) {
        sender.isSelected.toggle()
        txtPassword.isSecureTextEntry.toggle()
        
        let imageName = sender.isSelected ? "ic_open_eye" : "ic_close_eye"
        sender.setImage(UIImage(named: imageName), for: .normal)
    }
    
    @IBAction func tappedHideConfirmPass(_ sender: UIButton) {
        sender.isSelected.toggle()
        txtConfirmPassword.isSecureTextEntry.toggle()
        
        let imageName = sender.isSelected ? "ic_open_eye" : "ic_close_eye"
        sender.setImage(UIImage(named: imageName), for: .normal)
    }
    
    @IBAction func tappedConfirm(_ sender: Any) {
        let vc = VerificationCompletePopUp()
        vc.modalPresentationStyle = .overFullScreen
        self.present(vc, animated: false)
    }
    
}
