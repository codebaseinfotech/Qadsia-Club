//
//  ReturnOrderVC.swift
//  Qadsia
//
//  Created by Kenil on 07/04/26.
//

import UIKit
import PhotosUI

class ReturnOrderVC: UIViewController {

    @IBOutlet weak var tblViewReturnItem: UITableView! {
        didSet {
            tblViewReturnItem.addObserver(self, forKeyPath: "contentSize", options: .new,
                                    context: nil)
            tblViewReturnItem.register(ReturnItemTVCell.nib, forCellReuseIdentifier: ReturnItemTVCell.identifier)
            tblViewReturnItem.delegate = self
            tblViewReturnItem.dataSource = self
        }
    }
    @IBOutlet weak var heightTVReturn: NSLayoutConstraint!
    @IBOutlet weak var tblViewReasonReturn: UITableView! {
        didSet {
            tblViewReasonReturn.addObserver(self, forKeyPath: "contentSize", options: .new,
                                    context: nil)
            tblViewReasonReturn.register(DropDownTVCell.nib, forCellReuseIdentifier: DropDownTVCell.identifier)
            tblViewReasonReturn.delegate = self
            tblViewReasonReturn.dataSource = self
        }
    }
    @IBOutlet weak var heightTVReason: NSLayoutConstraint!
    
    @IBOutlet weak var viewAddPhoto: CutCornerView!
    @IBOutlet weak var collectionViewImages: UICollectionView! {
        didSet {
            collectionViewImages.register(UploadPhotoCVCell.nib, forCellWithReuseIdentifier: UploadPhotoCVCell.identifier)
            collectionViewImages.delegate = self
            collectionViewImages.dataSource = self
        }
    }
    
    @IBOutlet weak var lblRefundTitle: UILabel!
    @IBOutlet weak var lblRefundSubTitle: UILabel!
    @IBOutlet weak var btnChange: UIButton!
    @IBOutlet weak var lblAddressType: UILabel!
    @IBOutlet weak var lblAddress: UILabel!
    
    // MARK: - variable
    var arrUploadImage: [UIImage] = []
    var selectedReason: Int?
    
    // MARK: - view Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hideShowCollectionView()
        // Do any additional setup after loading the view.
    }
    
    override func observeValue(forKeyPath keyPath: String?,
                               of object: Any?,
                               change: [NSKeyValueChangeKey : Any]?,
                               context: UnsafeMutableRawPointer?) {
        
        guard keyPath == "contentSize" else { return }

        if let tableView = object as? UITableView {
            if tableView == tblViewReturnItem {
                heightTVReturn.constant = tblViewReturnItem.contentSize.height

            } else if tableView == tblViewReasonReturn {
                heightTVReason.constant = tblViewReasonReturn.contentSize.height

            }
        }
    }
    
    func hideShowCollectionView() {
        collectionViewImages.isHidden = arrUploadImage.count > 0 ? false : true
        viewAddPhoto.isHidden = arrUploadImage.count > 0 ? true : false
    }
    
    // MARK: - Action Method
    @IBAction func tappedBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func tappedAddPhoto(_ sender: Any) {
        showImagePickerOptions()
    }
    @IBAction func tappedChange(_ sender: Any) {
    }
    @IBAction func tappedSubmitRetun(_ sender: Any) {
        let vc = OrderPlacedSuccessVC()
        vc.placeOrderSuccess = .returnOrderRequest
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    // MARK: - Show ImagePicker
    func showImagePickerOptions() {
        let alert = UIAlertController(title: "Select Photo", message: nil, preferredStyle: .actionSheet)
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            alert.addAction(UIAlertAction(title: "Camera", style: .default, handler: { _ in
                self.openCamera()
            }))
        }
        
        alert.addAction(UIAlertAction(title: "Gallery", style: .default, handler: { _ in
            self.openGallery()
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        
        // iPad support
        if let popover = alert.popoverPresentationController {
            popover.sourceView = self.view
            popover.sourceRect = CGRect(x: self.view.bounds.midX, y: self.view.bounds.midY, width: 0, height: 0)
            popover.permittedArrowDirections = []
        }
        
        present(alert, animated: true)
    }
    
    func openCamera() {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let picker = UIImagePickerController()
            picker.delegate = self
            picker.sourceType = .camera
            picker.allowsEditing = true
            present(picker, animated: true)
        } else {
            print("Camera not available")
            
            // Optional: show alert
            let alert = UIAlertController(title: "Error", message: "Camera not available on this device", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            present(alert, animated: true)
        }
    }
    
    func openGallery() {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        present(picker, animated: true)
    }
    

}

// MARK: - TV Delegate & DataSource
extension ReturnOrderVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch tableView {
        case tblViewReturnItem: return 5
        case tblViewReasonReturn: return 5
            
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch tableView {
        case tblViewReturnItem:
            let cell = tableView.dequeueReusableCell(withIdentifier: ReturnItemTVCell.identifier) as! ReturnItemTVCell
            cell.selectionStyle = .none
            
            return cell
            
        case tblViewReasonReturn:
            let cell = tableView.dequeueReusableCell(withIdentifier: DropDownTVCell.identifier) as! DropDownTVCell
            cell.config(.returnOrder)
            
            cell.imgSelect.image = indexPath.item == selectedReason ? "ic_select_radio".image : "ic_un_select_radio".image
            
            return cell
            
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch tableView {
        case tblViewReasonReturn:
            selectedReason = indexPath.item
            tableView.reloadData()
            
        default: break
            
        }
    }
    
}
// MARK: - CV Delegate & DataSource
extension ReturnOrderVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return arrUploadImage.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UploadPhotoCVCell.identifier, for: indexPath) as! UploadPhotoCVCell
        
        if indexPath.section == 0 {
            cell.config(.upload)
        } else {
            cell.config(.uploaded)
            
            cell.imgPicUpload.image = arrUploadImage[indexPath.row]
            
            cell.onRemoveImage = { [weak self] in
                DispatchQueue.main.async {
                    self?.arrUploadImage.remove(at: indexPath.row)
                    collectionView.deleteItems(at: [indexPath])
                    self?.hideShowCollectionView()
                }
            }
            
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0:
            showImagePickerOptions()
        default:
            break
        }
    }
    
    
}

extension ReturnOrderVC: UICollectionViewDelegateFlowLayout {
    // MARK: - Section Insets
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return .zero
    }
    // MARK: - Minimum Line Spacing (Vertical)
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    
    // MARK: - Minimum Interitem Spacing (Horizontal)
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    
    // MARK:- sizeForItemAt
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 85, height: 85)
    }
    
}

// MARK: - UIImagePickerControllerDelegate && UINavigationControllerDelegate
extension ReturnOrderVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        var selectedImage: UIImage?
        if let editedImage = info[.editedImage] as? UIImage {
            selectedImage = editedImage
        } else if let originalImage = info[.originalImage] as? UIImage {
            selectedImage = originalImage
        }
        
        picker.dismiss(animated: true)
        
        DispatchQueue.main.async { [self] in
            arrUploadImage.append(selectedImage ?? UIImage())
            collectionViewImages.reloadData()
            hideShowCollectionView()
        }
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }
}
