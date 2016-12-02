//
//  String+ Localized.swift
//  Challenge
//
//  Created by Pedro Henrique Prates Peralta on 3/25/16.
//  Copyright © 2016 Cheesecake Labs. All rights reserved.
//

import UIKit

extension String {
    func localized() -> String {
        return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: "")
    }
}
