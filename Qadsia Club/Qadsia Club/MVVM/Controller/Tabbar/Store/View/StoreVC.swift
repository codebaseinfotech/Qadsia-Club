//
//  StoreVC.swift
//  Qadsia
//
//  Created by Poojagabani on 31/03/26.
//

import UIKit

class StoreVC: UIViewController {

    @IBOutlet weak var collectionViewList: UICollectionView! {
        didSet {
            collectionViewList.contentInset.bottom = 70
            collectionViewList.register(StoreCVCell.nib, forCellWithReuseIdentifier: StoreCVCell.identifier)
            collectionViewList.delegate = self
            collectionViewList.dataSource = self
        }
    }
    
    // MARK: - view Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    // MARK: - Action Method
    @IBAction func tappedSearch(_ sender: Any) {
    }
    @IBAction func tappedCategories(_ sender: Any) {
    }
    
    @IBAction func tappedTTicket(_ sender: Any) {
        let vc = TicketsVC()
        self.navigationController?.pushViewController(vc, animated: false)
    }
    @IBAction func tappedTNews(_ sender: Any) {
        let vc = NewsVC()
        self.navigationController?.pushViewController(vc, animated: false)
    }
    @IBAction func tappedTHome(_ sender: Any) {
        let vc = HomeVC()
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

// MARK: - CV Delegate & DataSource
extension StoreVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StoreCVCell.identifier, for: indexPath) as! StoreCVCell
        
        cell.clickedAddToCart = { [weak self] in
            if AppDelegate.appDelegate.isLogin == false {
                let vc = LoginMobileVC()
                self?.navigationController?.pushViewController(vc, animated: false)
            }
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = ProductDetailsVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
}

extension StoreVC: UICollectionViewDelegateFlowLayout {
    // MARK: - Section Insets
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 15, left: 20, bottom: 15, right: 20)
    }
    // MARK: - Minimum Line Spacing (Vertical)
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }
    
    // MARK: - Minimum Interitem Spacing (Horizontal)
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }
    
    // MARK:- sizeForItemAt
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.width - 60) / 2
        return CGSize(width: width, height: 246)
    }
    
}
