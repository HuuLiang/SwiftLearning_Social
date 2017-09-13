//
//  LSTabBarViewController.swift
//  SwiftLearning
//
//  Created by Liang on 2017/9/11.
//  Copyright © 2017年 iqu8. All rights reserved.
//

import UIKit

class LSTabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.configViewControllers()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func configViewControllers() -> Void {
        
        let homeVC = LSHomeViewController.init(title: "首页")
        let homeNav = LSNavigationController.init(rootViewController: homeVC)
        homeNav.tabBarItem = UITabBarItem.init(title: homeVC.title, image: UIImage.init(named: "home_normal")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal) , selectedImage: UIImage.init(named: "home_selected")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal))
        
        let discvoerVC = LSDiscoverViewController.init(title: "发现")
        let discoverNav = LSNavigationController.init(rootViewController: discvoerVC)
        discoverNav.tabBarItem = UITabBarItem.init(title: discvoerVC.title, image: UIImage.init(named: "discover_normal")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal) , selectedImage: UIImage.init(named: "discover_selected")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal))

        let contactVC = LSContactViewController.init(title: "消息")
        let contactNav = LSNavigationController.init(rootViewController: contactVC)
        contactNav.tabBarItem = UITabBarItem.init(title: contactVC.title, image: UIImage.init(named: "contact_normal")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal) , selectedImage: UIImage.init(named: "contact_selected")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal))

        let mineVC = LSMineViewController.init(title: "我的")
        let mineNav = LSNavigationController.init(rootViewController: mineVC)
        mineNav.tabBarItem = UITabBarItem.init(title: discvoerVC.title, image: UIImage.init(named: "mine.normal")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal) , selectedImage: UIImage.init(named: "mine.selected")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal))
        mineNav.tabBarItem = UITabBarItem.init(title: mineVC.title, image: #imageLiteral(resourceName: "mine_normal").withRenderingMode(UIImageRenderingMode.alwaysOriginal), selectedImage: #imageLiteral(resourceName: "mine_selected").withRenderingMode(UIImageRenderingMode.alwaysOriginal))
        
        self.tabBar.isTranslucent = false
        self.viewControllers = [homeNav,discoverNav,contactNav,mineNav]
    }
}
