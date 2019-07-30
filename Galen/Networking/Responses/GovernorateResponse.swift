//
//  GovernorateResponse.swift
//  Galen
//
//  Created by Eslam Shaker  on 7/30/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

import Foundation
import ObjectMapper

class AllGovsResponse: Mappable {
    
    var done: Bool!
    var list: [City]?
    var count: Int!
    
    required init?(map: Map) {}
    
    
    func mapping(map: Map) {
        done <- map["done"]
        list <- map["list"]
        count <- map["count"]
    }
    
}
