//
//  AppDelegate.swift
//  RickAndMorty
//
//  Created by O'ral Nabiyev on 16/01/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        let navVc = UINavigationController(rootViewController: HomeVC(nibName: "HomeVC", bundle: nil))
        window?.rootViewController = navVc
        window?.makeKeyAndVisible()
        
        return true
    }

}

