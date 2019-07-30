//
//  UserInfo.swift
//  Galen
//
//  Created by Eslam Shaker  on 7/27/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

import Foundation
import ObjectMapper

struct UserInfo: Mappable {
    
    var id: Int!
    var email: String?
    var date: String?
    var ip: String?
    var name: String?
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        id <- map["id"]
        email <- map["email"]
        date <- map["date"]
        ip <- map["ip"]
        name <- map["name"]
    }
    
}


