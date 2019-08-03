//
//  Gender.swift
//  Galen
//
//  Created by Eslam Shaker  on 7/27/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

import Foundation
import Mapper

struct Gender: Mappable {
   
    var name: String!
    var id: Int?
    
    init(map: Mapper) throws {
        try name = map.from("name")
        id = map.optionalFrom("id")
    }
}
