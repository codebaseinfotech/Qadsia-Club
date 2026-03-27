//
//  UIFont+Extention.swift
//  Qadsia Club
//
//  Created by Kenil on 05/02/26.
//

import Foundation
import UIKit

extension UIFont {
    
    struct AppFont {
        
        static func black(_ size: CGFloat) -> UIFont {
            UIFont(name: "Mulish-Black", size: size)!
        }
        
        static func blackItalic(_ size: CGFloat) -> UIFont {
            UIFont(name: "Mulish-BlackItalic", size: size)!
        }
        
        static func bold(_ size: CGFloat) -> UIFont {
            UIFont(name: "Mulish-Bold", size: size)!
        }
        
        static func boldItalic(_ size: CGFloat) -> UIFont {
            UIFont(name: "Mulish-BoldItalic", size: size)!
        }
        
        static func extraBold(_ size: CGFloat) -> UIFont {
            UIFont(name: "Mulish-ExtraBold", size: size)!
        }
        
        static func extraBoldItalic(_ size: CGFloat) -> UIFont {
            UIFont(name: "Mulish-ExtraBoldItalic", size: size)!
        }
        
        static func extraLight(_ size: CGFloat) -> UIFont {
            UIFont(name: "Mulish-ExtraLight", size: size)!
        }
        
        static func extraLightItalic(_ size: CGFloat) -> UIFont {
            UIFont(name: "Mulish-ExtraLightItalic", size: size)!
        }
        
        static func italic(_ size: CGFloat) -> UIFont {
            UIFont(name: "Mulish-Italic", size: size)!
        }
        
        static func light(_ size: CGFloat) -> UIFont {
            UIFont(name: "Mulish-Light", size: size)!
        }
        
        static func lightItalic(_ size: CGFloat) -> UIFont {
            UIFont(name: "Mulish-LightItalic", size: size)!
        }
        
        static func medium(_ size: CGFloat) -> UIFont {
            UIFont(name: "Mulish-Medium", size: size)!
        }
        
        static func mediumItalic(_ size: CGFloat) -> UIFont {
            UIFont(name: "Mulish-MediumItalic", size: size)!
        }
        
        static func regular(_ size: CGFloat) -> UIFont {
            UIFont(name: "Mulish-Regular", size: size)!
        }
        
        static func semiBold(_ size: CGFloat) -> UIFont {
            UIFont(name: "Mulish-SemiBold", size: size)!
        }
        
        static func semiBoldItalic(_ size: CGFloat) -> UIFont {
            UIFont(name: "Mulish-SemiBoldItalic", size: size)!
        }
    }
}
