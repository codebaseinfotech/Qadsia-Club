//
//  NotificationVC.swift
//  Qadsia
//
//  Created by Kenil on 30/03/26.
//

import UIKit

class NotificationVC: UIViewController {

    @IBOutlet weak var lblCategories: UILabel!
    @IBOutlet weak var tblViewList: UITableView! {
        didSet {
            tblViewList.register(NotificationListTVCell.nib, forCellReuseIdentifier: NotificationListTVCell.identifier)
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
    @IBAction func tappedCategories(_ sender: Any) {
    }
    

     

}

// MARK: - TV Delegate & DataSource
extension NotificationVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NotificationListTVCell.identifier) as! NotificationListTVCell
        
        return cell
    }
    
}
