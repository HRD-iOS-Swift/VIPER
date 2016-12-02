//
//  ArticlesWireframe.swift
//  Viper
//
//  Created by Kokpheng on 12/2/16.
//  Copyright © 2016 Kokpheng. All rights reserved.
//

// ##Step 6:
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
    var articlesPresenter: ArticlesPresenter! // ##Step 14:
    
    // Reference to the Router of the next VIPER module.
    var rootWireframe: RootWireframe!
    
    // MARK: Public
    // ##Step 14:
    init() {
        let articlesInteractor = ArticlesInteractor()
        articlesPresenter = ArticlesPresenter()
        articlesPresenter.interactor = articlesInteractor
        articlesPresenter.wireframe = self
        articlesInteractor.output = articlesPresenter
    }
    
    // MARK: Present View from Windows
    func presentArticlesInterfaceFromWindow(_ window: UIWindow) {
        // Load View Controller from storyboard
        articlesViewController = articlesViewControllerFromStoryboard()
        
        // ##Step 14:
        articlesViewController.presenter = articlesPresenter
        articlesPresenter.view = articlesViewController
        
        rootWireframe.showRootViewController(articlesViewController, inWindow: window)
    }
    
    // MARK: Private
    private func articlesViewControllerFromStoryboard() -> ArticlesViewController {
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: articlesViewControllerIdentifier) as! ArticlesViewController
        return viewController
    }
}

