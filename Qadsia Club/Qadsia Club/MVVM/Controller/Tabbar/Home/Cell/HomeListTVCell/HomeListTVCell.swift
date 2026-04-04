//
//  HomeListTVCell.swift
//  Qadsia
//
//  Created by Kenil on 27/03/26.
//

import UIKit

enum HomeListTVCellType {
    case upcomingMatches
    case trendyNews
    case store
    case newsTab
}

class HomeListTVCell: UITableViewCell {

    @IBOutlet weak var collectionViewList: UICollectionView! {
        didSet {
            collectionViewList.register(UpcomingMatchesCVCell.nib, forCellWithReuseIdentifier: UpcomingMatchesCVCell.identifier)
            collectionViewList.register(TrendyNewsCVCell.nib, forCellWithReuseIdentifier: TrendyNewsCVCell.identifier)
            collectionViewList.register(StoreCVCell.nib, forCellWithReuseIdentifier: StoreCVCell.identifier)
            collectionViewList.register(NewsListCVCell.nib, forCellWithReuseIdentifier: NewsListCVCell.identifier)
            collectionViewList.delegate = self
            collectionViewList.dataSource = self
        }
    }
    @IBOutlet weak var heightCollectionView: NSLayoutConstraint!
    
    var onHeightUpdate: (() -> Void)?
    var onBookNowTapped: (() -> Void)?
    var onCellTap: ((IndexPath) -> Void)?
    
    var type: HomeListTVCellType = .upcomingMatches {
        didSet {
            DispatchQueue.main.async {
                self.collectionViewList.reloadData()
                self.updateCollectionViewHeight()
            }
        }
    }
    
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
        switch type {
        case .upcomingMatches: return 1
        case .trendyNews: return 4
        case .store: return 4
        case .newsTab: return 4
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch type {
        case .upcomingMatches:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UpcomingMatchesCVCell.identifier, for: indexPath) as! UpcomingMatchesCVCell
            
            cell.onBookNowTapped = { [weak self] in
                self?.onBookNowTapped?()
            }
            
            return cell
            
        case .trendyNews:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TrendyNewsCVCell.identifier, for: indexPath) as! TrendyNewsCVCell
            
            return cell
            
        case .store:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StoreCVCell.identifier, for: indexPath) as! StoreCVCell
            
            return cell
            
        case .newsTab:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NewsListCVCell.identifier, for: indexPath) as! NewsListCVCell
            
            return cell
            
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch type {
            
        case .upcomingMatches: break
        case .trendyNews:
            onCellTap?(indexPath)
            
        case .store: break
        case .newsTab:
            onCellTap?(indexPath)
            
        }
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
        switch type {
        case .upcomingMatches:
            let width = collectionView.frame.width-40
            return CGSize(width: width, height: 258)
        case .trendyNews:
            let width = (collectionView.frame.width - 60) / 2
            return CGSize(width: width, height: 183)
        case .store:
            let width = (collectionView.frame.width - 60) / 2
            return CGSize(width: width, height: 246)
        case .newsTab:
            let width = (collectionView.frame.width - 60) / 2
            return CGSize(width: width, height: 189)
        }
        
    }
    
}
