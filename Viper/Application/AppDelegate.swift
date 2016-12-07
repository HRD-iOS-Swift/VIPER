//
//  AppDelegate.swift
//  Viper
//
//  Created by Kokpheng on 12/2/16.
//  Copyright © 2016 Kokpheng. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        // ##Step 3: Set up root view
        let appDependencies = AppDependencies()
        appDependencies.installRootViewControllerIntoWindow(window!)
        return true
    }

}

