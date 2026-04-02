//
//  KeepShoppingPopUpVC.swift
//  Qadsia
//
//  Created by Poojagabani on 02/04/26.
//

import UIKit

class KeepShoppingPopUpVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func tappedClose(_ sender: Any) {
        self.dismiss(animated: false)
    }
    
    @IBAction func tappedCheckout(_ sender: Any) {
        let vc = ShoppingCartVC()
        
        self.dismiss(animated: false) {
            if let nav = UIApplication.shared.windows.first?.rootViewController as? UINavigationController {
                nav.pushViewController(vc, animated: true)
            }
        }
    }
    
    @IBAction func tappedKeepShopping(_ sender: Any) {
    }
    
    
}
