//
//  CategoryModel.swift
//  Mindvalley
//
//  Created by Amaechi Osazuwa on 20/05/2020.
//  Copyright © 2020  Amaechi Osazuwa. All rights reserved.
//

import Foundation

struct CategoriesModel: Decodable {
    var categories: [CategoryModel]?
}

struct CategoryModel: Decodable {
    var name: String?
}
