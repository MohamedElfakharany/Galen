//
//  Time.swift
//  Galen
//
//  Created by Eslam Shaker  on 7/31/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

import Foundation
import ObjectMapper

class Time : Mappable {
    
    var day: GalenDay!
    var from, to: GalenDate!
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        day <- map["day"]
        from <- map["from"]
        to <- map["to"]
    }
    
}


struct GalenDate: Mappable {
    
    var date: String?
    var hour,minute: Int?
    
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        date <- map["date"]
        hour <- map["hour"]
        minute <- map["minute"]
    }
    
}


struct GalenDay: Mappable {
    
    var id: Int!
    var code: Int?
    var name,en, ar: String?
    
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        id <- map["id"]
        code <- map["code"]
        name <- map["name"]
        en <- map["en"]
        ar <- map["ar"]
    }
    
}
