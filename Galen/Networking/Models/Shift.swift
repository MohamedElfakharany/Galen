//
//  Shift.swift
//  Galen
//
//  Created by Eslam Shaker  on 7/31/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

import Foundation
import Mapper

class Shift: Mappable {
    
    var name: String!
    var timesList: [Time]?
    
    
    required init(map: Mapper) throws {
        try name = map.from("name")
        timesList = map.optionalFrom("times_list")
    }
    
}
