//
//  OrderPlacedSuccessVC.swift
//  Qadsia
//
//  Created by Poojagabani on 06/04/26.
//

import UIKit

class OrderPlacedSuccessVC: UIViewController {
    
    @IBOutlet weak var lblOrderID: UILabel!
    @IBOutlet weak var lblDeliveryDays: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func tappedViewOrders(_ sender: Any) {
        let vc = MyOrdersVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    

}
