//
//  TicketInfoVC.swift
//  Qadsia
//
//  Created by Poojagabani on 09/04/26.
//

import UIKit

class TicketInfoVC: UIViewController {
    
    @IBOutlet weak var tblViewTicketInfo: UITableView! {
        didSet {
            tblViewTicketInfo.register(UINib(nibName: "TicketListTVCell", bundle: nil), forCellReuseIdentifier: "TicketListTVCell")
            tblViewTicketInfo.delegate = self
            tblViewTicketInfo.dataSource = self
            tblViewTicketInfo.contentInset.bottom = 80
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func tappedBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    

}

extension TicketInfoVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tblViewTicketInfo.dequeueReusableCell(withIdentifier: "TicketListTVCell") as! TicketListTVCell
        
        return cell
    }
    
}
