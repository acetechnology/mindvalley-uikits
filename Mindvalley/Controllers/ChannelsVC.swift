//
//  ChannelVC.swift
//  Mindvalley
//
//  Created by Amaechi Osazuwa on 20/05/2020.
//  Copyright © 2020  Amaechi Osazuwa. All rights reserved.
//

import UIKit
import CoreData

class ChannelsVC: UICollectionViewController, UICollectionViewDelegateFlowLayout, NSFetchedResultsControllerDelegate {
    
    private let mediaHolderCellID = "media"
    private let seriesOrCourseCellID = "seriesOrCourseCellID"
    private let categoryHolderCellID = "category"
    
    var episodes: [EpisodeModel]?
    var categories: [CategoryModel]?
    var allChannels: [ChannelModel]?
    var refresher = UIRefreshControl()
    
    var numberOfSection: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getAll()
        setupViewController()
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.item == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: mediaHolderCellID, for: indexPath) as! MediaHolderCell
            cell.episodes = episodes
            return cell
        }
        
        if indexPath.item == 10 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: categoryHolderCellID, for: indexPath) as! CategoryHolderCell
            cell.categories = categories
            return cell
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: seriesOrCourseCellID, for: indexPath) as! SeriesOrCourseCell
        var iterator = indexPath.item - 2
        if iterator < 1 {
            iterator = 0
        }
        cell.channels = allChannels?[iterator]
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numberOfSection
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.item == 10 {
            let height = view.frame.height * 0.8
            return CGSize(width: view.frame.width, height: height)
        }
        let height = view.frame.height * 0.68
        return CGSize(width: view.frame.width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 14
    }
    
    private let imageView:UIImageView = {
        let imageview = UIImageView(image: UIImage(named: "user"))
        imageview.layer.cornerRadius = Const.ImageSizeForLargeState / 2
        imageview.clipsToBounds = true
        return imageview
    }()
    
    private struct Const {
        /// Image height/width for Large NavBar state
        static let ImageSizeForLargeState: CGFloat = 30
        /// Margin from right anchor of safe area to right anchor of Image
        static let ImageRightMargin: CGFloat = 16
        /// Margin from bottom anchor of NavBar to bottom anchor of Image for Large NavBar state
        static let ImageBottomMarginForLargeState: CGFloat = 6
        /// Margin from bottom anchor of NavBar to bottom anchor of Image for Small NavBar state
        static let ImageBottomMarginForSmallState: CGFloat = 6
        /// Image height/width for Small NavBar state
        static let ImageSizeForSmallState: CGFloat = 32
        /// Height of NavBar for Small state. Usually it's just 44
        static let NavBarHeightSmallState: CGFloat = 44
        /// Height of NavBar for Large state. Usually it's just 96.5 but if you have a custom font for the title, please make sure to edit this value since it changes the height for Large state of NavBar
        static let NavBarHeightLargeState: CGFloat = 96.5
    }
    
    
    //setting up the view for the different cells
    func setupViewController() {
        refresherView(refresher: refresher, selector: #selector(getAll))
        collectionView.backgroundColor = .primaryLight
        collectionView.showsVerticalScrollIndicator = false
        
        collectionView.register(MediaHolderCell.self, forCellWithReuseIdentifier: mediaHolderCellID)
        collectionView.register(SeriesOrCourseCell.self, forCellWithReuseIdentifier: seriesOrCourseCellID)
        collectionView.register(CategoryHolderCell.self, forCellWithReuseIdentifier: categoryHolderCellID)
        
        navigationItem.title = "Channels"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.gray, NSAttributedString.Key.font: UIFont.beExtraBold(size: 26)]
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.gray, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14, weight: .regular)]
        
        guard let navigationBar = self.navigationController?.navigationBar else { return }
        navigationBar.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.rightAnchor.constraint(equalTo: navigationBar.rightAnchor, constant: -Const.ImageRightMargin),
            imageView.bottomAnchor.constraint(equalTo: navigationBar.bottomAnchor, constant: -Const.ImageBottomMarginForLargeState),
            imageView.heightAnchor.constraint(equalToConstant: Const.ImageSizeForLargeState),
            imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor)
        ])
    }
    
    private func moveAndResizeImage(for height: CGFloat) {
        let coeff: CGFloat = {
            let delta = height - Const.NavBarHeightSmallState
            let heightDifferenceBetweenStates = (Const.NavBarHeightLargeState - Const.NavBarHeightSmallState)
            return delta / heightDifferenceBetweenStates
        }()
        
        let factor = Const.ImageSizeForSmallState / Const.ImageSizeForLargeState
        
        let scale: CGFloat = {
            let sizeAddendumFactor = coeff * (1.0 - factor)
            return min(1.0, sizeAddendumFactor + factor)
        }()
        
        // Value of difference between icons for large and small states
        let sizeDiff = Const.ImageSizeForLargeState * (1.0 - factor) // 8.0
        let yTranslation: CGFloat = {
            /// This value = 14. It equals to difference of 12 and 6 (bottom margin for large and small states). Also it adds 8.0 (size difference when the image gets smaller size)
            let maxYTranslation = Const.ImageBottomMarginForLargeState - Const.ImageBottomMarginForSmallState + sizeDiff
            return max(0, min(maxYTranslation, (maxYTranslation - coeff * (Const.ImageBottomMarginForSmallState + sizeDiff))))
        }()
        
        let xTranslation = max(0, sizeDiff - coeff * sizeDiff)
        
        imageView.transform = CGAffineTransform.identity
            .scaledBy(x: scale, y: scale)
            .translatedBy(x: xTranslation, y: yTranslation)
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard let height = navigationController?.navigationBar.frame.height else { return }
        moveAndResizeImage(for: height)
    }
    
    
    //fetch new episodes
    private func fetchMedia(){
        ApiServices.sharedInstance.getGenericData(urlString: "z5AExTtw") { (res:Result<DataTModel<MediaModel>, Error>) in
            switch res {
            case .success(let media):
                guard let episodes = media.data?.media else {return}
                self.numberOfSection += 1
                self.episodes = episodes
                self.collectionView?.reloadData()
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
    
    //fetch categories
    private func fetchCategories(){
        ApiServices.sharedInstance.getGenericData(urlString: "A0CgArX3") { (res:Result<DataTModel<CategoriesModel>, Error>) in
            switch res {
            case .success(let categories):
                guard let categories = categories.data?.categories else {return}
                self.numberOfSection += 1
                self.categories = categories
                self.collectionView?.reloadData()
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
    
    //fetch channels
    private func fetchChannels(){
        ApiServices.sharedInstance.getGenericData(urlString: "Xt12uVhM") { (res:Result<DataTModel<ChannelsModel>, Error>) in
            switch res {
            case .success(let channels):
                guard let allCh = channels.data?.channels else {return}
                self.allChannels = allCh
                //the two added is for new episodes and category
                self.numberOfSection += allCh.count
                self.collectionView?.reloadData()
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
    
    func refresherView(refresher:UIRefreshControl, selector:Selector) {
        let attrsDictionary = [NSAttributedString.Key.foregroundColor:UIColor.white, NSAttributedString.Key.font:UIFont.boldSystemFont(ofSize: 14)]
        refresher.attributedTitle = NSAttributedString(string: "Pull To Refresh", attributes: attrsDictionary)
        refresher.translatesAutoresizingMaskIntoConstraints = false
        refresher.tintColor = .grayMid
        collectionView?.addSubview(refresher)
        refresher.addTarget(self, action: selector, for: .valueChanged)
    }
    
    @objc private func getAll() {
        fetchMedia()
        fetchCategories()
        fetchChannels()
        self.refresher.endRefreshing()
    }
}


