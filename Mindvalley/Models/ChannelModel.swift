//
//  ChannelModel.swift
//  Mindvalley
//
//  Created by Amaechi Osazuwa on 20/05/2020.
//  Copyright © 2020  Amaechi Osazuwa. All rights reserved.
//

import Foundation

struct ChannelsModel: Decodable {
    var channels: [ChannelModel]?
}

struct ChannelModel: Decodable {
    var title: String?
    var series: [EpisodeModel]?
    var mediaCount: Int?
    var latestMedia: [EpisodeModel]?
    var id: String?
    var iconAsset: IconAsset?
    var coverAsset: CoverAsset?
}


struct IconAsset: Decodable{
    var thumbnailUrl: String?
}
