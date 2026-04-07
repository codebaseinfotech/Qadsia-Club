//
//  MyOrdersVC.swift
//  Qadsia
//
//  Created by Poojagabani on 06/04/26.
//

import UIKit

class MyOrdersVC: UIViewController {

    @IBOutlet weak var tblViewOrdersList: UITableView! {
        didSet {
            tblViewOrdersList.register(MyOrderListTVCell.nib, forCellReuseIdentifier: MyOrderListTVCell.identifier)
            tblViewOrdersList.dataSource = self
            tblViewOrdersList.delegate = self
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

extension MyOrdersVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tblViewOrdersList.dequeueReusableCell(withIdentifier: "MyOrderListTVCell") as! MyOrderListTVCell
        
        cell.onHeightUpdate = {
            DispatchQueue.main.async {
                tableView.beginUpdates()
                tableView.endUpdates()
            }
        }
        
        cell.onTrackOrder = {
            let vc = TrackOrderVC()
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
        cell.onOrderDetails = {
            let vc = OrderDetailsVC()
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
