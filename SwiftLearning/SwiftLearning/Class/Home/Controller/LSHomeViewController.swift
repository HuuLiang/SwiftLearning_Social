//
//  LSHomeViewController.swift
//  SwiftLearning
//
//  Created by Liang on 2017/9/11.
//  Copyright © 2017年 iqu8. All rights reserved.
//

import UIKit

class LSHomeViewController: LSBaseViewController {
    
    
    var dataSource = Array<Any>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        LSReqManager.sharedManager.fetchHomeData(handler: { (Success:Bool, resp:Any?) in
            
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
