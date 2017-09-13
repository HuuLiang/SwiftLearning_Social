//
//  LSBaseViewController.swift
//  SwiftLearning
//
//  Created by Liang on 2017/9/11.
//  Copyright © 2017年 iqu8. All rights reserved.
//

import UIKit

class LSBaseViewController: UIViewController {

    public
    
    required init(title:String) {
        super.init(nibName: nil, bundle: nil)
        self.title = title
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.hexColor("ffffff")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
