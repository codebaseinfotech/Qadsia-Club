//
//  UploadPhotoCVCell.swift
//  Qadsia
//
//  Created by Kenil on 07/04/26.
//

import UIKit

enum UploadReturnItem {
    case upload
    case uploaded
}

class UploadPhotoCVCell: UICollectionViewCell {

    @IBOutlet weak var viewMainUpload: UIView!
    @IBOutlet weak var viewMainUploaded: UIView!
    @IBOutlet weak var viewClose: UIView!
    @IBOutlet weak var imgPicUpload: UIImageView!
    
    var onRemoveImage: (() -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBAction func tappedRemove(_ sender: Any) {
        onRemoveImage?()
    }
    
    func config(_ uploadItem: UploadReturnItem) {
        switch uploadItem {
            case .upload:
            viewMainUpload.isHidden = false
            viewMainUploaded.isHidden = true
            viewClose.isHidden = true
            
        case .uploaded:
            viewMainUpload.isHidden = true
            viewMainUploaded.isHidden = false
            viewClose.isHidden = false
            
        }
    }

}
