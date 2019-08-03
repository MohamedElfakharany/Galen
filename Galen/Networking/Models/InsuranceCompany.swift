//
//  InsuranceCompany.swift
//  Galen
//
//  Created by Eslam Shaker  on 7/30/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

import Foundation
import Mapper

struct InsuranceCompany: Mappable {
    
    var name: String!
    var id: String?
    
    init(map: Mapper) throws {
        try name = map.from("name")
        id = map.optionalFrom("id")
    }
    
}
