//
//  ChannelCell.swift
//  Mindvalley
//
//  Created by Amaechi Osazuwa on 20/05/2020.
//  Copyright © 2020  Amaechi Osazuwa. All rights reserved.
//

import UIKit

class ChannelEpisodeCell:  UICollectionViewCell {
    
    var episode:EpisodeModel? {
        didSet {
            
            if let episodeTitle = episode?.title  {
                title.text = episodeTitle
            }
            
            if let photoImageview = episode?.coverAsset?.url {
                imageView.loadImageUsingUrlString(urlString: photoImageview)
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
    
    let imageView: ImageLoadFromUrl = {
        let iv = ImageLoadFromUrl()
        iv.backgroundColor = .grayMid
        iv.contentMode = .scaleAspectFill
        iv.layer.cornerRadius = 16
        iv.layer.masksToBounds = true
        return iv
    }()
    
    let title: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.numberOfLines = 3
        label.font = UIFont.beBold(size: 18)
        label.textAlignment = .left
        return label
    }()
    
    override func prepareForReuse() {
        self.title.text = nil
        self.imageView.imageUrlString = nil
        super.prepareForReuse()
    }
    
    
    func setupViews(){
        backgroundColor = .clear
        
        addSubview(imageView)
        addSubview(title)
        
        _ = imageView.anchor(topAnchor, left: leadingAnchor, right: trailingAnchor, widthConstant: frame.width, heightConstant: (frame.height) - 155)
        _ = title.anchor(imageView.bottomAnchor, topConstant: 10, widthConstant: frame.width, heightConstant: 0)
    }
    
}
