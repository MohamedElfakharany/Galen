//
//  Doctor.swift
//  Galen
//
//  Created by Eslam Shaker  on 7/27/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

import Foundation
import Mapper

class Doctor: Mappable {
   
    var id: Int!
    var name: String!
    var doctorID: String!
    var imageURL: String?
    var rating: Int?
    var acceptDiscount: Bool?
    var reviewList: [Review]?
    var fee: Int?
    var gender: String?
    var notes, graduated: String?
    var specialty: Speciality?
    var hospital: Hospital?
    
    
    required init(map: Mapper) throws {
        try name = map.from("name")
        try id = map.from("id")
        try doctorID = map.from("_id")
        imageURL = map.optionalFrom("image_url")
        rating = map.optionalFrom("rating")
        acceptDiscount = map.optionalFrom("accept_discount")
        reviewList = map.optionalFrom("review_list")
        fee = map.optionalFrom("fee")
        gender = map.optionalFrom("gender")
        notes = map.optionalFrom("notes")
        graduated = map.optionalFrom("graduated")
        specialty = map.optionalFrom("specialty")
        hospital = map.optionalFrom("hospital")
    }
    
}
