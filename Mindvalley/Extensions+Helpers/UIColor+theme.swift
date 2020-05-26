//
//  UIColor+theme.swift
//  Mindvalley
//
//  Created by Amaechi Osazuwa on 20/05/2020.
//  Copyright © 2020  Amaechi Osazuwa. All rights reserved.
//

import UIKit

extension UIColor {
    static let primaryLight = UIColor.rgb(red: 36, green: 39, blue: 46)
    static let primaryDark = UIColor.rgb(red: 33, green: 39, blue: 47)
    static let highligted = UIColor.rgb(red: 59, green: 130, blue: 246)
    static let gray = UIColor.rgb(red: 181, green: 184, blue: 184)
    static let grayLight = UIColor.rgb(red: 149, green: 152, blue: 156)
    static let grayMid = UIColor.rgb(red: 149, green: 152, blue: 157, alpha: 0.2)
    
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat = 1) -> UIColor{
           return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: alpha)
       }
}
