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
        didSet { setNeedsLayout() }
    }

    @IBInspectable var cutTopLeft: Bool = false
    @IBInspectable var cutTopRight: Bool = false
    @IBInspectable var cutBottomLeft: Bool = false
    @IBInspectable var cutBottomRight: Bool = false

    override func layoutSubviews() {
        super.layoutSubviews()
        applyCutCornerMask()
    }

    private func applyCutCornerMask() {
        let cut = cutSize
        let w = bounds.width
        let h = bounds.height

        let path = UIBezierPath()

        // Start Point
        path.move(to: CGPoint(
            x: cutTopLeft ? cut : 0,
            y: 0
        ))

        // Top Edge
        path.addLine(to: CGPoint(
            x: cutTopRight ? w - cut : w,
            y: 0
        ))

        // Top Right Cut
        if cutTopRight {
            path.addLine(to: CGPoint(x: w, y: cut))
        }

        // Right Edge
        path.addLine(to: CGPoint(
            x: w,
            y: cutBottomRight ? h - cut : h
        ))

        // Bottom Right Cut
        if cutBottomRight {
            path.addLine(to: CGPoint(x: w - cut, y: h))
        }

        // Bottom Edge
        path.addLine(to: CGPoint(
            x: cutBottomLeft ? cut : 0,
            y: h
        ))

        // Bottom Left Cut
        if cutBottomLeft {
            path.addLine(to: CGPoint(x: 0, y: h - cut))
        }

        // Left Edge
        path.addLine(to: CGPoint(
            x: 0,
            y: cutTopLeft ? cut : 0
        ))

        // Top Left Cut
        if cutTopLeft {
            path.addLine(to: CGPoint(x: cut, y: 0))
        }

        path.close()

        let maskLayer = CAShapeLayer()
        maskLayer.path = path.cgPath
        layer.mask = maskLayer
    }
}

