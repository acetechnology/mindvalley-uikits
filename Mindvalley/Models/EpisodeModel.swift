//
//  EpisodeModel.swift
//  Mindvalley
//
//  Created by Amaechi Osazuwa on 20/05/2020.
//  Copyright © 2020  Amaechi Osazuwa. All rights reserved.
//

import UIKit

struct MediaModel: Decodable {
var media: [EpisodeModel]?
}

struct EpisodeModel: Decodable {
    var type: String?
    var title: String?
    var coverAsset: CoverAsset?
    var channel: Channel?
    
}

struct Channel: Decodable {
     var title: String?
}

struct CoverAsset: Decodable {
     var url: String?
}
