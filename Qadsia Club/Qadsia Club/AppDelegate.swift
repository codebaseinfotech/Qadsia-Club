//
//  AppDelegate.swift
//  Qadsia Club
//
//  Created by Ankit Gabani on 05/02/26.
//

import UIKit
import IQKeyboardManagerSwift
import IQKeyboardToolbarManager

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    static var appDelegate: AppDelegate {
        get {
            return UIApplication.shared.delegate as! AppDelegate
        }
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = ViewController()
        window?.makeKeyAndVisible()
        
        IQKeyboardManager.shared.isEnabled = true
        IQKeyboardManager.shared.resignOnTouchOutside = true
        IQKeyboardToolbarManager.shared.isEnabled = true

        return true
    }
    
    // MARK: - Root Controllers
    func setUpLogin() {
        let nav = UINavigationController(rootViewController: LoginMobileVC())
        nav.navigationBar.isHidden = true
        window?.rootViewController = nav
        window?.makeKeyAndVisible()
    }

    func setUpHome() {
        let nav = UINavigationController(rootViewController: HomeVC())
        nav.navigationBar.isHidden = true
        window?.rootViewController = nav
        window?.makeKeyAndVisible()
    }

}
