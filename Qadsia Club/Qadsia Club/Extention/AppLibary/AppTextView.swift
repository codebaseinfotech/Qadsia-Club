//
//  AppTextView.swift
//  Qadsia Club
//
//  Created by Kenil on 05/02/26.
//

import Foundation
import UIKit

@IBDesignable
class AppTextView: UITextView {

    @IBInspectable var localizedKey: String = "" {
        didSet {
            text = localizedKey.localized
        }
    }
}
