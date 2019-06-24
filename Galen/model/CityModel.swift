//
//  CityModel.swift
//  Galen
//
//  Created by Amr Ali on 4/25/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

import Foundation

struct Gov: Codable {
    
    let name : String?
    let id : Int?
    
    init(_name : String , _id : Int ) {
        name = _name
        id = _id
    }
}
