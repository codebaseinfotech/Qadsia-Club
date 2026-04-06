//
//  NewsVC.swift
//  Qadsia
//
//  Created by Poojagabani on 31/03/26.
//

import UIKit

class NewsVC: UIViewController {

    @IBOutlet weak var tblViewList: UITableView! {
        didSet {
            tblViewList.contentInset.bottom = 70
            tblViewList.rowHeight = UITableView.automaticDimension
            tblViewList.estimatedRowHeight = 300
            tblViewList.register(HomeListTVCell.nib, forCellReuseIdentifier: HomeListTVCell.identifier)
            tblViewList.register(AllNewsTVCell.nib, forCellReuseIdentifier: AllNewsTVCell.identifier)
            tblViewList.delegate = self
            tblViewList.dataSource = self
            
            tblViewList.showsVerticalScrollIndicator = false
            tblViewList.showsHorizontalScrollIndicator = false
        }
    }
    @IBOutlet weak var viewDropDown: DropDownView!
    @IBOutlet weak var imgDropDown: UIImageView!
    @IBOutlet weak var lblDropName: UILabel!
    @IBOutlet weak var heightTVDropDwon: NSLayoutConstraint!
    
    var isSelectedDrop: Bool = false
    
    // MARK: - view Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        updateDropdownHeight()
        
        // Do any additional setup after loading the view.
    }
    
    // MARK: - set TV height
    func updateDropdownHeight() {
        let rowHeight: CGFloat = 44
        let maxHeight: CGFloat = 236
        
        let calculatedHeight = CGFloat(8) * rowHeight
        let finalHeight = min(calculatedHeight, maxHeight)
        
        heightTVDropDwon.constant = finalHeight
        tblViewList.isScrollEnabled = calculatedHeight > maxHeight
    }

    // MARK: - Action Method
    @IBAction func tappedCategories(_ sender: UIButton) {
        isSelectedDrop.toggle()
        imgDropDown.image = isSelectedDrop ? "ic_up_drop".image : "ic_dropDown".image
        viewDropDown.isHidden = !isSelectedDrop
    }
    
    @IBAction func tappedTTickeer(_ sender: Any) {
        let vc = TicketsVC()
        self.navigationController?.pushViewController(vc, animated: false)
    }
    @IBAction func tappedTHom(_ sender: Any) {
        let vc = HomeVC()
        self.navigationController?.pushViewController(vc, animated: false)
    }
    @IBAction func tappedStore(_ sender: Any) {
        let vc = StoreVC()
        self.navigationController?.pushViewController(vc, animated: false)
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

// MARK: - TV Delegate & DataSource
extension NewsVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: HomeListTVCell.identifier) as! HomeListTVCell
            cell.type = .newsTab
            cell.onHeightUpdate = {
                DispatchQueue.main.async {
                    tableView.beginUpdates()
                    tableView.endUpdates()
                }
            }
            
            cell.onCellTap = { [weak self] tableIndex in
                guard let self = self else { return }
                let vc = NewsDetailsVC()
                self.navigationController?.pushViewController(vc, animated: true)
                
            }
            
            return cell
            
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: AllNewsTVCell.identifier) as! AllNewsTVCell
            
            return cell
            
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 1:
            let vc = NewsDetailsVC()
            self.navigationController?.pushViewController(vc, animated: true)
            
        default:
            break
        }
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
        
        headerView?.btnSeeAll.isHidden = true
        
        switch section {
        case 0: headerView?.lblName.text = "Trendy News"
        case 1: headerView?.lblName.text = "All News"
        default: break
        }
        
        return headerView
    }
    
    
}
