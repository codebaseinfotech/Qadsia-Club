//
//  CheckoutVC.swift
//  Qadsia
//
//  Created by Poojagabani on 02/04/26.
//

import UIKit

enum AddressType {
    case home, work, other
}

class CheckoutVC: UIViewController {

    
    @IBOutlet weak var scrollView: UIScrollView! {
        didSet {
            scrollView.contentInset.bottom = 80
        }
    }
    
    @IBOutlet weak var btnChangePersonalDetails: UIButton!
    @IBOutlet weak var btnChangeShippingDetails: UIButton!
    @IBOutlet weak var tblViewProductNameList: UITableView! {
        didSet {
            tblViewProductNameList.addObserver(self, forKeyPath: "contentSize", options: .new,
                                    context: nil)
            tblViewProductNameList.register(ProductNameListTVCell.nib, forCellReuseIdentifier: ProductNameListTVCell.identifier)
            tblViewProductNameList.delegate = self
            tblViewProductNameList.dataSource = self
        }
    }
    @IBOutlet weak var heightConstProductName: NSLayoutConstraint!
    
    @IBOutlet weak var lblSubTotal: UILabel!
    @IBOutlet weak var lblCouponDiscount: UILabel!
    @IBOutlet weak var lblShippingAmount: UILabel!
    @IBOutlet weak var lblShippingEnterAddress: UILabel!
    @IBOutlet weak var lblTotalAmount: UILabel!
    @IBOutlet weak var imgPayment: UIImageView!
    @IBOutlet weak var lblPaymentType: UILabel!
    @IBOutlet weak var lblPaymentDis: UILabel!
    @IBOutlet weak var txtFName: UITextField!
    @IBOutlet weak var txtLName: UITextField!
    @IBOutlet weak var txtPhoneNum: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var lbluserName: UILabel!
    @IBOutlet weak var lblUserPhone: UILabel!
    @IBOutlet weak var lblUserEmail: UILabel!
    @IBOutlet weak var txtCountry: UITextField!
    @IBOutlet weak var txtStreetAddL1: UITextField!
    @IBOutlet weak var txtStreetAddL2: UITextField!
    @IBOutlet weak var txtCity: UITextField!
    @IBOutlet weak var txtPostcode: UITextField!
    @IBOutlet weak var txtViewOrderNot: UITextView!
    @IBOutlet weak var lblAddressType: UILabel!
    @IBOutlet weak var lblAddress: UILabel!
    @IBOutlet weak var lblHome: UILabel!
    @IBOutlet weak var lblWork: UILabel!
    @IBOutlet weak var lblOther: UILabel!
    @IBOutlet weak var viewHome: UIView!
    @IBOutlet weak var viewWork: UIView!
    @IBOutlet weak var viewOther: UIView!
    @IBOutlet weak var btnCheckBox: UIButton!
    
    var selectedAddressType: AddressType? = nil
    var isChecked: Bool = false
    
    var arrProduct = ["Al-Qadisiyah sports club pullover 25/26-Black, L x 1", "Hand Gloves-Black x 2", "Silicone cover for Airtag"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUnderlineToButton()
        updateAddressSelection()
        
        isChecked = false
        btnCheckBox.setImage(UIImage(named: "ic_primary_check"), for: .normal)
        // Do any additional setup after loading the view.
    }
    
    override func observeValue(forKeyPath keyPath: String?,
                               of object: Any?,
                               change: [NSKeyValueChangeKey : Any]?,
                               context: UnsafeMutableRawPointer?) {
        
        if keyPath == "contentSize" {
            heightConstProductName.constant = tblViewProductNameList.contentSize.height
        }
    }
    
    deinit {
        tblViewProductNameList.removeObserver(self, forKeyPath: "contentSize")
    }
    
    func setUnderlineToButton() {
        let title = "Change"
        
        let attributedString = NSAttributedString(
            string: title,
            attributes: [
                .underlineStyle: NSUnderlineStyle.single.rawValue,
                .underlineColor: #colorLiteral(red: 0.9921568627, green: 0.7254901961, blue: 0.07843137255, alpha: 1),
                .foregroundColor: #colorLiteral(red: 0.007843137255, green: 0.007843137255, blue: 0.007843137255, alpha: 1)
            ]
        )
        
        btnChangePersonalDetails.setAttributedTitle(attributedString, for: .normal)
        btnChangeShippingDetails.setAttributedTitle(attributedString, for: .normal)
    }

    @IBAction func tappedBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func tappedChangeShoppingAddess(_ sender: Any) {
        let vc = SelectDeliveryAddressVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func tappedOrderConfirm(_ sender: Any) {
        let vc = OrderPlacedSuccessVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func tappedCheckSaveAddress(_ sender: Any) {
        isChecked.toggle()
        
        let imageName = isChecked ? "ic_primary_check_fill" : "ic_primary_check"
        btnCheckBox.setImage(UIImage(named: imageName), for: .normal)
    }
    
    @IBAction func tappedHome(_ sender: Any) {
        selectedAddressType = .home
        updateAddressSelection()
    }
    
    @IBAction func tappedWork(_ sender: Any) {
        selectedAddressType = .work
        updateAddressSelection()
    }
    
    @IBAction func tappedOther(_ sender: Any) {
        selectedAddressType = .other
        updateAddressSelection()
    }
    
    func updateAddressSelection() {
        
        // Reset all
        [viewHome, viewWork, viewOther].forEach {
            $0?.layer.borderWidth = 1
            $0?.layer.borderColor = #colorLiteral(red: 0.9176470588, green: 0.9176470588, blue: 0.9176470588, alpha: 1)
        }
        
        [lblHome, lblWork, lblOther].forEach {
            $0?.textColor = #colorLiteral(red: 0.5019607843, green: 0.5019607843, blue: 0.5019607843, alpha: 1)
        }
        
        // If nothing selected → do nothing
        guard let type = selectedAddressType else { return }
        
        // Highlight selected
        switch type {
        case .home:
            viewHome.layer.borderColor = #colorLiteral(red: 0.9921568627, green: 0.7254901961, blue: 0.07843137255, alpha: 1)
            lblHome.textColor = #colorLiteral(red: 0.007843137255, green: 0.007843137255, blue: 0.007843137255, alpha: 1)
        case .work:
            viewWork.layer.borderColor = #colorLiteral(red: 0.9921568627, green: 0.7254901961, blue: 0.07843137255, alpha: 1)
            lblWork.textColor = #colorLiteral(red: 0.007843137255, green: 0.007843137255, blue: 0.007843137255, alpha: 1)
        case .other:
            viewOther.layer.borderColor = #colorLiteral(red: 0.9921568627, green: 0.7254901961, blue: 0.07843137255, alpha: 1)
            lblOther.textColor = #colorLiteral(red: 0.007843137255, green: 0.007843137255, blue: 0.007843137255, alpha: 1)
            
        }
    }
    
}

extension CheckoutVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrProduct.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tblViewProductNameList.dequeueReusableCell(withIdentifier: "ProductNameListTVCell") as! ProductNameListTVCell
        
        cell.lblProductName.text = arrProduct[indexPath.row]
        
        return cell
    }
    
}
