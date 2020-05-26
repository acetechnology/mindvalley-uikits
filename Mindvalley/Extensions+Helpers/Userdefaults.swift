//
//  Userdefaults.swift
//  Mindvalley
//
//  Created by Amaechi Osazuwa on 20/05/2020.
//  Copyright © 2020  Amaechi Osazuwa. All rights reserved.
//

import Foundation

extension UserDefaults {
    enum UserDefaultsKeys: String {
        case newEpisodes
        case categories
        case channels
    }
    
    //store data generated from APIS
    func storeApiFeeds<T>(data:[T], key:UserDefaultsKeys){
        set(data, forKey: key.rawValue)
        synchronize()
    }
    
    //get stored data
    func getStorFeeds<T>(key:UserDefaultsKeys)-> T {
        let storedFeeds = UserDefaults.standard.object(forKey: key.rawValue)
        return storedFeeds as! T
    }
}
