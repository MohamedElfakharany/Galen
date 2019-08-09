//
//  Nurse.swift
//  Galen
//
//  Created by Eslam Shaker  on 8/9/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

import Foundation
import Mapper

class Nurse: Mappable {  //increase later
    
    var id: Int!
    var name: String!
    var nurseID: String?
    
    required init(map: Mapper) throws {
        try name = map.from("name")
        try id = map.from("id")
        try nurseID = map.from("_id")
    }
    
}


class NurseList: Mappable {
    
    var nurse: Nurse?
    
    required init(map: Mapper) throws {
        nurse = map.optionalFrom("nurse")
    }
}
