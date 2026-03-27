//
//  AppTextField.swift
//  Qadsia Club
//
//  Created by Kenil on 05/02/26.
//

import Foundation
import UIKit

@IBDesignable
class AppTextField: UITextField {

    @IBInspectable var localizedKey: String = "" {
        didSet {
            placeholder = localizedKey.localized
        }
    }
}
