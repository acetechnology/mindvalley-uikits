//
//  UIFont+theme.swift
//  Mindvalley
//
//  Created by Amaechi Osazuwa on 20/05/2020.
//  Copyright © 2020  Amaechi Osazuwa. All rights reserved.
//

import UIKit

extension UIFont {
    static let regular = UIFont(name: "Gilroy-Light", size: UIFont.labelFontSize)
    static let bold = UIFont(name: "Gilroy-ExtraBold", size: UIFont.labelFontSize)
    
    static func beExtraBold(size: CGFloat) -> UIFont {
        return  UIFont(name: "Gilroy-ExtraBold", size: size) ?? UIFont.systemFont(ofSize: size, weight: .bold)
    }
    
    static func beHeavy(size: CGFloat) -> UIFont {
        return  UIFont(name: "Gilroy-Heavy", size: size) ?? UIFont.systemFont(ofSize: size, weight: .heavy)
    }
    
    static func beRegular(size: CGFloat) -> UIFont {
        return  UIFont(name: "Gilroy-Regular", size: size) ?? UIFont.systemFont(ofSize: size, weight: .regular)
    }
    
    static func beMedium(size: CGFloat) -> UIFont {
        return  UIFont(name: "Gilroy-Medium", size: size) ?? UIFont.systemFont(ofSize: size, weight: .medium)
    }
    
    static func beBold(size: CGFloat) -> UIFont {
        return  UIFont(name: "Gilroy-Bold", size: size) ?? UIFont.systemFont(ofSize: size, weight: .bold)
    }
    
    static func beLight(size: CGFloat) -> UIFont {
        return  UIFont(name: "Gilroy-Light", size: size) ?? UIFont.systemFont(ofSize: size, weight: .light)
    }
}

extension String {
    //this does the job of dropping the channels into new lines but will be improved on
     func dropIntoANewLine() -> String {
        let arr = self.components(separatedBy: " ")
         var empt = ""
         if (arr.count <= 1){
             empt = self
         }else{
            empt = arr[0]+"\n"+arr[1]
         }
        return empt
    }
}
