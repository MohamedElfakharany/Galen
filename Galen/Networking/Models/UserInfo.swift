//
//  UserInfo.swift
//  Galen
//
//  Created by Eslam Shaker  on 7/27/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

import Foundation
import Mapper

struct UserInfo: Mappable {
    
    var id: Int!
    var email: String?
    var date: String?
    var ip: String?
    var name: String?
    
    
    init(map: Mapper) throws {
        try id = map.from("id")
        email = map.optionalFrom("email")
        date = map.optionalFrom("date")
        ip = map.optionalFrom("ip")
        name = map.optionalFrom("name")
    }
    
}


