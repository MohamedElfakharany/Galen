//
//  Profile.swift
//  Galen
//
//  Created by Eslam Shaker  on 7/27/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

import Foundation
import Mapper

struct Profile: Mappable {
    
    var name, mobile: String!
    var imageURL: String?
    
    init(map: Mapper) throws {
        try name = map.from("name")
        try mobile = map.from("mobile")
        imageURL = map.optionalFrom("image_url")
    }
}
