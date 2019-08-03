//
//  TicketResponse.swift
//  Galen
//
//  Created by Eslam Shaker  on 7/31/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

import Foundation
import Mapper

class AllTicketsResponse: Mappable {
    
    var done: Bool!
    var list: [Ticket]?
    var count: Int!
    
    required init(map: Mapper) throws {
        try done = map.from("done")
        list = map.optionalFrom("list")
        try count = map.from("count")
    }
    
}
