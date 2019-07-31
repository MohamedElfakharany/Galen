//
//  InsuranceCompanyResponse.swift
//  Galen
//
//  Created by Eslam Shaker  on 7/31/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

import Foundation
import ObjectMapper

class AllInsuranceCompaniesResponse: Mappable {
    
    var done: Bool!
    var list: [InsuranceCompany]?
    var count: Int!
    
    required init?(map: Map) {}
    
    
    func mapping(map: Map) {
        done <- map["done"]
        list <- map["list"]
        count <- map["count"]
    }
    
}
