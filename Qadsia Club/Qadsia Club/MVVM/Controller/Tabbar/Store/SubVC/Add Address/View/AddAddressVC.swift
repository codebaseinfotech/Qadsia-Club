//
//  AddAddressVC.swift
//  Qadsia
//
//  Created by Poojagabani on 03/04/26.
//

import UIKit

enum PlaceType {
    case home
    case work
    case other
}

enum AddressMode {
    case add
    case edit
}

class AddAddressVC: UIViewController {
    
    @IBOutlet weak var lblHeaderTitle: UILabel!
    @IBOutlet weak var txtCountry: UITextField!
    @IBOutlet weak var txtStreetAddL1: UITextField!
    @IBOutlet weak var txtStreetAddL2: UITextField!
    @IBOutlet weak var txtCity: UITextField!
    @IBOutlet weak var txtPostcode: UITextField!
    @IBOutlet weak var txtPlaceType: UITextField!
    @IBOutlet weak var svPlaceType: UIStackView!
    @IBOutlet weak var viewEnterPlaceType: UIView!
    @IBOutlet weak var lblHome: UILabel!
    @IBOutlet weak var lblWork: UILabel!
    @IBOutlet weak var lblOther: UILabel!
    @IBOutlet weak var viewHome: UIView!
    @IBOutlet weak var viewWork: UIView!
    @IBOutlet weak var viewOther: UIView!
    @IBOutlet weak var btnCheckBox: UIButton!
    
    var mode: AddressMode = .add
    var selectedPlaceType: PlaceType?
    var isChecked: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateSelectionUI()
        setupUI()
        
        isChecked = false
        btnCheckBox.setImage(UIImage(named: "ic_primary_check"), for: .normal)
        // Do any additional setup after loading the view.
    }

    @IBAction func tappedBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func tappedHome(_ sender: Any) {
        selectedPlaceType = .home
        updateSelectionUI()
    }
    
    @IBAction func tappedWork(_ sender: Any) {
        selectedPlaceType = .work
        updateSelectionUI()
    }
    
    @IBAction func tappedOther(_ sender: Any) {
        selectedPlaceType = .other
        updateSelectionUI()
    }
    
    @IBAction func tappedCancelPT(_ sender: Any) {
        viewEnterPlaceType.isHidden = true
    }
    
    @IBAction func tappedCheckBox(_ sender: Any) {
        isChecked.toggle()
        
        let imageName = isChecked ? "ic_primary_check_fill" : "ic_primary_check"
        btnCheckBox.setImage(UIImage(named: imageName), for: .normal)
    }
    
    @IBAction func tappedSaveAdd(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func setupUI() {
        switch mode {
        case .add:
            lblHeaderTitle.text = "Add Address"
            
        case .edit:
            lblHeaderTitle.text = "Edit Address"
        }
    }
    
    func updateSelectionUI() {

        [viewHome, viewWork, viewOther].forEach {
            $0?.layer.borderWidth = 0
        }
        
        lblHome.textColor = #colorLiteral(red: 0.5019607843, green: 0.5019607843, blue: 0.5019607843, alpha: 1)
        lblWork.textColor = #colorLiteral(red: 0.5019607843, green: 0.5019607843, blue: 0.5019607843, alpha: 1)
        lblOther.textColor = #colorLiteral(red: 0.5019607843, green: 0.5019607843, blue: 0.5019607843, alpha: 1)
        
        switch selectedPlaceType {
        case .home:
            viewHome.layer.borderWidth = 1
            viewHome.layer.borderColor = #colorLiteral(red: 0.9921568627, green: 0.7254901961, blue: 0.07843137255, alpha: 1)
            lblHome.textColor = #colorLiteral(red: 0.007843137255, green: 0.007843137255, blue: 0.007843137255, alpha: 1)
            viewEnterPlaceType.isHidden = true
            
        case .work:
            viewWork.layer.borderWidth = 1
            viewWork.layer.borderColor = #colorLiteral(red: 0.9921568627, green: 0.7254901961, blue: 0.07843137255, alpha: 1)
            lblWork.textColor = #colorLiteral(red: 0.007843137255, green: 0.007843137255, blue: 0.007843137255, alpha: 1)
            viewEnterPlaceType.isHidden = true
            
        case .other:
            viewOther.layer.borderWidth = 1
            viewOther.layer.borderColor = #colorLiteral(red: 0.9921568627, green: 0.7254901961, blue: 0.07843137255, alpha: 1)
            lblOther.textColor = #colorLiteral(red: 0.007843137255, green: 0.007843137255, blue: 0.007843137255, alpha: 1)
            viewEnterPlaceType.isHidden = false
            
        case .none:
            break
        }
    }
}
