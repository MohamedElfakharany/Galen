//
//  specialty.swift
//  Galen
//
//  Created by Eslam Shaker  on 7/27/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

import Foundation
import Mapper

struct Speciality: Mappable {
   
    var name: String!
    var id: String?
    var specialityID: Int?
    var imageURL: String?
    var active: Bool?
    var addUserInfo: UserInfo?
    
    
    init(map: Mapper) throws {
        try name = map.from("name")
        id = map.optionalFrom("_id")
        specialityID = map.optionalFrom("id")
        imageURL = map.optionalFrom("image_url")
        active = map.optionalFrom("active")
        addUserInfo = map.optionalFrom("add_user_info")
    }
    
}
