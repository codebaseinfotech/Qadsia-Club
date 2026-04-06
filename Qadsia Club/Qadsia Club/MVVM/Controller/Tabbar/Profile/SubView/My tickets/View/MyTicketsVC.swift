//
//  MyTicketsVC.swift
//  Qadsia
//
//  Created by Poojagabani on 30/03/26.
//

import UIKit

class MyTicketsVC: UIViewController {
    
    @IBOutlet weak var tblViewList: UITableView! {
        didSet {
            tblViewList.register(MyTicketListTVCell.nib, forCellReuseIdentifier: MyTicketListTVCell.identifier)
            tblViewList.delegate = self
            tblViewList.dataSource = self
        }
    }
    
    // MARK: - view Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    // MARK: - Action Method
    @IBAction func tappedBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    

}

// MARK: - TV Delegate & DataSource
extension MyTicketsVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MyTicketListTVCell.identifier) as! MyTicketListTVCell
        
        
        cell.onHeightUpdate = {
            DispatchQueue.main.async {
                tableView.beginUpdates()
                tableView.endUpdates()
            }
        }
        
        return cell
    }
    
}
