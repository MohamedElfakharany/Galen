//
//  Clinic.swift
//  Galen
//
//  Created by Eslam Shaker  on 7/31/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

import Foundation
import Mapper


class Clinic: Mappable {
    
    var name: String?
    var id: Int?
    var active: Bool?
    var latitude, longitude: Int?
    var address: String?
    var city, gov: City?
    var imageURL, email: String?
    var insuranceCompanyList: [InsuranceCompany]?
    var nurseList: [NurseList]?
    var website, phone: String?
    var doctorList: [DoctorList]?
    var hospital: Hospital?
    
    
    required init(map: Mapper) throws {
        id = map.optionalFrom("id")
        name = map.optionalFrom("name")
        active = map.optionalFrom("active")
        latitude = map.optionalFrom("latitude")
        longitude = map.optionalFrom("longitude")
        address = map.optionalFrom("address")
        city = map.optionalFrom("city")
        gov = map.optionalFrom("gov")
        imageURL = map.optionalFrom("image_url")
        email = map.optionalFrom("email")
        insuranceCompanyList = map.optionalFrom("insurance_company_list")
        nurseList = map.optionalFrom("nurse_list")
        website = map.optionalFrom("website")
        phone = map.optionalFrom("phone")
        doctorList = map.optionalFrom("doctor_list")
        hospital = map.optionalFrom("hospital")
    }
}
