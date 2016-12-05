//
//  ArticlesViewController.swift
//  Viper
//
//  Created by Kokpheng on 12/2/16.
//  Copyright © 2016 Kokpheng. All rights reserved.
//

// ##Step 6: Conform Protocol but not yet impletment
import UIKit
import PKHUD

/*
 * A view responsible for displaying a list
 * of articles fetched from some source.
 */
class ArticlesViewController: UIViewController, ArticlesViewInterface {

    // ##Step 7:
    // MARK: Constants
    let navigationBarTitle = "NAVIGATION_BAR_TITLE"
    let buttonSortTitle = "BUTTON_SORT_TITLE"
    
    // ##Step 7:
    // MARK: Outlets
    @IBOutlet weak var articlesTableView: UITableView!
 
    
    // Reference to the Presenter's interface.
    var presenter: ArticlesModuleInterface!
    
    
    // ##Step 7:
    // MARK: Instance Variables
    var articles: [Article]!
    
    
    // MARK: Life Cycle
    /*
     * Once the view is loaded, it sends a command
     * to the presenter asking it to update the UI.
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        presenter.updateView()
        HUD.show(.progress)
    }
    
    // ##Step 7:
    // MARK: Private
    private func setupView() {
        setupNavigationBar()
        setupTableView()
    }
    
    // Add Bar Button
    private func setupNavigationBar() {
        let sortButton = UIBarButtonItem(title: buttonSortTitle.localized(),
                                         style: .plain,
                                         target: self,
                                         action: #selector(self.onSortButtonClicked))
        navigationItem.rightBarButtonItem = sortButton
        navigationItem.title = navigationBarTitle.localized()
    }
    
    // ##Step 15: Sort
    @objc private func onSortButtonClicked(_ sender: Any?) {
        presenter.sortArticles()
    }
    
    // Set up table view
    private func setupTableView() {
        articlesTableView.dataSource = self
        articlesTableView.delegate = self
        articlesTableView.rowHeight = UITableViewAutomaticDimension
        articlesTableView.estimatedRowHeight = 230.0
    }

    
    // ##Step 6:
    // MARK: ArticlesViewInterface
    func showNoContentScreen() {
        // Show custom empty screen.
    }
    
    func showArticlesData(articles: [Article]) {
        HUD.hide()
        self.articles = articles
        articlesTableView.reloadData()
    }
}

// ##Step 7:
extension ArticlesViewController: UITableViewDataSource, UITableViewDelegate {
    
    // MARK: UITableView DataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return articles != nil ? articles.count : 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    // ##Step 8:
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let articleCell = tableView.dequeueReusableCell(withIdentifier: ArticleTableViewCell.ArticlesCellIdentifier) as! ArticleTableViewCell
        articleCell.setupWithArticle(articles[indexPath.section])
        return articleCell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         presenter.showDetails(forArticle: articles[indexPath.section])
    }

}


