//
//  LoginMobileVC.swift
//  Qadsia Club
//
//  Created by Ankit Gabani on 14/02/26.
//

import UIKit

class LoginMobileVC: UIViewController {

    @IBOutlet weak var viewProceed: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        applyCutCornerMask(viewObject: viewProceed, cutSize: 12)
    }

    func applyCutCornerMask(viewObject: AnyObject,cutSize:CGFloat) {

        let cut: CGFloat = cutSize
        let w = viewProceed.bounds.width
        let h = viewProceed.bounds.height

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

}
