//
//  EditProfileVC.swift
//  Qadsia
//
//  Created by Poojagabani on 30/03/26.
//

import UIKit

class EditProfileVC: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView! {
        didSet {
            scrollView.contentInset.bottom = 80
        }
    }
    @IBOutlet weak var imgUser: UIImageView!
    
    @IBOutlet weak var txtFirstName: UITextField!
    @IBOutlet weak var txtLastName: UITextField!
    @IBOutlet weak var txtPhoneNum: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func tappedBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func tappedChangeUserImage(_ sender: Any) {
    }
    
    @IBAction func tappedSaveChanges(_ sender: Any) {
    }
    
}
