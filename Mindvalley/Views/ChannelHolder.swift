//
//  ChannelHolder.swift
//  Mindvalley
//
//  Created by Amaechi Osazuwa on 20/05/2020.
//  Copyright © 2020  Amaechi Osazuwa. All rights reserved.
//

import UIKit

class ChannelsHolderCell: UICollectionViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    var channels:ChannelModel? {
        didSet {
            if let title = channels?.title  {
                channelTitle.text = title
            }
            
            if let noOfEpisodes = channels?.mediaCount  {
                numberOfEpisodes.text = "\(noOfEpisodes) Episodes"
            }
            if let photoImageview = channels?.coverAsset?.url {
                channelIcon.loadImageUsingUrlString(urlString: photoImageview)
            }
        }
    }
    
    private let episodeCellID = "episodeCellID"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let channelIcon: ImageLoadFromUrl = {
        let iv = ImageLoadFromUrl()
        iv.backgroundColor = .gray
        iv.contentMode = .scaleAspectFill
        iv.layer.cornerRadius = 25
        iv.layer.masksToBounds = true
        return iv
    }()
    
    let channelTitle:UILabel = {
        let label: UILabel = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textAlignment = .left
        label.numberOfLines = 1
        label.sizeToFit()
        return label
    }()
    
    let numberOfEpisodes: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.numberOfLines = 1
        label.font = UIFont.beRegular(size: 16)
        label.textAlignment = .left
        label.sizeToFit()
        return label
    }()
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero,collectionViewLayout:layout)
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    let separatorLineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.rgb(red: 181, green: 184, blue: 184, alpha: 0.2)
        return view
    }()
    
    func setupViews(){
        
        addSubview(channelIcon)
        addSubview(channelTitle)
        addSubview(numberOfEpisodes)
        addSubview(collectionView)
        addSubview(separatorLineView)
        
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(EpisodeCell.self, forCellWithReuseIdentifier: episodeCellID)
        
        _ = channelIcon.anchor(topAnchor, left: leadingAnchor, topConstant: 8, leftConstant: 14, widthConstant: 50, heightConstant: 50)
        _ = channelTitle.anchor(left: channelIcon.trailingAnchor, right: trailingAnchor, centerY: channelIcon.centerYAnchor, leftConstant: 20, rightConstant: 14, centerYConstant: -10)
        _ = numberOfEpisodes.anchor(channelTitle.bottomAnchor, left: channelTitle.leadingAnchor, heightConstant: 20)
        _ = collectionView.anchor(channelIcon.bottomAnchor, left: leadingAnchor, right: trailingAnchor, topConstant: 15, widthConstant: frame.width, heightConstant: frame.height)
        _ = separatorLineView.anchor(left: leadingAnchor, bottom: bottomAnchor, right: trailingAnchor, leftConstant: 14, rightConstant: 14, widthConstant: (frame.width) - 28, heightConstant: 0.5)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return  0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: episodeCellID, for: indexPath) as! EpisodeCell
        //        cell.episode = channels?[indexPath.item].series
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if !(channels?.series?.isEmpty ?? false) {
            print("i got here")
             return CGSize(width: (frame.width) * 5/16, height:frame.height - 6.5)
        }
        return CGSize(width: (frame.width) * 7/16, height:frame.height - 26.5)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 14
    }
    
}
