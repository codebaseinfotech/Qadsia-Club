//
//  ProductDetailsVC.swift
//  Qadsia
//
//  Created by Poojagabani on 31/03/26.
//

import UIKit

class ProductDetailsVC: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView! {
        didSet {
            scrollView.contentInset.bottom = 100
        }
    }
    
    // MARK: - view Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    // MARK: - Action Method
    @IBAction func tappedBack(_ sender: Any) {
    }
    
}
