//
//  ProductDetailsVC.swift
//  Qadsia
//
//  Created by Poojagabani on 31/03/26.
//

import UIKit

class ProductDetailsVC: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView! {
        didSet {
            scrollView.contentInset.bottom = 100
        }
    }
    
    @IBOutlet weak var collectionViewProduct: UICollectionView! {
        didSet {
            collectionViewProduct.register(ProductListCVCell.nib, forCellWithReuseIdentifier: ProductListCVCell.identifier)
            collectionViewProduct.delegate = self
            collectionViewProduct.dataSource = self
        }
    }
    @IBOutlet weak var collectionViewProductList: UICollectionView! {
        didSet {
            collectionViewProductList.register(ProductListCVCell.nib, forCellWithReuseIdentifier: ProductListCVCell.identifier)
            collectionViewProductList.delegate = self
            collectionViewProductList.dataSource = self
        }
    }
    @IBOutlet weak var collectionViewColorsList: UICollectionView! {
        didSet {
            collectionViewColorsList.register(ColorsListCVCell.nib, forCellWithReuseIdentifier: ColorsListCVCell.identifier)
            collectionViewColorsList.delegate = self
            collectionViewColorsList.dataSource = self
        }
    }
    @IBOutlet weak var collectionViewSelectSize: UICollectionView! {
        didSet {
            collectionViewSelectSize.register(SizeSelectCVCell.nib, forCellWithReuseIdentifier: SizeSelectCVCell.identifier)
            collectionViewSelectSize.delegate = self
            collectionViewSelectSize.dataSource = self
        }
    }
    @IBOutlet weak var svAddtionalInfo: UIStackView!
    @IBOutlet weak var svReviewsMain: UIStackView!
    @IBOutlet weak var lblAdditionalInfo: UILabel!
    @IBOutlet weak var lblReviews: UILabel!
    @IBOutlet weak var bottomLineAdditionalInfo: UILabel!
    @IBOutlet weak var bottomLineReviews: UILabel!
    
    @IBOutlet weak var lblProductName: UILabel!
    @IBOutlet weak var lblProductPrice: UILabel!
    @IBOutlet weak var lblProductDis: UILabel!
    @IBOutlet weak var lblProductStoke: UILabel!
    @IBOutlet weak var lblProductCode: UILabel!
    @IBOutlet weak var lblProductCategory: UILabel!
    @IBOutlet weak var lblColor: UILabel!
    @IBOutlet weak var lblAllSize: UILabel!
    @IBOutlet weak var lblNoReview: UILabel!
    @IBOutlet weak var lblBeTheFirst: UILabel!
    @IBOutlet weak var txtYourreview: UITextField!
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var viewBottomCartMain: UIView!
    
    
    var arrProductList = ["img_shirt_1", "img_shirt_2", "img_shirt_3"]
    var arrColors = ["img_color_1", "img_color_2", "img_color_3"]
    var arrSize = ["XL", "L", "M", "S"]
    
    var selectedColorIndex: Int = 0
    var selectedSizeIndex: Int = 0
    
    // MARK: - view Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        applyGradient()
        // Do any additional setup after loading the view.
    }

    func applyGradient() {
        viewBottomCartMain.layer.sublayers?.removeAll(where: { $0 is CAGradientLayer })

        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = viewBottomCartMain.bounds
        
        gradientLayer.colors = [
            UIColor.white.withAlphaComponent(0.0).cgColor,
            UIColor.white.withAlphaComponent(0.61).cgColor,
            UIColor.white.withAlphaComponent(0.9).cgColor
        ]
        gradientLayer.locations = [0.0, 0.6142, 0.9]
        
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1.0)
        
        viewBottomCartMain.layer.insertSublayer(gradientLayer, at: 0)
    }

    // MARK: - Action Method
    @IBAction func tappedBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func tappedAdditionalInfo(_ sender: Any) {
        svAddtionalInfo.isHidden = false
        svReviewsMain.isHidden = true
        bottomLineAdditionalInfo.isHidden = false
        bottomLineReviews.isHidden = true
    }
    
    @IBAction func tappedReviews(_ sender: Any) {
        svAddtionalInfo.isHidden = true
        svReviewsMain.isHidden = false
        bottomLineAdditionalInfo.isHidden = true
        bottomLineReviews.isHidden = false
    }
    
    @IBAction func tappedCheckBox(_ sender: Any) {
    }
    
    @IBAction func tappedSendReview(_ sender: Any) {
    }
    
    @IBAction func tappedAddToCart(_ sender: Any) {
        let vc = KeepShoppingPopUpVC()
        vc.modalPresentationStyle = .overFullScreen
        self.present(vc, animated: false)
    }
    
    
}

extension ProductDetailsVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == collectionViewProduct {
            return 1
        } else if collectionView == collectionViewProductList {
            return arrProductList.count
        } else if collectionView == collectionViewColorsList {
            return arrColors.count
        } else if collectionView == collectionViewSelectSize {
            return arrSize.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == collectionViewProduct {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductListCVCell.identifier, for: indexPath) as! ProductListCVCell
            cell.productType = .productMain
            return cell
        } else if collectionView == collectionViewProductList {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductListCVCell.identifier, for: indexPath) as! ProductListCVCell
            cell.productType = .productList

            cell.imgProductList.image = UIImage(named: arrProductList[indexPath.row])
            return cell
        } else if collectionView == collectionViewColorsList {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ColorsListCVCell.identifier, for: indexPath) as! ColorsListCVCell
            cell.imgColors.image = UIImage(named: arrColors[indexPath.row])
            
            if indexPath.row == selectedColorIndex {
                cell.viewMainColor.layer.borderWidth = 1
                cell.viewMainColor.layer.borderColor = #colorLiteral(red: 0.9921568627, green: 0.7254901961, blue: 0.07843137255, alpha: 1)
                cell.viewMainColor.layer.cornerRadius = 14
            } else {
                cell.viewMainColor.layer.borderWidth = 0
            }
            
            return cell
        } else if collectionView == collectionViewSelectSize {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SizeSelectCVCell.identifier, for: indexPath) as! SizeSelectCVCell
            cell.lblSize.text = arrSize[indexPath.row]
            
            if indexPath.row == selectedSizeIndex {
                cell.viewMainSize.borderWidth1 = 1
                cell.viewMainSize.borderColor1 = #colorLiteral(red: 0.9921568627, green: 0.7254901961, blue: 0.07843137255, alpha: 1)
                cell.viewMainSize.backgroundColor = UIColor(hexString: "#FFF1D0")
            } else {
                cell.viewMainSize.borderWidth1 = 0
                cell.viewMainSize.backgroundColor = UIColor(hexString: "#EFEFEF")
            }
            
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == collectionViewColorsList {
            selectedColorIndex = indexPath.row
            collectionView.reloadData()
        } else if collectionView == collectionViewSelectSize {
            selectedSizeIndex = indexPath.row
            collectionView.reloadData()
        }
    }
    
}

extension ProductDetailsVC: UICollectionViewDelegateFlowLayout {
    // MARK: - Section Insets
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        if collectionView == collectionViewProduct {
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        } else if collectionView == collectionViewProductList {
            return UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
        } else if collectionView == collectionViewColorsList {
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        } else if collectionView == collectionViewSelectSize {
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
        return UIEdgeInsets()
    }
    // MARK: - Minimum Line Spacing (Vertical)
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == collectionViewProduct {
            return 0
        } else if collectionView == collectionViewProductList {
           return 8
        } else if collectionView == collectionViewColorsList {
            return 12
         } else if collectionView == collectionViewSelectSize {
             return 9
          }
        return CGFloat()
    }
    
    // MARK: - Minimum Interitem Spacing (Horizontal)
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == collectionViewProduct {
            return 0
        } else if collectionView == collectionViewProductList {
           return 8
        } else if collectionView == collectionViewColorsList {
            return 12
         } else if collectionView == collectionViewSelectSize {
             return 9
          }
        return CGFloat()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == collectionViewProduct {
            return CGSize(width: 335, height: 284)
        } else if collectionView == collectionViewProductList {
            return CGSize(width: 42, height: 42)
        } else if collectionView == collectionViewColorsList {
            return CGSize(width: 28, height: 28)
        } else if collectionView == collectionViewSelectSize {
            return CGSize(width: 48, height: 48)
        }
        
        return CGSize()
    }
    
}
