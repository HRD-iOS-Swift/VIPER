//
//  RootWireframe.swift
//  Viper
//
//  Created by Kokpheng on 12/2/16.
//  Copyright © 2016 Kokpheng. All rights reserved.
//

import UIKit

// ##Step 1: Setting up routing
class RootWireframe {
    
    // show root view by viewController and window
    func showRootViewController(_ viewController: UIViewController, inWindow window: UIWindow) {
        let navigationController = window.rootViewController as! UINavigationController
        navigationController.viewControllers = [viewController]
    }
}
