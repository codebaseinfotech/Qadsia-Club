//
//  AppButton.swift
//  Qadsia Club
//
//  Created by Kenil on 05/02/26.
//

import Foundation
import UIKit

@IBDesignable
class AppButton: UIButton {

    @IBInspectable var localizedKey: String = "" {
        didSet {
            setTitle(localizedKey.localized, for: .normal)
        }
    }
}
