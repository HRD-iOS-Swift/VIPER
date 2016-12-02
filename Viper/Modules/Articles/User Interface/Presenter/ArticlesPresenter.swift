//
//  ArticlesPresenter.swift
//  Viper
//
//  Created by Kokpheng on 12/2/16.
//  Copyright © 2016 Kokpheng. All rights reserved.
//

// ##Step 9: comform protocol
import Foundation
/*
 * The Presenter is also responsible for connecting
 * the other objects inside a VIPER module.
 */
class ArticlesPresenter : ArticlesModuleInterface, ArticlesInteractorOutput
{
    // MARK: Instance Variables
    // Reference to the View (weak to avoid retain cycle).
    weak var view: ArticlesViewInterface!
    
    // Reference to the Interactor's interface.
    var interactor: ArticlesInteractorInput!
    
    // Reference to the Router
    var wireframe: ArticlesWireframe!
    
    var articles: [Article]!
    
    // MARK: Enums
    enum ArticlesSortBy {
        case date
        case title
        case author
        case website
    }
    
    // ##Step 9:
    // MARK: ArticlesModuleInterface
    func updateView() {
        self.interactor.fetchArticles()
    }
    
    func sortArticles() {
        //wireframe.presentArticlesSortOptions()
    }
    
    func showDetails(forArticle article: Article) {
        //self.wireframe.presentDetailsInterfaceForArticle(article: article)
    }
    
    // ##Step 9: & // ##Step 12:
    // MARK: ArticlesInteractorOutput
    func articlesFetched(articles: [Article]) {
        if articles.count > 0 {
            self.articles = articles
            self.view.showArticlesData(articles: articles)
        } else {
            self.view.showNoContentScreen()
        }
    }
    
    
    // MARK: Public
    func sortArticlesList(sortBy: ArticlesSortBy) {
        switch sortBy {
        case .date:
            let items = articles.sorted(by: { $0.date! < $1.date! })
            view.showArticlesData(articles: items)
        case .title:
            let items = articles.sorted(by: { $0.title! < $1.title! })
            view.showArticlesData(articles: items)
        case .author:
            let items = articles.sorted(by: { $0.authors! < $1.authors! })
            view.showArticlesData(articles: items)
        case .website:
            let items = articles.sorted(by: { $0.website! < $1.website! })
            view.showArticlesData(articles: items)
        }
    }
    
}
