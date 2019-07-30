//
//  City.swift
//  Galen
//
//  Created by Eslam Shaker  on 7/27/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

import Foundation
import ObjectMapper


class City: Mappable {
    var name: String!
    var id: String?
    var cityID: Int?
    var imageURL: String?
    var active: Bool?
    var gov: City?
    
    
    required init?(map: Map) {}
    
    
    func mapping(map: Map) {
        name <- map["name"]
        id <- map["_id"]
        cityID <- map["id"]
        imageURL <- map["image_url"]
        active <- map["active"]
        gov <- map["gov"]
    }
    
}
