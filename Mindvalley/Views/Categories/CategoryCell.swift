//
//  CategoryCell.swift
//  Mindvalley
//
//  Created by Amaechi Osazuwa on 20/05/2020.
//  Copyright © 2020  Amaechi Osazuwa. All rights reserved.
//

import UIKit

class CategoryCell: UICollectionViewCell {
    
    var category:CategoryModel? {
        didSet {
            if let name = category?.name  {
                title.text = name
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let bg: UIView = {
        let v = UIView()
        v.backgroundColor = .grayMid
        return v
    }()
    
    let title: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.numberOfLines = 2
        label.font = UIFont.beBold(size: 18)
        label.textAlignment = .center
        label.sizeToFit()
        return label
    }()
    
    
    func setupViews(){
        backgroundColor = .clear
        
        addSubview(bg)
        addSubview(title)
        
        _ = bg.anchor(topAnchor, left: leadingAnchor, right: trailingAnchor, topConstant: 10, widthConstant: frame.width, heightConstant: frame.height)
        bg.layer.cornerRadius = frame.height * 0.5
        _ = title.anchor(centerX: bg.centerXAnchor,  centerY: bg.centerYAnchor, widthConstant: frame.width * 0.7)
    }
}
