//
//  ICsNames.swift
//  Galen
//
//  Created by elfakharany on 5/3/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

import Foundation

struct ICsName: Codable {
    
    let name : String
    let id : Int
    
    init(_name : String , _id : Int ) {
        name = _name
        id = _id
    }
}
