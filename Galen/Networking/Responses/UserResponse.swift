//
//  UserResponse.swift
//  Galen
//
//  Created by Eslam Shaker  on 7/31/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

import Foundation
import Mapper

struct UserResponse: Mappable {
    
    var done: Bool?
    var accessToken: String?
    var error: String?
    var user: User?
    
     init(map: Mapper) throws {
        done = map.optionalFrom("done")
        accessToken = map.optionalFrom("accessToken")
        user = map.optionalFrom("user")
        error = map.optionalFrom("error")
    }
    
}
