//
//  NewRegisterVC.swift
//  Qadsia
//
//  Created by Ankit Gabani on 26/03/26.
//

import UIKit

class NewRegisterVC: UIViewController {
    
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
        let popupVC = SentOTPPopupVC()
        popupVC.modalPresentationStyle = .overFullScreen
        popupVC.modalTransitionStyle = .crossDissolve
        popupVC.flow = .newRegistration
        popupVC.onProceed = { [weak self] flow in
           
            AppManager.shared.loginFlow = .existingUser
            
            AppDelegate.appDelegate.setUpLogin()
        }
        present(popupVC, animated: true)
    }
    
}
