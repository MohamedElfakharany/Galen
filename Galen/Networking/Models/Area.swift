//
//  Area.swift
//  Galen
//
//  Created by Eslam Shaker  on 7/30/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

import Foundation

struct Area: Codable {
    
    let name : String?
    let id : Int?
    
    init(_name : String , _id : Int ) {
        name = _name
        id = _id
    }
}
