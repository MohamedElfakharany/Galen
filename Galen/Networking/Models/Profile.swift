//
//  Profile.swift
//  Galen
//
//  Created by Eslam Shaker  on 7/27/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

import Foundation
import ObjectMapper

struct Profile: Mappable {
    var name, mobile: String!
    var imageURL: String?
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        name <- map["name"]
        mobile <- map["mobile"]
        imageURL <- map["image_url"]

    }
}
