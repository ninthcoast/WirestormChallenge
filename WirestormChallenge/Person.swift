//
//  Person.swift
//  WirestormChallenge
//
//  Created by Ninth Coast on 1/19/16.
//  Copyright © 2016 Ninth Coast. All rights reserved.
//

import Foundation


class Person {
    
    var name: String?
    var position: String?
    var smallpic: String?
    var lrgpic: String?
    
    convenience init(json: [String: String]) {
        self.init()
        
        name     = json["name"]
        position = json["position"]
        smallpic = json["smallpic"]
        lrgpic   = json["lrgpic"]
    }
    
}