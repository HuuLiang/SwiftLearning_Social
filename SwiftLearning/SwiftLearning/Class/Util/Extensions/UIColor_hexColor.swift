//
//  UIColor_hexColor.swift
//  SwiftLearning
//
//  Created by Liang on 2017/9/11.
//  Copyright © 2017年 iqu8. All rights reserved.
//

import Foundation
import UIKit

public extension UIColor {
    class func hexColor(_ hexColorStr:String) -> UIColor? {
        if hexColorStr.characters.count != 6 {
            return nil;
        }
        var red = CUnsignedInt.init()
        var green = CUnsignedInt.init()
        var blue = CUnsignedInt.init()
        
        var startIndex = hexColorStr.startIndex
        
        //red
        var endIndex = hexColorStr.index(startIndex, offsetBy: 2)
        Scanner.init(string: hexColorStr.substring(with: startIndex..<endIndex)).scanHexInt32(&red)
        startIndex = endIndex
        
        //green
        endIndex = hexColorStr.index(startIndex, offsetBy: 2)
        Scanner.init(string: hexColorStr.substring(with: startIndex..<endIndex)).scanHexInt32(&green)
        startIndex = endIndex
        
        //blue
        endIndex = hexColorStr.index(startIndex, offsetBy: 2)
        Scanner.init(string: hexColorStr.substring(with: startIndex..<endIndex)).scanHexInt32(&blue)
        
        return UIColor.init(red: CGFloat(red)/255.0, green: CGFloat(green)/255.0, blue: CGFloat(blue)/255.0, alpha: 1.0)
    }
}
