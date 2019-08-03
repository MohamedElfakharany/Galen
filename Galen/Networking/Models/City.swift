//
//  City.swift
//  Galen
//
//  Created by Eslam Shaker  on 7/27/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

import Foundation
import Mapper

class City: Mappable {
    
    var name: String!
    var id: String?
    var cityID: Int?
    var imageURL: String?
    var active: Bool?
    var gov: City?

    
    required init(map: Mapper) throws {
        try name = map.from("name")
        id = map.optionalFrom("_id")
        cityID = map.optionalFrom("id")
        imageURL = map.optionalFrom("image_url")
        active = map.optionalFrom("active")
        gov = map.optionalFrom("gov")
    }
    
}
