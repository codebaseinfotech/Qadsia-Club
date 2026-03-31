//
//  AppDelegate.swift
//  Qadsia Club
//
//  Created by Ankit Gabani on 05/02/26.
//

import UIKit
import IQKeyboardManagerSwift
import IQKeyboardToolbarManager
import FirebaseCore
import FirebaseMessaging
import UserNotifications

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var isLogin = true

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

        // Firebase setup
        FirebaseApp.configure()

        // Push Notifications
        UNUserNotificationCenter.current().delegate = self
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { granted, _ in
            guard granted else { return }
            DispatchQueue.main.async {
                application.registerForRemoteNotifications()
            }
        }
        Messaging.messaging().delegate = self

        return true
    }

    // MARK: - APNs token registration
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        Messaging.messaging().apnsToken = deviceToken
    }

    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        print("Failed to register for remote notifications: \(error)")
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

// MARK: - UNUserNotificationCenterDelegate
extension AppDelegate: UNUserNotificationCenterDelegate {

    // Called when a notification is delivered while the app is in the foreground
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                willPresent notification: UNNotification,
                                withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.banner, .badge, .sound])
    }

    // Called when the user taps on a notification
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                didReceive response: UNNotificationResponse,
                                withCompletionHandler completionHandler: @escaping () -> Void) {
        let userInfo = response.notification.request.content.userInfo
        print("Notification tapped: \(userInfo)")
        completionHandler()
    }
}

// MARK: - MessagingDelegate
extension AppDelegate: MessagingDelegate {

    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String?) {
        guard let token = fcmToken else { return }
        print("FCM Token: \(token)")
        // TODO: Send this token to your server if needed
        UserDefaults.standard.set(token, forKey: "fcmToken")
    }
}
