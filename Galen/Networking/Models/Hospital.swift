//
//  Hospital.swift
//  Galen
//
//  Created by Eslam Shaker  on 7/28/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

import Foundation
import Mapper

class Hospital: Mappable {
   
    var id: String?
    var hospitalID: Int?
    var name, mobile, username, email: String?
    var password, imageURL, role, type: String?
    var roles: [Role]?
    var profile: Profile?
    var permissions: [String]?
    var userInfo, addedUserInfo, addUserInfo, editUserInfo: UserInfo?
    var hospitalName, hospitalMobile, hospitalUserName, hospitalPassword: String?
    var doctorList: [Doctor]?
    var insuranceCompanyList: [InsuranceCompany]?
    var nurseList : [String]?   //TODO: check nurse model
    var active: Bool?
    var latitude, longitude: String?
    var gov, city: City?
    var hospitalLatitude, hospitalLongitude, address, website: String?
    
    
    required init(map: Mapper) throws {
        id = map.optionalFrom("_id")
        hospitalID = map.optionalFrom("id")
        name = map.optionalFrom("name")
        mobile = map.optionalFrom("mobile")
        username = map.optionalFrom("username")
        email = map.optionalFrom("email")
        password = map.optionalFrom("password")
        imageURL = map.optionalFrom("image_url")
        role = map.optionalFrom("role")
        type = map.optionalFrom("type")
        roles = map.optionalFrom("roles")
        profile = map.optionalFrom("profile")
        permissions = map.optionalFrom("permissions")
        userInfo = map.optionalFrom("user_info")
        addedUserInfo = map.optionalFrom("added_user_info")
        addUserInfo = map.optionalFrom("add_user_info")
        editUserInfo = map.optionalFrom("edit_user_info")
        hospitalName = map.optionalFrom("hospital_name")
        hospitalMobile = map.optionalFrom("hospital_mobile")
        hospitalUserName = map.optionalFrom("hospital_user_name")
        hospitalPassword = map.optionalFrom("hospital_password")
        gov = map.optionalFrom("gov")
        city = map.optionalFrom("city")
        active = map.optionalFrom("active")
        doctorList = map.optionalFrom("doctor_list")
        nurseList = map.optionalFrom("nurse_list")
        insuranceCompanyList = map.optionalFrom("insurance_company_list")
        latitude = map.optionalFrom("Latitude")
        longitude = map.optionalFrom("Longitude")
        hospitalLatitude = map.optionalFrom("latitude")
        hospitalLongitude = map.optionalFrom("longitude")
        address = map.optionalFrom("address")
        website = map.optionalFrom("website")
    }
    
}

