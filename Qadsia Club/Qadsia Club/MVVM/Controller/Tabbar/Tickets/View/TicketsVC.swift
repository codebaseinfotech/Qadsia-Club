//
//  TicketsVC.swift
//  Qadsia
//
//  Created by Kenil on 31/03/26.
//

import UIKit

class TicketsVC: UIViewController {

    @IBOutlet weak var tblViewList: UITableView! {
        didSet {
            tblViewList.register(TicketTVCell.nib, forCellReuseIdentifier: TicketTVCell.identifier)
            tblViewList.delegate = self
            tblViewList.dataSource = self
        }
    }
    
    // MARK: - View Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: - Action Method
    @IBAction func tappedTNews(_ sender: Any) {
    }
    @IBAction func tappedTHome(_ sender: Any) {
        let vc = HomeVC()
        self.navigationController?.pushViewController(vc, animated: false)
    }
    @IBAction func tappedTStore(_ sender: Any) {
    }
    @IBAction func tappedTProfile(_ sender: Any) {
        let vc = ProfileVC()
        self.navigationController?.pushViewController(vc, animated: false)
    }
    

    

}

// MARK: - TV Delagate & DataSource
extension TicketsVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TicketTVCell.identifier) as! TicketTVCell
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 172
    }
}
