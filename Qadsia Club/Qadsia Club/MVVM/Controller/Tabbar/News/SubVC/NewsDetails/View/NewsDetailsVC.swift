//
//  NewsDetailsVC.swift
//  Qadsia
//
//  Created by Kenil on 02/04/26.
//

import UIKit

class NewsDetailsVC: UIViewController {

    @IBOutlet weak var imgPic: UIImageView!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblMsg: UILabel!
    
    // MARK: - view Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: - Action Method
    @IBAction func tappedBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func tappedShare(_ sender: Any) {
    }
    @IBAction func tappedNextNews(_ sender: Any) {
    }
    

     

}
