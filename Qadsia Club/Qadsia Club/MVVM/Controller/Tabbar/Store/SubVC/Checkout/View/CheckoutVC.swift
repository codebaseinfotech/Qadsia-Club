//
//  CheckoutVC.swift
//  Qadsia
//
//  Created by Poojagabani on 02/04/26.
//

import UIKit

class CheckoutVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func tappedBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
