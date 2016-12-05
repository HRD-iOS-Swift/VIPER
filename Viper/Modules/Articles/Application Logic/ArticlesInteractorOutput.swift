//
//  ArticlesInteractorOutput.swift
//  Viper
//
//  Created by Kokpheng on 12/5/16.
//  Copyright © 2016 Kokpheng. All rights reserved.
//


// ##Step 10:
import Foundation
/*
 * Protocol that defines the commands sent from the Interactor to the Presenter.
 */
protocol ArticlesInteractorOutput: class {
    func articlesFetched(articles: [Article])
}

