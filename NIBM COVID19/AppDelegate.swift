//
//  AppDelegate.swift
//  NIBM COVID19
//
//  Created by Thanuja Nayanajith on 8/29/20.
//  Copyright © 2020 NIBM. All rights reserved.
//

import UIKit
import FirebaseCore

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
       FirebaseApp.configure()
        
        window = UIWindow()
        window?.makeKeyAndVisible()
//        window?.rootViewController = HomeViewController()
        window?.rootViewController = UINavigationController(rootViewController: SettingsViewController())
        //window?.rootViewController = SurvayQ1ViewController()
        return true
    }



}

