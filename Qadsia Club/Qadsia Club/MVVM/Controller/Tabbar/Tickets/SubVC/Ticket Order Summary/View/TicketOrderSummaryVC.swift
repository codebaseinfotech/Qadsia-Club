//
//  TicketOrderSummaryVC.swift
//  Qadsia
//
//  Created by Poojagabani on 10/04/26.
//

import UIKit

class TicketOrderSummaryVC: UIViewController {
    
    @IBOutlet weak var tblViewOrderSummary: UITableView! {
        didSet {
            tblViewOrderSummary.addObserver(self, forKeyPath: "contentSize", options: .new,
                                    context: nil)
            tblViewOrderSummary.register(UINib(nibName: "TicketListTVCell", bundle: nil), forCellReuseIdentifier: "TicketListTVCell")
            tblViewOrderSummary.delegate = self
            tblViewOrderSummary.dataSource = self
        }
    }
    @IBOutlet weak var heightConstTblViewSummary: NSLayoutConstraint!
    @IBOutlet weak var btnCheckAgree: UIButton!
    @IBOutlet weak var lblTotalTickets: UILabel!
    @IBOutlet weak var lblTotalAmount: UILabel!
    
    var isAgreeSelected: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func observeValue(forKeyPath keyPath: String?,
                               of object: Any?,
                               change: [NSKeyValueChangeKey : Any]?,
                               context: UnsafeMutableRawPointer?) {
        
        if keyPath == "contentSize" {
            heightConstTblViewSummary.constant = tblViewOrderSummary.contentSize.height
        }
    }
    
    deinit {
        tblViewOrderSummary.removeObserver(self, forKeyPath: "contentSize")
    }

    @IBAction func tappedBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func tappedKNet(_ sender: Any) {
        if !isAgreeSelected {
            let vc = SentOTPPopupVC()
            vc.modalPresentationStyle = .overFullScreen
            vc.flow = .agreeCondition
            self.present(vc, animated: true)
            return
        }
        
        let vc = OrderPlacedSuccessVC()
        vc.placeOrderSuccess = .ticketBooked
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func tappedCheckAgree(_ sender: Any) {
        isAgreeSelected.toggle()
        btnCheckAgree.setImage(UIImage(named: isAgreeSelected ? "ic_primary_check_fill" : "ic_primary_check"), for: .normal)
    }
    
    
}

extension TicketOrderSummaryVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tblViewOrderSummary.dequeueReusableCell(withIdentifier: "TicketListTVCell") as! TicketListTVCell
        
        cell.configure(with: .orderSummary)
        
        return cell
    }
    
}
