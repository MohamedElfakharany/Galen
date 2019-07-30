//
//  InsuranceCompany.swift
//  Galen
//
//  Created by Eslam Shaker  on 7/30/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

import Foundation
import ObjectMapper


struct InsuranceCompany: Mappable {
    
    var name: String!
    var id: String?
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        name <- map["name"]
        id <- map["id"]
    }
    
}
