//
//  ViewController.swift
//  Mindvalley
//
//  Created by Amaechi Osazuwa on 20/05/2020.
//  Copyright © 2020  Amaechi Osazuwa. All rights reserved.
//

import UIKit

class CustomNavigationController: UINavigationController {
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
}

class MainController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewController()
    }
    
    func setupViewController(){
        
        tabBar.tintColor = .highligted
        tabBar.barTintColor = .primaryDark

        //Today View Controller
        let todayVC = TodayVC(collectionViewLayout:UICollectionViewFlowLayout())
        let todayController = CustomNavigationController(rootViewController: todayVC)
        todayController.tabBarItem.image = UIImage(named: "today")
        todayController.tabBarItem.selectedImage = UIImage(named: "today")
        todayController.tabBarController?.title = "Today"
        todayController.view.backgroundColor = .primaryLight
        todayController.title = "Today"
            
        //Programs View Controller
        let programsVC = ProgramsVC(collectionViewLayout:UICollectionViewFlowLayout())
        let programsController = CustomNavigationController(rootViewController: programsVC)
        programsController.tabBarItem.image = UIImage(named: "programs")
        programsController.title = "Programs"
        programsController.tabBarController?.title = "Programs"
        programsController.view.backgroundColor = .primaryLight
        programsController.tabBarItem.selectedImage = UIImage(named: "programs")
        
        //Channels View Controller
        let channelsVC = ChannelsVC(collectionViewLayout:UICollectionViewFlowLayout())
        let channelsController = CustomNavigationController(rootViewController: channelsVC)
        channelsController.tabBarItem.image = UIImage(named: "channels")
        channelsController.title = "Channels"
        channelsController.tabBarController?.title = "Channels"
        channelsController.view.backgroundColor = .primaryLight
        channelsController.tabBarItem.selectedImage = UIImage(named: "channels")
        
        //Community View Controller
        let communityVC = CommunityVC(collectionViewLayout:UICollectionViewFlowLayout())
        let communityController = CustomNavigationController(rootViewController:communityVC)
        communityController.tabBarItem.image = UIImage(named: "community")
        communityController.title = "Community"
        communityController.tabBarController?.title = "Community"
        communityController.view.backgroundColor = .primaryLight
        communityController.tabBarItem.selectedImage = UIImage(named: "community")
            
        //News View Controller
        let newsVC = NewsVC(collectionViewLayout:UICollectionViewFlowLayout())
        let newsController = CustomNavigationController(rootViewController: newsVC)
        newsController.tabBarItem.image = UIImage(named: "news")
        newsController.title = "News"
        newsController.tabBarController?.title = "News"
        newsController.tabBarItem.selectedImage = UIImage(named: "news")
        newsController.tabBarItem.badgeValue = "5"
        newsController.view.backgroundColor = .primaryLight
        newsController.tabBarItem.badgeColor = .red
            
        viewControllers = [todayController, programsController, channelsController, communityController, newsController]
        self.selectedViewController = channelsController
            
        //modify tab bar item insets
            guard let items = tabBar.items else { return }
                for item in items {
                    item.imageInsets = UIEdgeInsets(top: 3, left: 0, bottom: 0, right: 0)
                    item.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: 0)
                }
    }
}


