//
//  ShoppingCartVC.swift
//  Qadsia
//
//  Created by Poojagabani on 02/04/26.
//

import UIKit

class ShoppingCartVC: UIViewController {

    @IBOutlet weak var tblViewProductCartList: UITableView! {
        didSet {
            tblViewProductCartList.addObserver(self, forKeyPath: "contentSize", options: .new,
                                    context: nil)
            tblViewProductCartList.register(UINib(nibName: "ProductCartListTVCell", bundle: nil), forCellReuseIdentifier: "ProductCartListTVCell")
            tblViewProductCartList.dataSource = self
            tblViewProductCartList.delegate = self
        }
    }
    @IBOutlet weak var heightConstTblViewList: NSLayoutConstraint!
    
    @IBOutlet weak var scrollView: UIScrollView! {
        didSet {
            scrollView.contentInset.bottom = 90
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func observeValue(forKeyPath keyPath: String?,
                               of object: Any?,
                               change: [NSKeyValueChangeKey : Any]?,
                               context: UnsafeMutableRawPointer?) {
        
        if keyPath == "contentSize" {
            heightConstTblViewList.constant = tblViewProductCartList.contentSize.height
        }
    }
    
    deinit {
        tblViewProductCartList.removeObserver(self, forKeyPath: "contentSize")
    }

    @IBAction func tappedBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func tappedCheckout(_ sender: Any) {
        let vc = CheckoutVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension ShoppingCartVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tblViewProductCartList.dequeueReusableCell(withIdentifier: "ProductCartListTVCell", for: indexPath) as! ProductCartListTVCell
        return cell
    }
    
}
