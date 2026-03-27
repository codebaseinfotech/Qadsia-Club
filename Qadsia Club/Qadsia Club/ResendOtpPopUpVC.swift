//
//  ResendOtpPopUpVC.swift
//  Qadsia
//
//  Created by Poojagabani on 26/03/26.
//

import UIKit

class ResendOtpPopUpVC: UIViewController {

    @IBOutlet weak var viewSendCode: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        applyCutCornerMask(viewObject: viewSendCode, cutSize: 12)
    }

    func applyCutCornerMask(viewObject: UIView, cutSize: CGFloat) {
        let cut: CGFloat = cutSize
        let w = viewObject.bounds.width
        let h = viewObject.bounds.height

        let path = UIBezierPath()
        path.move(to: CGPoint(x: cut, y: 0))
        path.addLine(to: CGPoint(x: w, y: 0))
        path.addLine(to: CGPoint(x: w, y: h - cut))
        path.addLine(to: CGPoint(x: w - cut, y: h))
        path.addLine(to: CGPoint(x: 0, y: h))
        path.addLine(to: CGPoint(x: 0, y: cut))
        path.close()

        let maskLayer = CAShapeLayer()
        maskLayer.path = path.cgPath
        viewObject.layer.mask = maskLayer
    }

    @IBAction func tappedClose(_ sender: Any) {
        self.dismiss(animated: false)
    }
    

}
