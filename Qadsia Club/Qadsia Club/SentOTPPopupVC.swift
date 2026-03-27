//
//  SentOTPPopupVC.swift
//  Qadsia
//
//  Created by Ankit Gabani on 26/03/26.
//

import UIKit

class SentOTPPopupVC: UIViewController {

    @IBOutlet weak var viewPopup: UIView!
    @IBOutlet weak var btnClose: UIButton!
    @IBOutlet weak var viewProceed: UIView!

    var onProceed: ((OTPFlow) -> Void)?
    var flow: OTPFlow = .login

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func setupUI() {
        view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        viewPopup.layer.cornerRadius = 16
        viewPopup.clipsToBounds = true
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        applyCutCornerMask(viewObject: viewProceed, cutSize: 12)
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

    @IBAction func btnCloseTapped(_ sender: UIButton) {
        dismiss(animated: true)
    }

    @IBAction func btnProceedTapped(_ sender: UIButton) {
        dismiss(animated: true) { [weak self] in
            guard let self = self else { return }
            self.onProceed?(self.flow)
        }
    }
}
