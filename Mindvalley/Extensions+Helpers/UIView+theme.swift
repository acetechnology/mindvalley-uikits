//
//  File.swift
//  Mindvalley
//
//  Created by Amaechi Osazuwa on 20/05/2020.
//  Copyright © 2020  Amaechi Osazuwa. All rights reserved.
//

import UIKit

extension UIView {
    func translateAll(){
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    //uiview constraints customization
    func anchor(_ top: NSLayoutYAxisAnchor? = nil, left: NSLayoutXAxisAnchor? = nil, bottom: NSLayoutYAxisAnchor? = nil, right: NSLayoutXAxisAnchor? = nil, centerX: NSLayoutXAxisAnchor? = nil, centerY: NSLayoutYAxisAnchor? = nil, topConstant: CGFloat = 0, leftConstant: CGFloat = 0, bottomConstant: CGFloat = 0, rightConstant: CGFloat = 0, widthConstant: CGFloat = 0, heightConstant: CGFloat = 0, widthMultiplier:  CGFloat = 0, heightMultiplier: CGFloat = 0, centerXConstant: CGFloat = 0, centerYConstant: CGFloat = 0) -> [NSLayoutConstraint] {
        translateAll()
        
        var anchors = [NSLayoutConstraint]()
        
        if let top = top {
            anchors.append(topAnchor.constraint(equalTo: top, constant: topConstant))
        }
        
        if let left = left {
            anchors.append(leadingAnchor.constraint(equalTo: left, constant: leftConstant))
        }
        
        if let bottom = bottom {
            anchors.append(bottomAnchor.constraint(equalTo: bottom, constant: -bottomConstant))
        }
        
        if let right = right {
            anchors.append(trailingAnchor.constraint(equalTo: right, constant: -rightConstant))
        }
        
        if let centerX = centerX {
            anchors.append(centerXAnchor.constraint(equalTo: centerX, constant: centerXConstant))
        }
        
        if let centerY = centerY {
            anchors.append(centerYAnchor.constraint(equalTo: centerY, constant: centerYConstant))
        }
        
        if widthMultiplier > 0 {
            anchors.append(widthAnchor.constraint(equalTo: (superview?.widthAnchor)!, multiplier: widthMultiplier))
        }
        
        if heightMultiplier > 0 {
            anchors.append(heightAnchor.constraint(equalTo: (superview?.heightAnchor)!, multiplier: heightMultiplier))
        }
        
        if widthConstant > 0 {
            anchors.append(widthAnchor.constraint(equalToConstant: widthConstant))
        }
        
        if heightConstant > 0 {
            anchors.append(heightAnchor.constraint(equalToConstant: heightConstant))
        }
        
        anchors.forEach({$0.isActive = true})
        return anchors
    }
    
    func addConstraintsWithFormat(format: String, views: UIView...) {
        translateAll()
        var viewsDictionary = [String: UIView]()
          for (index, view) in views.enumerated() {
              let key = "v\(index)"
              view.translateAll()
              viewsDictionary[key] = view
          }
          addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: viewsDictionary))
      }
}

