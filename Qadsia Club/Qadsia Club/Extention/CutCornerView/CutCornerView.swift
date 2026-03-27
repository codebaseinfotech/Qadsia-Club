//
//  CutCornerView.swift
//  Qadsia
//
//  Created by Kenil on 27/03/26.
//

import UIKit

@IBDesignable
class CutCornerView: UIView {

    @IBInspectable var cutSize: CGFloat = 12 {
        didSet {
            setNeedsLayout()
        }
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        applyCutCornerMask()
    }

    private func applyCutCornerMask() {
        let cut = cutSize
        let w = bounds.width
        let h = bounds.height

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
        layer.mask = maskLayer
    }
}

