//
//  ArticlesModuleInterface.swift
//  Viper
//
//  Created by Kokpheng on 12/2/16.
//  Copyright © 2016 Kokpheng. All rights reserved.
//

// ##Step 8:
import Foundation

/*
 * Protocol that defines the commands sent from the View to the Presenter.
 */
protocol ArticlesModuleInterface: class {
    func updateView()
    func sortArticles()
    func showDetails(forArticle article: Article)
}
