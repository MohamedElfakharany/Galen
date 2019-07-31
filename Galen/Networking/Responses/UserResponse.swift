//
//  UserResponse.swift
//  Galen
//
//  Created by Eslam Shaker  on 7/31/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

import Foundation
import ObjectMapper

struct UserResponse: Mappable {
    
    var done: Bool!
    var accessToken: String!
    
    init?(map: Map) {}
    
    
    mutating func mapping(map: Map) {
        done <- map["done"]
        accessToken <- map["accessToken"]
    }
    
}
