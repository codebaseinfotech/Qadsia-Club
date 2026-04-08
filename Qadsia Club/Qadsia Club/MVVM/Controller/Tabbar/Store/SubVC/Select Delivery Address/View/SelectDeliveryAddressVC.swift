//
//  SelectDeliveryAddressVC.swift
//  Qadsia
//
//  Created by Poojagabani on 03/04/26.
//

import UIKit

class SelectDeliveryAddressVC: UIViewController {
    
    @IBOutlet weak var tblViewAddressList: UITableView! {
        didSet {
            tblViewAddressList.register(UINib(nibName: "AddressListTVCell", bundle: nil), forCellReuseIdentifier: "AddressListTVCell")
            tblViewAddressList.dataSource = self
            tblViewAddressList.delegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func tappedBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func tappedAddAddress(_ sender: Any) {
        let vc = AddAddressVC()
        vc.mode = .add
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension SelectDeliveryAddressVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tblViewAddressList.dequeueReusableCell(withIdentifier: "AddressListTVCell", for: indexPath) as! AddressListTVCell
        
        cell.onDeleteTapped = { [self] in
            let vc = DeleteAddressPopUpVC()
            vc.modalPresentationStyle = .overFullScreen
            vc.onPopupAction = .deleteAddress
            self.present(vc, animated: false)
        }
        
        cell.onEditTapped = { [self] in
            let vc = AddAddressVC()
            vc.mode = .edit
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
        return cell
    }
    
}
