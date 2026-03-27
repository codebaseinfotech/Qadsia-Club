//
//  HomeListTVCell.swift
//  Qadsia
//
//  Created by Kenil on 27/03/26.
//

import UIKit

class HomeListTVCell: UITableViewCell {

    @IBOutlet weak var collectionViewList: UICollectionView! {
        didSet {
            collectionViewList.register(UpcomingMatchesCVCell.nib, forCellWithReuseIdentifier: UpcomingMatchesCVCell.identifier)
            collectionViewList.delegate = self
            collectionViewList.dataSource = self
        }
    }
    @IBOutlet weak var heightCollectionView: NSLayoutConstraint!
    
    var onHeightUpdate: (() -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        DispatchQueue.main.async {
            self.collectionViewList.reloadData()
            self.updateCollectionViewHeight()
        }
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        updateCollectionViewHeight()
    }

    func updateCollectionViewHeight() {
        collectionViewList.layoutIfNeeded()
        let height = collectionViewList.collectionViewLayout.collectionViewContentSize.height
        
        if heightCollectionView.constant != height {
            heightCollectionView.constant = height
            onHeightUpdate?() // 🔥 notify tableview
        }
    }
    
}

extension HomeListTVCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UpcomingMatchesCVCell.identifier, for: indexPath) as! UpcomingMatchesCVCell
        
        return cell
    }
    
    
}

extension HomeListTVCell: UICollectionViewDelegateFlowLayout {
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
        return 20
    }
    
    // MARK: - Minimum Interitem Spacing (Horizontal)
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    // MARK:- sizeForItemAt
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = collectionView.frame.width-40
        return CGSize(width: width, height: 258)
    }
    
}
