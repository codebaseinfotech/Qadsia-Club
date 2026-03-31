//
//  LegalInfoVC.swift
//  Qadsia
//
//  Created by Poojagabani on 31/03/26.
//

import UIKit

enum LegalInfoView {
    case matchList
    case termsAndConditions
    case helpAndSupport
    case privacyPolicy
}

class LegalInfoVC: UIViewController {
    
    @IBOutlet weak var tblViewList: UITableView! {
        didSet {
            tblViewList.addObserver(self,
                                    forKeyPath: "contentSize",
                                    options: .new,
                                    context: nil)
            tblViewList.register(LegalInfoTVCell.nib, forCellReuseIdentifier: LegalInfoTVCell.identifier)
            tblViewList.delegate = self
            tblViewList.dataSource = self
        }
    }
    @IBOutlet weak var heightTVList: NSLayoutConstraint!
    @IBOutlet weak var txtViewLegalInfo: UITextView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var viewMainLegalInfo: UIView!
    @IBOutlet weak var lblTitle: UILabel!
    
    var legalInfoView: LegalInfoView = .termsAndConditions
    
    // MARK: - View Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        switch legalInfoView {
        case .matchList:
            scrollView.isHidden = false
            viewMainLegalInfo.isHidden = true
            
            lblTitle.text = "Terms & Conditions"
        case .termsAndConditions:
            scrollView.isHidden = true
            viewMainLegalInfo.isHidden = false
            
            lblTitle.text = "Terms & Conditions"
        case .helpAndSupport:
            scrollView.isHidden = true
            viewMainLegalInfo.isHidden = false
            
            lblTitle.text = "Help & Support"
            
        case .privacyPolicy:
            scrollView.isHidden = true
            viewMainLegalInfo.isHidden = false
            
            lblTitle.text = "Privacy Policy"
        }
        
        // Do any additional setup after loading the view.
    }
    
    override func observeValue(forKeyPath keyPath: String?,
                               of object: Any?,
                               change: [NSKeyValueChangeKey : Any]?,
                               context: UnsafeMutableRawPointer?) {
        
        if keyPath == "contentSize" {
            heightTVList.constant = tblViewList.contentSize.height
        }
    }
    
    deinit {
        tblViewList.removeObserver(self, forKeyPath: "contentSize")
    }
    
    // MARK: - Action Method
    @IBAction func tappedBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    @IBAction func tappedAgree(_ sender: Any) {
    }
    
}

// MARK: - TV Delegate & DataSource
extension LegalInfoVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: LegalInfoTVCell.identifier) as! LegalInfoTVCell
        
        return cell
    }
    
    
}
