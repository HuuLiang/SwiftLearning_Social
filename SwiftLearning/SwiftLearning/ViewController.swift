//
//  ViewController.swift
//  SwiftLearning
//
//  Created by Liang on 16/7/13.
//  Copyright © 2016年 iqu8. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    private
    var myLabel = UILabel()
    var myButton = UIButton()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.green
        
        configLabelAndButton()
    }
    
    
    func printSomething() {
        myButton.isSelected = !myButton.isSelected
        myLabel.text = myButton.isSelected ? "你说什么???" : "我是好人"
    }
    
    func configLabelAndButton() {
        
        myLabel = UILabel()
        myLabel.text = "我是好人"
        myLabel.backgroundColor = UIColor.yellow
        myLabel.textColor = UIColor.red.withAlphaComponent(0.5)
        myLabel.textAlignment = NSTextAlignment.center
        self.view.addSubview(myLabel)
        
        myButton = UIButton.init(type: .custom)
        myButton.setTitle("点我", for: UIControlState.normal)
        myButton.setTitleColor(UIColor.orange, for: UIControlState.normal)
        myButton.titleLabel?.text = "123123"
        myButton.addTarget(self, action: #selector(printSomething), for: UIControlEvents.touchUpInside)
        myButton.backgroundColor = UIColor.red.withAlphaComponent(0.5)
        myButton.layer.cornerRadius = 5
        myButton.layer.masksToBounds = true
        self.view.addSubview(myButton)
        
        myLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(100)
            make.size.equalTo(CGSize.init(width: 200, height: 50))
        }
        
        myButton.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(myLabel.snp.bottom).offset(150)
            make.size.equalTo(CGSize.init(width: 200, height: 40))
        }

    }
    
}

