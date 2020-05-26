//
//  ChannelHolderCell.swift
//  Mindvalley
//
//  Created by AceTech Business Solutions Limited on 26/05/2020.
//  Copyright © 2020 AceTech Business Solutions Limited. All rights reserved.
//

import UIKit

class ChannelHolderCell: UICollectionViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    var channels: [ChannelModel]?
    private let seriesOrCourseCellID = "seriesOrCourseCellID"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
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
        addSubview(separatorLineView)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(SeriesOrCourseCell.self, forCellWithReuseIdentifier: seriesOrCourseCellID)
        
        _ = collectionView.anchor(topAnchor, left: leadingAnchor, bottom: bottomAnchor, right: trailingAnchor)
        _ = separatorLineView.anchor(left: leadingAnchor, bottom: bottomAnchor, right: trailingAnchor, leftConstant: 14, rightConstant: 14, widthConstant: (frame.width) - 28, heightConstant: 0.5)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return channels?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: seriesOrCourseCellID, for: indexPath) as! SeriesOrCourseCell
        cell.channels = channels?[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width, height:frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 14
    }
    
}
