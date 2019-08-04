//
//  RegisterResponse.swift
//  Galen
//
//  Created by Eslam Shaker  on 8/4/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

import Foundation
import Mapper

class RegisterResponse: Mappable {
    
    var done: Bool!
    var user: User? 
    var error: String?
    
    required init(map: Mapper) throws {
        try done = map.from("done")
        user = map.optionalFrom("user")
        error = map.optionalFrom("error")
    }
    
}
