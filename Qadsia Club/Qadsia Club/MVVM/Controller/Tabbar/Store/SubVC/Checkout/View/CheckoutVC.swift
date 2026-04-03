//
//  CheckoutVC.swift
//  Qadsia
//
//  Created by Poojagabani on 02/04/26.
//

import UIKit

class CheckoutVC: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView! {
        didSet {
            scrollView.contentInset.bottom = 80
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func tappedBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
