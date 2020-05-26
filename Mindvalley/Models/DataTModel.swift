//
//  DataTModel.swift
//  Mindvalley
//
//  Created by Amaechi Osazuwa on 20/05/2020.
//  Copyright © 2020  Amaechi Osazuwa. All rights reserved.
//

import UIKit

struct DataTModel<T:Decodable>: Decodable {
    var data: T?
}
