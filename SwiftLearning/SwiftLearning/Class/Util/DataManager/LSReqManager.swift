//
//  LSReqManager.swift
//  SwiftLearning
//
//  Created by Liang on 2017/9/13.
//  Copyright © 2017年 iqu8. All rights reserved.
//

import UIKit

class LSReqManager: NSObject {
    static let sharedManager = LSReqManager()
    private override init() {}
}


extension LSReqManager {
    
    func fetchHomeData(handler:@escaping CompletionHandler) {
        QBReqManager.sharedManager.fetchData(urlString: "http://www.sojson.com/open/api/weather/json.shtml?city=北京", params: nil, methodType: QBReqMethodType.Get, className: QBHomeResponse.self, handler: handler)
    }
}
