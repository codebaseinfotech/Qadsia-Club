//
//  AddAddressVC.swift
//  Qadsia
//
//  Created by Poojagabani on 03/04/26.
//

import UIKit

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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func tappedBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func tappedHome(_ sender: Any) {
    }
    
    @IBAction func tappedWork(_ sender: Any) {
    }
    
    @IBAction func tappedOther(_ sender: Any) {
    }
    
    @IBAction func tappedCancelPT(_ sender: Any) {
    }
    
    @IBAction func tappedCheckBox(_ sender: Any) {
    }
    
    @IBAction func tappedSaveAdd(_ sender: Any) {
    }
    
    
}
