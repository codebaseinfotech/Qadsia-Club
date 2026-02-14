//
//  AppDelegate.swift
//  Qadsia Club
//
//  Created by Ankit Gabani on 05/02/26.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        sleep(2)
        
        let nav = UINavigationController(rootViewController: LoginMobileVC())
        nav.navigationBar.isHidden = true
        window?.rootViewController = nav
        window?.makeKeyAndVisible()
        
        
        return true
    }

}
