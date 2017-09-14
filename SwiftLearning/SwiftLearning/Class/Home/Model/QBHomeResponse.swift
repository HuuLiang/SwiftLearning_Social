//
//  QBHomeResponse.swift
//  SwiftLearning
//
//  Created by Liang on 2017/9/13.
//  Copyright © 2017年 iqu8. All rights reserved.
//

import UIKit


class detailInfo: QBResponse {
    var aqi:Int?
    var date:String?
    var fl:String?
    var high:String?
    var low:String?
    var notice:String?
    var sunrice:String?
    var sunset:String?
    var type:String?
    required init() {}
}

class data: QBResponse {
    var forecast:[detailInfo]?
    var ganmao:String?
    var pm10:Int?
    var pm25:Int?
    var quality:String?
    var shidu:String?
    var wendu:Int?
    var yesterday:detailInfo?
    required init() {}
}


class QBHomeResponse: QBResponse {
    var city:String?
    var count:Int?
    var data:data?
    var date:Int?
    var message:String?
    var status:Int?
    
    
    required init() {}
}

