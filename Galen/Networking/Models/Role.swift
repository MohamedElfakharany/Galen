//
//  Role.swift
//  Galen
//
//  Created by Eslam Shaker  on 7/26/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

import Foundation
import Mapper

struct Role: Mappable {
    
    var name: String!
    
    init(map: Mapper) throws {
        try name = map.from("name")
    }
}
