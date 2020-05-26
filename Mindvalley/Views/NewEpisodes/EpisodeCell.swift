//
//  EpisodeCell.swift
//  Mindvalley
//
//  Created by Amaechi Osazuwa on 20/05/2020.
//  Copyright © 2020  Amaechi Osazuwa. All rights reserved.
//

import UIKit

class EpisodeCell: UICollectionViewCell {
    
    var episode:EpisodeModel? {
        didSet {
            if let episodeTitle = episode?.title  {
                title.text = episodeTitle
            }
            
            if let episodeChannel = episode?.channel?.title  {
                channel.text = episodeChannel.dropIntoANewLine().uppercased()
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
    
    let channel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.numberOfLines = 2
        label.font = UIFont.beBold(size: 14)
        label.textAlignment = .left
        label.sizeToFit()
        return label
    }()
    
    func setupViews(){
        backgroundColor = .clear
        
        addSubview(imageView)
        addSubview(title)
        addSubview(channel)
        
        _ = imageView.anchor(topAnchor, left: leadingAnchor, right: trailingAnchor, widthConstant: frame.width, heightConstant: (frame.height) - 155)
        _ = title.anchor(imageView.bottomAnchor, topConstant: 10, widthConstant: frame.width * 0.7, heightConstant: 0)
        _ = channel.anchor(title.bottomAnchor, left: leadingAnchor, right: trailingAnchor, topConstant: 12, widthConstant: frame.width, heightConstant: 0)
    }
}
