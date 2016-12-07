//
//  ArticleTableViewCell.swift
//  Viper
//
//  Created by Kokpheng on 12/2/16.
//  Copyright © 2016 Kokpheng. All rights reserved.
//


// ##Step 8:
import UIKit
import Kingfisher

class ArticleTableViewCell: UITableViewCell {

    // MARK: Constants
    static let ArticlesCellIdentifier = "ArticlesCellIdentifier"
    let imagePlaceHolder = "image-placeholder"

    // MARK: Outlets   
    @IBOutlet weak var articleImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorsLabel: UILabel!
    
    // MARK: Life Cycle
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    // MARK: Public
    func setupWithArticle(_ article: Article) {
        authorsLabel?.text = article.authors
        titleLabel?.text = article.title
        if let image = article.imageUrl {
            articleImageView.kf.setImage(with: URL(string: image)!, placeholder: nil)
        } else {
            articleImageView.image = UIImage(named: imagePlaceHolder)
        }
    }
}
