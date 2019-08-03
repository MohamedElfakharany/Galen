//
//  Time.swift
//  Galen
//
//  Created by Eslam Shaker  on 7/31/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

import Foundation
import Mapper

class Time : Mappable {
    
    var day: GalenDay!
    var from, to: GalenDate!
    
    
    required init(map: Mapper) throws {
        try day = map.from("day")
        try from = map.from("from")
        try to = map.from("to")
    }
    
}


struct GalenDate: Mappable {
    
    var date: String?
    var hour,minute: Int?
    
    
    init(map: Mapper) throws {
        date = map.optionalFrom("date")
        hour = map.optionalFrom("hour")
        minute = map.optionalFrom("minute")
    }
    
}


struct GalenDay: Mappable {
    
    var id: Int!
    var code: Int?
    var name,en, ar: String?
    

    init(map: Mapper) throws {
        try id = map.from("id")
        code = map.optionalFrom("code")
        name = map.optionalFrom("name")
        en = map.optionalFrom("en")
        ar = map.optionalFrom("ar")
    }
    
}
