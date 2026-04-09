//
//  TicketCartVC.swift
//  Qadsia
//
//  Created by Poojagabani on 09/04/26.
//

import UIKit

class TicketCartVC: UIViewController {
    
    @IBOutlet weak var tblViewTicketList: UITableView! {
        didSet {
            tblViewTicketList.register(UINib(nibName: "TicketListTVCell", bundle: nil), forCellReuseIdentifier: "TicketListTVCell")
            tblViewTicketList.delegate = self
            tblViewTicketList.dataSource = self
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

extension TicketCartVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tblViewTicketList.dequeueReusableCell(withIdentifier: "TicketListTVCell") as! TicketListTVCell
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = TicketInfoVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
