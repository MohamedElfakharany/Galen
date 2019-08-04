//
//  Permission.swift
//  Galen
//
//  Created by Eslam Shaker  on 8/4/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

import Foundation
import Mapper

struct PermissionInfo: Mappable {
    
    var moduleName, screenName, name, en, ar: String?
    
    
    init(map: Mapper) throws {
        name = map.optionalFrom("name")
        moduleName = map.optionalFrom("module_name")
        screenName = map.optionalFrom("screen_name")
        en = map.optionalFrom("en")
        ar = map.optionalFrom("ar")
    }
    
}
