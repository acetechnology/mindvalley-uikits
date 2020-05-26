//
//  ImageLoadFromUrl.swift
//  Mindvalley
//
//  Created by Amaechi Osazuwa on 20/05/2020.
//  Copyright © 2020  Amaechi Osazuwa. All rights reserved.
//

import UIKit
import SDWebImage

class ImageLoadFromUrl: UIImageView {
    
    var imageUrlString: String?
    
    func loadImageUsingUrlString(urlString: String) {
        guard let url = URL(string:urlString) else {return}
        self.sd_setImage(with: url, completed: nil)
    }
    
}
