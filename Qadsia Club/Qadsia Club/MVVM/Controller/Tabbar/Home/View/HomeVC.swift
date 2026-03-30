//
//  HomeVC.swift
//  Qadsia
//
//  Created by Kenil on 27/03/26.
//

import UIKit

class HomeVC: UIViewController {

    @IBOutlet weak var lblUserName: UILabel!
    @IBOutlet weak var tblViewList: UITableView! {
        didSet {
            tblViewList.contentInset.bottom = 50
            tblViewList.rowHeight = UITableView.automaticDimension
            tblViewList.estimatedRowHeight = 300
            tblViewList.register(HomeListTVCell.nib, forCellReuseIdentifier: HomeListTVCell.identifier)
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
    @IBAction func tappedCart(_ sender: Any) {
    }
    @IBAction func tappedNotification(_ sender: Any) {
    }
    
    // Tabbar Action
    @IBAction func tappedTTicket(_ sender: Any) {
    }
    @IBAction func tappedTNews(_ sender: Any) {
    }
    @IBAction func tappedTStore(_ sender: Any) {
    }
    @IBAction func tappedTProfile(_ sender: Any) {
    }
    
    
}

// MARK: - tv Delegate & DataSource
extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HomeListTVCell.identifier) as! HomeListTVCell
        
        cell.onHeightUpdate = {
            DispatchQueue.main.async {
                tableView.beginUpdates()
                tableView.endUpdates()
            }
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 35
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = Bundle.main.loadNibNamed("HomeHeaderView", owner: nil, options: nil)?.first as? HomeHeaderView
        
        headerView?.btnSeeAll.isHidden = section == 0 ? false : true
        
        switch section {
        case 0: headerView?.lblName.text = "Upcoming matches"
        case 1: headerView?.lblName.text = "Trendy News"
        case 2: headerView?.lblName.text = "Store"
        default: break
        }
        
        return headerView
    }
}
