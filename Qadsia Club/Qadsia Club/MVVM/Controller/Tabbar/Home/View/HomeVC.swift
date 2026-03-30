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
            
            tblViewList.showsVerticalScrollIndicator = false
            tblViewList.showsHorizontalScrollIndicator = false
        }
    }
    
    // MARK: - view Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if  AppDelegate.appDelegate.isLogin == true {
            lblUserName.text = "Welcome, Ahmed"
         }
        else {
            lblUserName.text = "Welcome, Guest"
         }
    }

    // MARK: - Action Method
    @IBAction func tappedCart(_ sender: Any) {
    }
    @IBAction func tappedNotification(_ sender: Any) {
        let vc = NotificationVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    // Tabbar Action
    @IBAction func tappedTTicket(_ sender: Any) {
    }
    @IBAction func tappedTNews(_ sender: Any) {
    }
    @IBAction func tappedTStore(_ sender: Any) {
    }
    @IBAction func tappedTProfile(_ sender: Any) {
        if  AppDelegate.appDelegate.isLogin == true {
            let vc = ProfileVC()
            navigationController?.pushViewController(vc, animated: false)
        }
        else {
            let vc = LoginMobileVC()
            navigationController?.pushViewController(vc, animated: false)
        }
        
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
        
        switch indexPath.section {
        case 0: cell.type = .upcomingMatches
        case 1: cell.type = .trendyNews
        case 2: cell.type = .store
        default:
            cell.type = .upcomingMatches
        }
        
        cell.onHeightUpdate = {
            DispatchQueue.main.async {
                tableView.beginUpdates()
                tableView.endUpdates()
            }
        }
        
        cell.onBookNowTapped = { [weak self] in
            if AppDelegate.appDelegate.isLogin == false {
                let vc = LoginMobileVC()
                self?.navigationController?.pushViewController(vc, animated: false)
            }
        }
        
        return cell
        
    }
    
    // footer height
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.5
    }
    
    // header height
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 35
    }
    
    // headerView
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = Bundle.main.loadNibNamed("HomeHeaderView", owner: nil, options: nil)?.first as? HomeHeaderView
        
        headerView?.btnSeeAll.isHidden = section == 0 ? true : false
        
        switch section {
        case 0: headerView?.lblName.text = "Upcoming matches"
        case 1: headerView?.lblName.text = "Trendy News"
        case 2: headerView?.lblName.text = "Store"
        default: break
        }
        
        return headerView
    }
}
