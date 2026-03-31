//
//  MatchListVC.swift
//  Qadsia
//
//  Created by Poojagabani on 31/03/26.
//

import UIKit

class MatchListVC: UIViewController {

    @IBOutlet weak var tblViewList: UITableView! {
        didSet {
            tblViewList.register(MatchListTVCell.nib, forCellReuseIdentifier: MatchListTVCell.identifier)
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
    @IBAction func tappedBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    

     
}

// MARK: - TV Delegate & DataSource
extension MatchListVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MatchListTVCell.identifier) as! MatchListTVCell
        
        cell.clickedBookNow = {
            let vc = LegalInfoVC()
            vc.legalInfoView = .matchList
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
        return cell
     }
    
    
}
