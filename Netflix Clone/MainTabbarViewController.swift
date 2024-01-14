//
//  ViewController.swift
//  Netflix Clone
//
//  Created by Mehmet Ali Er on 16.12.2023.
//

import UIKit

class MainTabbarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemYellow
        
        let vc1 = UINavigationController(rootViewController: HomeViewController())
        let vc2 = UINavigationController(rootViewController: UpCommingViewController())
        let vc3 = UINavigationController(rootViewController: SearchViewController())
        
        vc1.tabBarItem.image = UIImage(systemName: "house")
        vc2.tabBarItem.image = UIImage(systemName: "play.circle")
        vc3.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        
        vc1.title = "Home"
        vc2.title = "Coming Soon"
        vc3.title = "Top Search"
        
        tabBar.tintColor = .label
        
        setViewControllers([vc1,vc2,vc3], animated: true)
    }


}

