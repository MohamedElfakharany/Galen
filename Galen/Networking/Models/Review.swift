//
//  Review.swift
//  Galen
//
//  Created by Eslam Shaker  on 7/28/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

import Foundation
import ObjectMapper

struct Review: Mappable {
    
    var comment: String?
    var rate: Int?
    var date, patientName, patientImageURL: String?
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        comment <- map["comment"]
        rate <- map["rate"]
        date <- map["date"]
        patientName <- map["patient_name"]
        patientImageURL <- map["patient_image_url"]
    }
    
}
