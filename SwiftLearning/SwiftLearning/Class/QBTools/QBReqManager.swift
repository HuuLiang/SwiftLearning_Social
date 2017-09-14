//
//  QBReqManager.swift
//  SwiftLearning
//
//  Created by Liang on 2017/9/13.
//  Copyright © 2017年 iqu8. All rights reserved.
//

import UIKit
import Alamofire
import HandyJSON

enum QBReqMethodType {
    case Get
    case Post
}

public typealias CompletionHandler = (Bool,Any?) -> Void

protocol EncryptDecryptionDelegate: NSObjectProtocol {
    func encryptParams(Params:[String:AnyObject]) -> AnyObject
    func decryptResponseData(RespData:Data) -> [String:AnyObject]
}

class QBResponse: HandyJSON {
    var code:Int?
    
    required init() {}
}

class QBReqManager: NSObject {
    static let sharedManager = QBReqManager()
    private override init() {}
}

extension QBReqManager {
    func fetchData(urlString:String, params:[String:AnyObject]?, methodType:QBReqMethodType, className:QBResponse.Type, handler:@escaping CompletionHandler) -> Void {
        
        //加密
        
        var reqMethod:HTTPMethod = HTTPMethod.post
        
        switch methodType {
        case .Get:
            reqMethod = HTTPMethod.get
        case .Post:
            reqMethod = HTTPMethod.post
        }
                
        GetServerData(reqUrl: GetWholeUrl(urlString), params: params, method: reqMethod, handler: { (Success:Bool!, resp:Data?) in
            if Success {
                let jsonStr = String.init(data: resp!, encoding: String.Encoding(rawValue: String.Encoding.utf8.rawValue))
                let json = try? JSONSerialization.jsonObject(with: resp!, options: JSONSerialization.ReadingOptions.allowFragments)
                
                guard let respObj = className.deserialize(from: jsonStr) else {
                    return handler(false,nil)
                }
                
                guard let respObjj = QBHomeResponse.deserialize(from: jsonStr) else {
                    return handler(false,nil)
                }
                
                handler(true,respObj)
            } else {
                handler(false,nil)
            }
        })
    }
    
    func GetServerData(reqUrl:URL, params:[String:AnyObject]?, method:HTTPMethod, handler:@escaping (_ Success:Bool, _ response:Data?) -> Void ) -> Void {
        Alamofire.request(reqUrl, method:method, parameters: params, encoding: URLEncoding.default, headers: nil).responseJSON(completionHandler: { (resp:DataResponse) in
            let success = resp.result.isSuccess
            if success {
                handler(true,resp.data!)
            } else {
                handler(false,nil)
            }
        })
    }
    
    func GetWholeUrl(_ urlString:String) -> URL {
//        let wholeString = RequestBaseUrl.appending(urlString).addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        let wholeString = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        return URL.init(string: wholeString)!
    }
    
}
