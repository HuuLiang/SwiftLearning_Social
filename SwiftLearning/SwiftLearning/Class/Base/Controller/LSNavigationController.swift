//
//  LSNavigationController.swift
//  SwiftLearning
//
//  Created by Liang on 2017/9/11.
//  Copyright © 2017年 iqu8. All rights reserved.
//

import UIKit

class LSNavigationController: UINavigationController,UINavigationControllerDelegate,UIGestureRecognizerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.hexColor("ffffff") ?? UIColor.yellow ,NSFontAttributeName:UIFont.systemFont(ofSize: 18.0)];
        self.navigationBar.tintColor = UIColor.hexColor("ffffff")
        self.navigationBar.backIndicatorImage = #imageLiteral(resourceName: "back")
        self.navigationBar.backIndicatorTransitionMaskImage = #imageLiteral(resourceName: "back")
        let image = self.navigationBar.imageWithGradient(CGSize.init(width: kScreenWidth, height: 64), [UIColor.hexColor("EF6FB0"),UIColor.hexColor("ED455C")], GradientDirection.leftToRight)
        self.navigationBar.setBackgroundImage(image, for: UIBarMetrics.default)
        self.delegate = self
        self.interactivePopGestureRecognizer?.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
    
    
}
