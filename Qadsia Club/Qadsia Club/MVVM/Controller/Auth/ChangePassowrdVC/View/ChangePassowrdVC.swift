//
//  ChangePassowrdVC.swift
//  Qadsia
//
//  Created by Kenil on 27/03/26.
//

import UIKit

class ChangePassowrdVC: UIViewController {

    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtConfirmPassword: UITextField!
    
    // MARK: - view Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: - Action Method
    @IBAction func tappedBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func tappedPasswordShow(_ sender: UIButton) {
        sender.isSelected.toggle()
        txtPassword.isSecureTextEntry.toggle()
        
        let imageName = sender.isSelected ? "ic_open_eye" : "ic_close_eye"
        sender.setImage(UIImage(named: imageName), for: .normal)

    }
    @IBAction func tappedConfirmPasswordShow(_ sender: UIButton) {
        sender.isSelected.toggle()
        txtConfirmPassword.isSecureTextEntry.toggle()
        
        let imageName = sender.isSelected ? "ic_open_eye" : "ic_close_eye"
        sender.setImage(UIImage(named: imageName), for: .normal)
        
    }
    @IBAction func tappedSave(_ sender: Any) {
        AppDelegate.appDelegate.setUpLogin()
    }
    

  
    

}
