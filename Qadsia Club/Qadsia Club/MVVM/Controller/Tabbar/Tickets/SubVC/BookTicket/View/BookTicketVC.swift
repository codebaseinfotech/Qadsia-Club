//
//  BookTicketVC.swift
//  Qadsia
//
//  Created by Poojagabani on 31/03/26.
//

import UIKit

class BookTicketVC: UIViewController {

    @IBOutlet weak var imgPic: UIImageView!
    @IBOutlet weak var lblDateTime: UILabel!
    @IBOutlet weak var lblStadium: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    
    // MARK: - View Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    // MARK: - Action Method
    @IBAction func tappedBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    @IBAction func tappedBookNow(_ sender: Any) {
        let vc = TicketCartVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    

}
