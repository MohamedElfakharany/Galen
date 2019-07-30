//
//  Doctor.swift
//  Galen
//
//  Created by Eslam Shaker  on 7/27/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

import Foundation
import ObjectMapper

class Doctor: Mappable {
   
    var id: Int!
    var name: String!
    var imageURL: String?
    var rating: Int?
    var acceptDiscount: Bool!
    var reviewList: [Review]?
    var fee: Int?
    var gender: String!
    var notes, graduated: String?
    var specialty: Speciality?
    var hospital: Hospital?
    
    required init?(map: Map) {}
    
    
    func mapping(map: Map) {
        name <- map["name"]
        id <- map["id"]
        imageURL <- map["image_url"]
        rating <- map["rating"]
        acceptDiscount <- map["accept_discount"]
        reviewList <- map["review_list"]
        fee <- map["fee"]
        gender <- map["gender"]
        notes <- map["notes"]
        graduated <- map["graduated"]
        specialty <- map["specialty"]
        hospital <- map["hospital"]
    }
    
}
