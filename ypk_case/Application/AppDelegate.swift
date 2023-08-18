//
//  AppDelegate.swift
//  ypk_case
//
//  Created by İlkay Sever on 17.08.2023.
//

import UIKit
import CoreData
import IQKeyboardManager

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    static let shared = UIApplication.shared.delegate as? AppDelegate
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        configureIQKeyboard()
        return true
    }
    
    func setRootViewController(window: UIWindow, viewController: UIViewController, withAnimation: Bool) {
        if !withAnimation {
            window.rootViewController = viewController
            window.makeKeyAndVisible()
            return
        }
        if let snapshot = window.snapshotView(afterScreenUpdates: true) {
            viewController.view.addSubview(snapshot)
            window.rootViewController = viewController
            window.makeKeyAndVisible()
            
            UIView.animate(withDuration: 0.5, animations: {
                snapshot.layer.opacity = 0
            }, completion: { _ in
                snapshot.removeFromSuperview()
            })
        }
    }
    
    func openSplashPage() {
        let storyboard = UIStoryboard(name: "SplashScreen", bundle: nil)
        let rootController = storyboard.instantiateInitialViewController() as! SplashScreen
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = rootController
        window?.makeKeyAndVisible()
    }
    
    func openLoginPage() {
        let storyboard = UIStoryboard(name: "LoginRegister", bundle: nil)
        let rootController = storyboard.instantiateInitialViewController() as! LoginViewController
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = rootController
        window?.makeKeyAndVisible()
    }
    
    func openMainPage() {
        setRootViewController(window: UIWindow.key!, viewController: HomeViewController(), withAnimation: true)
        //        UIView.transition(with: window!, duration: 0.85, options: .transitionFlipFromRight, animations: {
        //            UIView.performWithoutAnimation {
        //                let storyboard = UIStoryboard(name: "Home", bundle: nil)
        //                let rootController = storyboard.instantiateViewController(withIdentifier: "HomeVC") as! HomeViewController
        //                let navController = BaseNavigationController(rootViewController: rootController)
        //                if let window = self.window {
        //                    window.rootViewController = navController
        //                }
        //            }
        //        }, completion: nil)
    }
    
    // MARK: - IQKeyboardManager
    
    func configureIQKeyboard() {
        IQKeyboardManager.shared().isEnabled = true
        IQKeyboardManager.shared().isEnableAutoToolbar = true
        IQKeyboardManager.shared().toolbarDoneBarButtonItemText = ""
        IQKeyboardManager.shared().toolbarTintColor = AppColors.backgroundColor
        IQKeyboardManager.shared().shouldResignOnTouchOutside = true
        IQKeyboardManager.shared().overrideKeyboardAppearance = true
        IQKeyboardManager.shared().keyboardAppearance = .dark
    }
    
    // MARK: UISceneSession Lifecycle
    
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
    // MARK: - Core Data stack
    
    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
         */
        let container = NSPersistentContainer(name: "ypk_case")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
}