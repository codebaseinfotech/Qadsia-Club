//
//  ProfileVC.swift
//  Qadsia
//
//  Created by Poojagabani on 27/03/26.
//

import UIKit

class ProfileVC: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView! {
        didSet {
            scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 100, right: 0)
        }
    }
    @IBOutlet weak var imgUserProfile: UIImageView!
    @IBOutlet weak var lblUserName: UILabel!
    @IBOutlet weak var lblUserMail: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    // MARK: - Tabbar Action
    @IBAction func tappedTHome(_ sender: Any) {
        let vc = HomeVC()
        navigationController?.pushViewController(vc, animated: false)
    }
    
    @IBAction func tappedTTicket(_ sender: Any) {
        let vc = TicketsVC()
        self.navigationController?.pushViewController(vc, animated: false)
    }
    
    @IBAction func tappedTNews(_ sender: Any) {
        let vc = NewsVC()
        self.navigationController?.pushViewController(vc, animated: false)
    }
    
    @IBAction func tappedTStore(_ sender: Any) {
        let vc = StoreVC()
        self.navigationController?.pushViewController(vc, animated: false)
    }
    
    // MARK: - Action
    @IBAction func tappedEditProfile(_ sender: Any) {
        let vc = EditProfileVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func tappedMyTicket(_ sender: Any) {
        let vc = MyTicketsVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func tappedMyOrder(_ sender: Any) {
    }
    
    @IBAction func tappedSavedAddress(_ sender: Any) {
    }
    
    @IBAction func tappedChangePass(_ sender: Any) {
    }
    
    @IBAction func tappedHelpAndSupport(_ sender: Any) {
        let vc = LegalInfoVC()
        vc.legalInfoView = .helpAndSupport
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func tappedContactUs(_ sender: Any) {
    }
    
    @IBAction func tappedTerm(_ sender: Any) {
        let vc = LegalInfoVC()
        vc.legalInfoView = .termsAndConditions
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func tappedPrivacyPolicy(_ sender: Any) {
        let vc = LegalInfoVC()
        vc.legalInfoView = .privacyPolicy
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func tappedLogout(_ sender: Any) {
        let vc = DeleteAddressPopUpVC()
        vc.modalPresentationStyle = .overFullScreen
        vc.onPopupAction = .logout
        self.present(vc, animated: false)
    }
    
    
}
