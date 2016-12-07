//
//  AppDependencies.swift
//  Viper
//
//  Created by Kokpheng on 12/2/16.
//  Copyright © 2016 Kokpheng. All rights reserved.
//

// ##Step 2: Setting up routing
import UIKit



class AppDependencies {
    
    // MARK: Instance Variables
    var articlesWireframe: ArticlesWireframe
    
    // MARK: Public
    init() {
        // Config Router
        let rootWireframe = RootWireframe()
        articlesWireframe = ArticlesWireframe()
        articlesWireframe.rootWireframe = rootWireframe
    }
    
    // MARK: Install Root view by Wireframe Present From Window
    func installRootViewControllerIntoWindow(_ window: UIWindow) {
        articlesWireframe.presentArticlesInterfaceFromWindow(window)
    }
}
