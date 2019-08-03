//
//  Review.swift
//  Galen
//
//  Created by Eslam Shaker  on 7/28/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

import Foundation
import Mapper

struct Review: Mappable {
    
    var comment: String?
    var rate: Int?
    var date, patientName, patientImageURL: String?
    
    
    init(map: Mapper) throws {
        comment = map.optionalFrom("comment")
        rate = map.optionalFrom("rate")
        date = map.optionalFrom("date")
        patientName = map.optionalFrom("patient_name")
        patientImageURL = map.optionalFrom("patient_image_url")
    }
    
}
