//
//  ContactUsVC.swift
//  Qadsia
//
//  Created by Kenil on 06/04/26.
//

import UIKit

class ContactUsVC: UIViewController {

    @IBOutlet weak var txtFName: UITextField!
    @IBOutlet weak var lblCountryCode: UILabel!
    @IBOutlet weak var txtMobileNumber: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtMessage: UITextView!
    
    // MARK: - view Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: - Action Method
    @IBAction func tappedBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func tappedCountryCode(_ sender: Any) {
    }
    @IBAction func tappedSubmit(_ sender: Any) {
    }
    

     

}
