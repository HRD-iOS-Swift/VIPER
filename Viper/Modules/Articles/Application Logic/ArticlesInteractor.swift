//
//  ArticlesInteractor.swift
//  Viper
//
//  Created by Kokpheng on 12/5/16.
//  Copyright © 2016 Kokpheng. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper
/*
 * The Interactor responsible for implementing
 * the business logic of the module.
 */
class ArticlesInteractor : ArticlesInteractorInput
{
    // Url to the desired API.
    let url = "https://www.ckl.io/challenge"
 
    // Reference to the Presenter's output interface.
    weak var output: ArticlesInteractorOutput!
    
    // MARK: ArticlesInteractorInput
    
    func fetchArticles() {
        Alamofire.request(url, method: .get).responseArray { (response: DataResponse<[Article]>) in
            let articlesArray = response.result.value
            
            // ##Step 12:
            // MARK: ArticlesInteractorOutput
            self.output.articlesFetched(articles: articlesArray!)
        }
    }
}










