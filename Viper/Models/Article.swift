//
//  Article.swift
//  Viper
//
//  Created by Kokpheng on 12/2/16.
//  Copyright © 2016 Kokpheng. All rights reserved.
//

// ##Step 4: Create Model
import Foundation
import ObjectMapper

struct Article {
    var date: String?
    var title: String?
    var website: String?
    var authors: String?
    var content: String?
    var imageUrl: String?
}

extension Article: Mappable {
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        title       <- map["title"]
        website     <- map["website"]
        authors     <- map["authors"]
        content     <- map["content"]
        imageUrl    <- map["image"]
        date        <- map["date"]
    }
}




