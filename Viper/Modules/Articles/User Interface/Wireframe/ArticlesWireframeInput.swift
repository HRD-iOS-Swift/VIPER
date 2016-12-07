//
//  ArticlesWireframeInput.swift
//  Viper
//
//  Created by Kokpheng on 12/2/16.
//  Copyright © 2016 Kokpheng. All rights reserved.
//

// ##Step 20:
import Foundation

/*
 * Protocol that defines the possible routes from the Articles module.
 */
protocol ArticlesWireframeInput {
    func presentDetailsInterfaceForArticle(article: Article)
}
