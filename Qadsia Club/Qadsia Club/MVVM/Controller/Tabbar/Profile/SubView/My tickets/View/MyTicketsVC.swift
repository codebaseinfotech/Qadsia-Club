//
//  MyTicketsVC.swift
//  Qadsia
//
//  Created by Poojagabani on 30/03/26.
//

import UIKit

class MyTicketsVC: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func tappedBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    

}
