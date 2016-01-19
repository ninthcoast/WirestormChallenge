//
//  NetworkController.swift
//  WirestormChallenge
//
//  Created by Ninth Coast on 1/19/16.
//  Copyright © 2016 Ninth Coast. All rights reserved.
//

import Foundation
import Alamofire

class NetworkController {
    
    static let sharedInstance = NetworkController()
    
    enum Methods: String {
        case ASSETS     = "assets/response.json"
    }
    
    func getList(completionHandler: ([Person], NSError?) -> ()) {
        let url = Constants.WebService.Path.stringByAppendingString(Methods.ASSETS.rawValue)
        Alamofire.request(.GET, url, parameters: [:])
            .responseJSON { response in
                if let JSON = response.result.value {
                    var ret: [Person] = []
                    for personJSON in (JSON as! [[String: String]]) {
                        let person = Person(json: personJSON)
                        ret.append(person)
                    }
                    completionHandler(ret,nil)
                    print("JSON: \(JSON)")
                } else {
                    completionHandler([], response.result.error)
                }
        }
    }
    
}