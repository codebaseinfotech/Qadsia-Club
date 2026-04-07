//
//  OrderDetailsVC.swift
//  Qadsia
//
//  Created by Poojagabani on 06/04/26.
//

import UIKit

class OrderDetailsVC: UIViewController {
    
    @IBOutlet weak var lblOrderID: UILabel!
    @IBOutlet weak var tblViewOrderList: UITableView! {
        didSet {
            tblViewOrderList.register(OrderDetailsListTVCell.nib, forCellReuseIdentifier: OrderDetailsListTVCell.identifier)
            tblViewOrderList.delegate = self
            tblViewOrderList.dataSource = self
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }



}

extension OrderDetailsVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tblViewOrderList.dequeueReusableCell(withIdentifier: "OrderDetailsListTVCell") as! OrderDetailsListTVCell
        
        return cell
    }
    
}
