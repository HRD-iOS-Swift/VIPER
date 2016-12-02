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
     // ##Step 15:
    let alertSortByTitle = "ALERT_SORT_BY_TITLE"
    let dateString = "ALERT_DATE_OPTION"
    let titleString = "ALERT_TITLE_OPTION"
    let authorString = "ALERT_AUTHOR_OPTION"
    let webSiteString = "ALERT_WEBSITE_OPTION"
    let cancelString = "ALERT_CANCEL_OPTION"
    
    // ##Step 6:
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
    
    // ##Step 15: Sort
    func presentArticlesSortOptions() {
        let alert = UIAlertController(title: alertSortByTitle.localized(), message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: self.dateString.localized(),
                                      style: .default,
                                      handler: { (alert: UIAlertAction!) in self.articlesPresenter.sortArticlesList(sortBy: .date) }))
        alert.addAction(UIAlertAction(title: titleString.localized(),
                                      style: .default,
                                      handler: { (alert: UIAlertAction!) in self.articlesPresenter.sortArticlesList(sortBy: .title) }))
        alert.addAction(UIAlertAction(title: authorString.localized(),
                                      style: .default,
                                      handler: { (alert: UIAlertAction!) in self.articlesPresenter.sortArticlesList(sortBy: .author) }))
        alert.addAction(UIAlertAction(title: webSiteString.localized(),
                                      style: .default,
                                      handler: { (alert: UIAlertAction!) in self.articlesPresenter.sortArticlesList(sortBy: .website) }))
        alert.addAction(UIAlertAction(title: cancelString.localized(),
                                      style: .cancel,
                                      handler: nil))
        articlesViewController.present(alert, animated: true, completion: nil)
    }

    
    // MARK: Private
    private func articlesViewControllerFromStoryboard() -> ArticlesViewController {
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: articlesViewControllerIdentifier) as! ArticlesViewController
        return viewController
    }
}

