//
//  ArticlesWireframe.swift
//  Viper
//
//  Created by Kokpheng on 12/2/16.
//  Copyright © 2016 Kokpheng. All rights reserved.
//

//##13
import UIKit
/*
 * The Router responsible for navigation between modules.
 */
class ArticlesWireframe
{
    
    // MARK: Constants
    
    let storyboardName = "ArticlesStoryboard"
    let articlesViewControllerIdentifier = "ArticlesViewController"
    
    // MARK: Instance Variables
    
    // Reference to the ViewController (weak to avoid retain cycle).
    weak var articlesViewController: ArticlesViewController!
    
    // Reference to the Router of the next VIPER module.
    var rootWireframe: RootWireframe!
    
    // MARK: Public
    

    // MARK: Present View from Windows
    func presentArticlesInterfaceFromWindow(_ window: UIWindow) {
        // Load View Controller from storyboard
        articlesViewController = articlesViewControllerFromStoryboard()
        rootWireframe.showRootViewController(articlesViewController, inWindow: window)
    }
    


    
    // MARK: Private
    

    
    private func articlesViewControllerFromStoryboard() -> ArticlesViewController {
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: articlesViewControllerIdentifier) as! ArticlesViewController
        return viewController
    }
}

