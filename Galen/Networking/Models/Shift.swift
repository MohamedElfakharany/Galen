//
//  Shift.swift
//  Galen
//
//  Created by Eslam Shaker  on 7/31/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

import Foundation
import ObjectMapper

class Shift: Mappable {
    
    var name: String!
    var timesList: [Time]?
    
    required init?(map: Map) {}
    
    
    func mapping(map: Map) {
        name <- map["name"]
        timesList <- map["times_list"]
    }
    
}
