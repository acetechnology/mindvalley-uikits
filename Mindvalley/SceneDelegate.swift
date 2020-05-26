//
//  SceneDelegate.swift
//  mindvally
//
//  Created by Amaechi Osazuwa on 20/05/2020.
//  Copyright © 2020  Amaechi Osazuwa. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow()
        window?.makeKeyAndVisible()
        window?.windowScene = windowScene
        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().barTintColor = .primaryLight
        window?.rootViewController = MainController()
    }
}

