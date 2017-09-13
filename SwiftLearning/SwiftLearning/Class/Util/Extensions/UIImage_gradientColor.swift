//
//  UIImage_gradientColor.swift
//  SwiftLearning
//
//  Created by Liang on 2017/9/12.
//  Copyright © 2017年 iqu8. All rights reserved.
//

import Foundation
import UIKit


/// 渐变色方向
///
/// - topToBottom: 从上到下
/// - leftToRight: 从左到右
/// - UpleftToLowRight: 左上到右下
/// - UprightToLowLeft: 右上到坐下
public enum GradientDirection {
    case topToBottom
    case leftToRight
    case UpleftToLowRight
    case UprightToLowLeft
}


public extension NSObject {
    func imageWithGradient(_ size:CGSize ,_ colors:[UIColor?],_ gradientDirection:GradientDirection) -> UIImage? {
        if !self.isKind(of: UIView.self) {
            return nil
        }
        
        var colorsArr = [CGFloat]()
        for color in colors {
            guard let colorComponents = color?.cgColor.components else {
                return nil
            }
            for colorComponent in colorComponents {
                colorsArr.append(colorComponent)
            }
        }
        
        UIGraphicsBeginImageContextWithOptions(size, true, 1.0)
        let context:CGContext = UIGraphicsGetCurrentContext()!
        context.saveGState()
        let colorSpace:CGColorSpace = CGColorSpaceCreateDeviceRGB()
        let locations:[CGFloat] = [0.0,1.0]
        guard let gradient = CGGradient.init(colorSpace: colorSpace, colorComponents: colorsArr, locations: locations, count: colors.count) else {
            return nil
        }
        
        var start = CGPoint()
        var end   = CGPoint()
        
        switch gradientDirection {
        case .topToBottom:
            start = CGPoint.init(x: 0.0, y: 0.0)
            end   = CGPoint.init(x: 0.0, y: size.height)
        case .leftToRight:
            start = CGPoint.init(x: 0.0, y: 0.0)
            end   = CGPoint.init(x: size.width, y: 0.0)
        case .UpleftToLowRight:
            start = CGPoint.init(x: 0.0, y: 0.0)
            end   = CGPoint.init(x: size.width, y: size.height)
        case .UprightToLowLeft:
            start = CGPoint.init(x: size.width, y: 0.0)
            end   = CGPoint.init(x: 0.0, y: size.height)
        }
        
        context.drawLinearGradient(gradient, start: start, end: end, options: CGGradientDrawingOptions.drawsAfterEndLocation)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        context.restoreGState()
        UIGraphicsEndImageContext()
        return image;
    }
}






















