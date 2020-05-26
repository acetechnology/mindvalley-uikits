//
//  MediaHolderCell.swift
//  Mindvalley
//
//  Created by Amaechi Osazuwa on 20/05/2020.
//  Copyright © 2020  Amaechi Osazuwa. All rights reserved.
//

import UIKit

class MediaHolderCell: UICollectionViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    var episodes: [EpisodeModel]?
    private let episodeCellID = "newEpisodes"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let sectionLabel: UILabel = {
        let label: UILabel = UILabel()
        label.textColor = .grayLight
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textAlignment = .left
        label.text = "New Episodes"
        label.numberOfLines = 1
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
        addSubview(collectionView)
        addSubview(sectionLabel)
        addSubview(separatorLineView)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(EpisodeCell.self, forCellWithReuseIdentifier: episodeCellID)
        
        _ = sectionLabel.anchor(topAnchor, left: leadingAnchor, topConstant: 15, leftConstant: 14, widthConstant: frame.width, heightConstant: 20)
        _ = collectionView.anchor(sectionLabel.bottomAnchor, left: leadingAnchor, right: trailingAnchor, topConstant: 15, widthConstant: frame.width, heightConstant: frame.height)
        _ = separatorLineView.anchor(left: leadingAnchor, bottom: bottomAnchor, right: trailingAnchor, leftConstant: 14, rightConstant: 14, widthConstant: (frame.width) - 28, heightConstant: 0.5)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return episodes?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: episodeCellID, for: indexPath) as! EpisodeCell
        cell.episode = episodes?[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (frame.width) * 7/16, height:frame.height - 26.5)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 14
    }
    
}
