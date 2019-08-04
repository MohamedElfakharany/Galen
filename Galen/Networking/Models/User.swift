//
//  User.swift
//  Galen
//
//  Created by Eslam Shaker  on 8/4/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

import Foundation
import Mapper

class User: Mappable {
    
    var id, name, mobile, username: String!
    var userID: Int?
    var email: String?
    var password: String?
    var imageURL: String?
    var role: String?
    var type: String?
    var roles: [Role]?
    var profile: Profile?
    var permissions, userPermissions: [String]?
    var addedUserInfo: UserInfo?
    var permissionInfo: PermissionInfo?
    
    
    required init(map: Mapper) throws {
        try id = map.from("_id")
        try name =  map.from("name")
        try mobile =  map.from("mobile")
        try username =  map.from("username")
        userID =  map.optionalFrom("id")
        email =  map.optionalFrom("email")
        password =  map.optionalFrom("password")
        imageURL =  map.optionalFrom("image_url")
        role =  map.optionalFrom("role")
        type =  map.optionalFrom("type")
        roles =  map.optionalFrom("roles")
        profile =  map.optionalFrom("profile")
        permissions =  map.optionalFrom("permissions")
        userPermissions =  map.optionalFrom("$permissions")
        addedUserInfo =  map.optionalFrom("added_user_info")
        permissionInfo =  map.optionalFrom("$permissions_info")
    }
    
}
