//
//  Clinic.swift
//  Galen
//
//  Created by Eslam Shaker  on 7/31/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

import Foundation
import Mapper

class Clinic: Mappable { //increase this model later
    
    var id: Int?
    var name: String?
    
    
    required init(map: Mapper) throws {
        id = map.optionalFrom("id")
        name = map.optionalFrom("name")
    }
    
}
