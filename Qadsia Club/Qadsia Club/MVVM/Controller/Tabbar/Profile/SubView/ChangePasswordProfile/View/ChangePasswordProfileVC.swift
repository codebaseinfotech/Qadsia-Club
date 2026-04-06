//
//  ChangePasswordProfileVC.swift
//  Qadsia
//
//  Created by Kenil on 06/04/26.
//

import UIKit

class ChangePasswordProfileVC: UIViewController {

    @IBOutlet weak var txtOldPassword: UITextField!
    @IBOutlet weak var txtNewPassword: UITextField!
    @IBOutlet weak var txtConfirmPasswrod: UITextField!
    
    // MARK: - view Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: - Action Method
    @IBAction func tappedBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func tappedOldPassword(_ sender: UIButton) {
        sender.isSelected.toggle()
        txtOldPassword.isSecureTextEntry.toggle()
        
        let imageName = sender.isSelected ? "ic_open_eye" : "ic_close_eye"
        sender.setImage(UIImage(named: imageName), for: .normal)
    }
    @IBAction func tappedNewPassword(_ sender: UIButton) {
        sender.isSelected.toggle()
        txtNewPassword.isSecureTextEntry.toggle()
        
        let imageName = sender.isSelected ? "ic_open_eye" : "ic_close_eye"
        sender.setImage(UIImage(named: imageName), for: .normal)
    }
    @IBAction func tappedConfimPassword(_ sender: UIButton) {
        sender.isSelected.toggle()
        txtConfirmPasswrod.isSecureTextEntry.toggle()
        
        let imageName = sender.isSelected ? "ic_open_eye" : "ic_close_eye"
        sender.setImage(UIImage(named: imageName), for: .normal)
    }
    
    @IBAction func tappedSave(_ sender: Any) {
    }
    
}
