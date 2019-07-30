//
//  specialty.swift
//  Galen
//
//  Created by Eslam Shaker  on 7/27/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

import Foundation
import ObjectMapper

struct Speciality: Mappable {
   
    var name: String!
    var id: String?
    var specialityID: Int?
    var imageURL: String?
    var active: Bool?
    var addUserInfo: UserInfo?
    
    init?(map: Map) {}
    
    
    mutating func mapping(map: Map) {
        name <- map["name"]
        id <- map["_id"]
        specialityID <- map["id"]
        imageURL <- map["image_url"]
        active <- map["active"]
        addUserInfo <- map["add_user_info"]
    }
    
}
