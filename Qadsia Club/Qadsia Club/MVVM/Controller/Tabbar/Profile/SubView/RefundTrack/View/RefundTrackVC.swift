//
//  RefundTrackVC.swift
//  Qadsia
//
//  Created by Kenil on 07/04/26.
//

import UIKit

class RefundTrackVC: UIViewController {

    @IBOutlet weak var viewContactUs: ContactUsView! {
        didSet {
            viewContactUs.config(.helpAndSupport)
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
